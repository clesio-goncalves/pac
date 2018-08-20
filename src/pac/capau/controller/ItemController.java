package pac.capau.controller;

import java.util.Calendar;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import pac.capau.dao.EstudoPreliminarDao;
import pac.capau.dao.InformacoesGerenciaisDao;
import pac.capau.dao.ItemDao;
import pac.capau.modelo.EstudoPreliminar;
import pac.capau.modelo.InformacoesGerenciais;
import pac.capau.modelo.Item;
import pac.capau.modelo.Setor;
import pac.capau.modelo.Usuario;

@Transactional
@Controller
@RequestMapping("/demanda")
public class ItemController {

	@Autowired
	ItemDao dao;

	@Autowired
	InformacoesGerenciaisDao dao_informacoes_gerenciais;

	@Autowired
	EstudoPreliminarDao dao_estudo_preliminar;

	@RequestMapping("/nova")
	public String novaDemanda(Model model) {
		// Pego o usuário logado
		Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("usuario", usuario);
		return "demanda/novo";
	}

	@RequestMapping("/adiciona")
	public String adiciona(@Valid Item item, BindingResult resultItem,
			@Valid InformacoesGerenciais informacoes_gerenciais, BindingResult result_informacoes_gerenciais,
			@Valid EstudoPreliminar estudo_preliminar, BindingResult result_estudo_preliminar) {

		/* INFORMAÇÕES GERENCIAIS */
		if (result_informacoes_gerenciais.hasErrors()) {
			System.out.println(result_informacoes_gerenciais);
			return "redirect:nova";
		}
		informacoes_gerenciais.setData_solicitacao(Calendar.getInstance());
		item.setInformacoes_gerenciais(dao_informacoes_gerenciais.adiciona(informacoes_gerenciais));

		/* ESTUDO PRELIMINAR */
		if (result_estudo_preliminar.hasErrors()) {
			System.out.println(result_estudo_preliminar);
			return "redirect:nova";
		}
		item.setEstudo_preliminar(dao_estudo_preliminar.adiciona(estudo_preliminar));

		/* ITEM */
		if (resultItem.hasErrors()) {
			System.out.println(resultItem);
			return "redirect:nova";
		}

		dao.adiciona(item);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		model.addAttribute("itens", dao.lista());
		return "demanda/lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("item", dao.buscaPorId(id));
		return "demanda/exibe";
	}

	@RequestMapping("/remove")
	public String remove(Item item) {
		dao.remove(item);
		return "redirect:lista";
	}

}
