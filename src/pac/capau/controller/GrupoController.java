package pac.capau.controller;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import pac.capau.dao.GrupoDao;
import pac.capau.modelo.Grupo;

@Transactional
@Controller
@RequestMapping("/grupo")
public class GrupoController {

	private List<Grupo> lista_grupo;

	@Autowired
	GrupoDao dao;

	@RequestMapping("/novo")
	public String grupo() {
		return "grupo/novo";
	}

	@RequestMapping("/adiciona")
	public String adiciona(@Valid Grupo grupo, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:novo";
		} else if (dao.buscaPorNome(grupo.getNome()).size() > 0) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(grupo);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		model.addAttribute("grupos", dao.lista());
		return "grupo/lista";
	}

	@RequestMapping("/remove")
	public String remove(Grupo grupo) {
		dao.remove(grupo);
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("grupo", dao.buscaPorId(id));
		return "grupo/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("grupo", dao.buscaPorId(id));
		return "grupo/edita";
	}

	@RequestMapping("/altera")
	public String altera(@Valid Grupo grupo, BindingResult result) {
		this.lista_grupo = dao.buscaPorNome(grupo.getNome());
		if (result.hasErrors()) {
			return "redirect:edita?id=" + grupo.getId();
		} else if (this.lista_grupo.size() > 0 && this.lista_grupo.get(0).getId() != grupo.getId()) {
			return "redirect:edita?id=" + grupo.getId();
		}

		dao.altera(grupo);
		return "redirect:lista";
	}

}
