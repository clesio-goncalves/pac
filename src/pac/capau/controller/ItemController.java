package pac.capau.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import pac.capau.dao.InformacoesGerenciaisDao;
import pac.capau.dao.ItemDao;
import pac.capau.modelo.EstudoPreliminar;
import pac.capau.modelo.InformacoesGerenciais;
import pac.capau.modelo.Item;
import pac.capau.modelo.Usuario;

@Transactional
@Controller
@RequestMapping("/demanda")
public class ItemController {

	private List<EstudoPreliminar> lista_estudo_preliminar;
	private PlanejamentoController pc;

	@Autowired
	ItemDao dao;

	@Autowired
	InformacoesGerenciaisDao dao_informacoes_gerenciais;

	@Autowired
	EstudoPreliminarDao dao_estudo_preliminar;

	@Autowired
	GerenciamentoRiscoDao dao_gerenciamento_risco;

	@Autowired
	GrupoDao dao_grupo;

	@RequestMapping("/nova")
	public String novaDemanda(Model model) {
		// Pego o usuário logado
		Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("usuario", usuario);
		model.addAttribute("grupos", dao_grupo.lista());
		return "demanda/novo";
	}

	@RequestMapping("/adiciona")
	public String adiciona(@Valid Item item, BindingResult resultItem,
			@Valid InformacoesGerenciais informacoes_gerenciais, BindingResult result_informacoes_gerenciais,
			HttpServletRequest request) {

		/* INFORMAÇÕES GERENCIAIS */
		if (result_informacoes_gerenciais.hasErrors()) {
			return "redirect:nova";
		}
		informacoes_gerenciais.setData_solicitacao(Calendar.getInstance());
		item.setInformacoes_gerenciais(dao_informacoes_gerenciais.adiciona(informacoes_gerenciais));

		/* ITEM */
		if (resultItem.hasErrors()) {
			return "redirect:nova";
		}

		// Caso seja informado o grupo
		if (request.getParameter("grupo.id") != null) {
			return "redirect:lista";
		}

		return "redirect:/demanda/planejamento/item/novo?id=" + dao.adiciona(item).getId();
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		model.addAttribute("itens", dao.lista());
		return "demanda/lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("item", dao.buscaPorId(id));

		this.lista_estudo_preliminar = dao_estudo_preliminar.buscaEstudoPreliminarPeloItemId(id);

		if (this.lista_estudo_preliminar.size() > 0) {
			model.addAttribute("estudo_preliminar", this.lista_estudo_preliminar.get(0));
		}

		model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloItemId(id));
		return "demanda/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		// Pego o usuário logado
		Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("usuario", usuario);
		model.addAttribute("item", dao.buscaPorId(id));
		return "demanda/edita";
	}

	@RequestMapping("/altera")
	public String altera(@Valid Item item, BindingResult resultItem) {
		if (resultItem.hasErrors()) {
			return "redirect:edita?id=" + item.getId();
		}
		// Altera informações gerenciais no banco
		dao_informacoes_gerenciais.altera(item.getInformacoes_gerenciais());
		dao.altera(item);
		return "redirect:/demanda/planejamento/edita?id=" + item.getId();
	}

	@RequestMapping("/remove")
	public String remove(Item item) {
		dao_estudo_preliminar.removeEstudoPreliminarPeloItemId(item.getId()); // Remove Estudo Preliminar
		dao_gerenciamento_risco.removeGerenciamentoRiscoPeloItemId(item.getId()); // Remove Gerenciamento Risco
		dao.remove(item); // Remove Item e Informações Gerenciais
		return "redirect:lista";
	}

	@RequestMapping(value = "/risco/adiciona", method = RequestMethod.POST)
	public void adicionaRisco(HttpServletRequest request, HttpServletResponse response, Model model) {
		this.pc = new PlanejamentoController();
		this.pc.adicionaRisco(request, response, model);
	}

}
