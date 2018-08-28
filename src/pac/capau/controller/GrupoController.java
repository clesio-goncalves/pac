package pac.capau.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pac.capau.dao.EstudoPreliminarDao;
import pac.capau.dao.GerenciamentoRiscoDao;
import pac.capau.dao.GrupoDao;
import pac.capau.modelo.EstudoPreliminar;
import pac.capau.modelo.Grupo;
import pac.capau.modelo.Usuario;

@Transactional
@Controller
@RequestMapping("/grupo")
public class GrupoController {

	private Usuario usuario;
	private List<Grupo> lista_grupo;
	private List<EstudoPreliminar> lista_estudo_preliminar;

	@Autowired
	GrupoDao dao;

	@Autowired
	EstudoPreliminarDao dao_estudo_preliminar;

	@Autowired
	GerenciamentoRiscoDao dao_gerenciamento_risco;

	@RequestMapping("/novo")
	public String grupo(Model model) {
		model.addAttribute("usuario", retornaUsuarioLogado()); // Pego o usuário logado
		return "grupo/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Grupo grupo, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:novo";
		} else if (dao.buscaPorNome(grupo.getNome()).size() > 0) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		return "redirect:/demanda/planejamento/grupo/novo?id=" + dao.adiciona(grupo).getId();
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_grupo = dao.lista();
		for (Grupo grupo : this.lista_grupo) {
			grupo.setTotal_itens(dao.totalItensGrupo(grupo.getId()));
		}
		model.addAttribute("grupos", this.lista_grupo);
		return "grupo/lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		this.lista_grupo = dao.buscaPorId(id);

		if (this.lista_grupo.size() > 0) {
			this.lista_grupo.get(0).setTotal_itens(dao.totalItensGrupo(id));
			model.addAttribute("grupo", this.lista_grupo.get(0));
		}

		this.lista_estudo_preliminar = dao_estudo_preliminar.buscaEstudoPreliminarPeloGrupoId(id);
		if (this.lista_estudo_preliminar.size() > 0) {
			model.addAttribute("estudo_preliminar", this.lista_estudo_preliminar.get(0));
		}
		model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloGrupoId(id));
		return "grupo/exibe";
	}

	@RequestMapping("/remove")
	public String remove(Long id, HttpServletResponse response) {
		if (possuiPermissaoGrupo(id)) {
			if (dao.totalItensGrupo(id) == 0) { // remove se não houver itens vinculados
				dao_estudo_preliminar.removeEstudoPreliminarPeloGrupoId(id); // Remove Estudo Preliminar
				dao_gerenciamento_risco.removeGerenciamentoRiscoPeloGrupoId(id); // Remove Gerenciamento Risco
				dao.remove(id);
			}
			return "redirect:lista";
		} else {
			response.setStatus(403);
			return "redirect:/403";
		}
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model, HttpServletResponse response) {
		if (possuiPermissaoGrupo(id)) {
			model.addAttribute("usuario", dao.buscarUsuarioIdPeloGrupoId(id));
			model.addAttribute("grupo", dao.buscaPorId(id).get(0));
			return "grupo/edita";
		} else {
			response.setStatus(403);
			return "redirect:/403";
		}
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Grupo grupo, BindingResult result, HttpServletResponse response) {
		if (possuiPermissaoGrupo(grupo.getId())) {
			this.lista_grupo = dao.buscaPorNome(grupo.getNome());
			if (result.hasErrors()) {
				return "redirect:edita?id=" + grupo.getId();
			} else if (this.lista_grupo.size() > 0 && this.lista_grupo.get(0).getId() != grupo.getId()) {
				return "redirect:edita?id=" + grupo.getId();
			}

			dao.altera(grupo);
			return "redirect:lista";
		} else {
			response.setStatus(403);
			return "redirect:/403";
		}
	}

	private boolean possuiPermissaoGrupo(Long id) {
		this.usuario = retornaUsuarioLogado(); // Pego o usuário logado
		// O demandante só realiza a ação se for dono do grupo
		if (this.usuario.getPerfil().getNome().equals("ROLE_Demandante")) {
			if (dao.buscarUsuarioIdPeloGrupoId(id) == this.usuario.getId()) {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
	}

	private Usuario retornaUsuarioLogado() {
		return (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

}
