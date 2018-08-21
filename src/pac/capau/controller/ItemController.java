package pac.capau.controller;

import java.util.Calendar;
import java.util.List;

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
import pac.capau.modelo.Usuario;

@Transactional
@Controller
@RequestMapping("/demanda")
public class ItemController {

	private List<EstudoPreliminar> lista_estudo_preliminar;

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
			@Valid InformacoesGerenciais informacoes_gerenciais, BindingResult result_informacoes_gerenciais) {

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

		return "redirect:/demanda/planejamento/novo?id=" + dao.adiciona(item).getId();
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		model.addAttribute("itens", dao.lista());
		return "demanda/lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("item", dao.buscaPorId(id));

		this.lista_estudo_preliminar = dao_estudo_preliminar.buscaEstudoPreliminarPorItemId(id);

		if (this.lista_estudo_preliminar.size() > 0) {
			model.addAttribute("estudo_preliminar", this.lista_estudo_preliminar.get(0));
		}

		return "demanda/exibe";
	}

	@RequestMapping("/remove")
	public String remove(Item item) {
		dao.remove(item);
		return "redirect:lista";
	}

}
