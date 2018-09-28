package pac.capau.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pac.capau.dao.ItemDao;
import pac.capau.modelo.Usuario;

@Controller
public class IndexController {

	private Usuario usuario;

	@Autowired
	ItemDao dao;

	@RequestMapping("/")
	public String index(Model model) {
		this.usuario = retornaUsuarioLogado();
		if (this.usuario.getPerfil().getNome().equals("ROLE_Administrador")) {
			model.addAttribute("qnt_item_pendente", dao.qntItemPendente());
		} else if (this.usuario.getPerfil().getNome().equals("ROLE_Gerenciador")) {
			model.addAttribute("qnt_item_pendente", dao.qntItemPendente());
		} else if (this.usuario.getPerfil().getNome().equals("ROLE_Coordenador")) {
			model.addAttribute("qnt_item_pendente", dao.qntItemPendenteDoCoordenador(this.usuario.getId()));
		}
		return "index";
	}

	@RequestMapping("/erro")
	public String erro() {
		return "erro/erro";
	}

	@RequestMapping("/404")
	public String erro404() {
		return "erro/404";
	}

	@RequestMapping("/403")
	public String erro403() {
		return "erro/403";
	}

	private Usuario retornaUsuarioLogado() {
		return (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

}
