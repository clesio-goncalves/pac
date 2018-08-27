package pac.capau.controller;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pac.capau.dao.SetorDao;
import pac.capau.dao.UsuarioDao;
import pac.capau.modelo.Setor;

@Transactional
@Controller
@RequestMapping("/setor")
public class SetorController {

	private List<Setor> lista_setor;

	@Autowired
	SetorDao dao;

	@Autowired
	UsuarioDao dao_usuario;

	@RequestMapping("/novo")
	@Secured({"ROLE_Administrador", "ROLE_Gerenciador"})
	public String setor() {
		return "setor/novo";
	}

	@Secured({"ROLE_Administrador", "ROLE_Gerenciador"})
	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Setor setor, BindingResult result) {

		if (result.hasErrors()) {
			return "redirect:novo";
		} else if (dao.buscaPorNome(setor.getNome()).size() > 0) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(setor);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		model.addAttribute("setors", dao.lista());
		return "setor/lista";
	}

	@RequestMapping("/remove")
	@Secured({"ROLE_Administrador", "ROLE_Gerenciador"})
	public String remove(Long id) {

		// Remove o setor caso não haja usuários cadastrados nesse setor
		if (dao_usuario.buscaUsuarioPorSetor(id).size() > 0) {
			return "redirect:lista";
		}

		dao.remove(id);
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("setor", dao.buscaPorId(id));
		return "setor/exibe";
	}

	@RequestMapping("/edita")
	@Secured({"ROLE_Administrador", "ROLE_Gerenciador"})
	public String edita(Long id, Model model) {
		model.addAttribute("setor", dao.buscaPorId(id));
		return "setor/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	@Secured({"ROLE_Administrador", "ROLE_Gerenciador"})
	public String altera(@Valid Setor setor, BindingResult result) {
		this.lista_setor = dao.buscaPorNome(setor.getNome());
		if (result.hasErrors()) {
			return "redirect:edita?id=" + setor.getId();
		} else if (this.lista_setor.size() > 0 && this.lista_setor.get(0).getId() != setor.getId()) {
			return "redirect:edita?id=" + setor.getId();
		}

		dao.altera(setor);
		return "redirect:lista";
	}

}
