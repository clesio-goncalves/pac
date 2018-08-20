package pac.capau.controller;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import pac.capau.dao.DemandaDao;
import pac.capau.modelo.Demanda;
import pac.capau.modelo.Item;
import pac.capau.modelo.Usuario;

@Transactional
@Controller
@RequestMapping("/demanda")
public class DemandaController {

	@Autowired
	DemandaDao dao;

	@RequestMapping("/nova")
	public String novaDemanda(Model model) {
		return "demanda/novo";
	}

	@RequestMapping("/adiciona")
	public String adiciona(@Valid Item item, @Valid Demanda demanda, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println(result);
			return "redirect:novo";
		}

		// Pego o usuário logado
		Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		demanda.setUsuario(usuario);

		System.out.println("Descrição Item: " + item.getDescricao());

		// Adiciona no banco de dados
		dao.adiciona(demanda);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		model.addAttribute("demandas", dao.lista());
		return "usuario/lista";
	}

}
