package pac.capau.controller;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import pac.capau.dao.PerfilDao;
import pac.capau.dao.SetorDao;
import pac.capau.dao.UsuarioDao;
import pac.capau.modelo.Setor;
import pac.capau.modelo.Usuario;

@Transactional
@Controller
@RequestMapping("/usuario")
public class UsuarioController {

	private List<Usuario> lista_usuario;
	private List<Setor> lista_setores;

	@Autowired
	UsuarioDao dao;

	@Autowired
	SetorDao dao_setor;

	@Autowired
	PerfilDao dao_perfil;

	@Secured("hasAnyRole('ROLE_Gerenciador', 'ROLE_Gerenciador')")
	@RequestMapping("/novo")
	public String novoUsuario(Model model) {
		this.lista_setores = dao_setor.lista();
		if (this.lista_setores.size() == 0) {
			return "redirect:/setor/novo";
		}

		model.addAttribute("setores", this.lista_setores);
		model.addAttribute("perfis", dao_perfil.lista());
		return "usuario/novo";
	}

	@Secured("hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')")
	@RequestMapping("/adiciona")
	public String adiciona(@Valid Usuario usuario, BindingResult result) {

		if (result.hasErrors()) {
			return "redirect:novo";
		} else if (usuario.comparaSenhas() == false) {
			return "redirect:novo";
		} else if (dao.buscaPorEmail(usuario.getEmail()).size() > 0) {
			return "redirect:novo";
		}
		// aplica o hash a senha fornecida
		usuario.setSenha(new BCryptPasswordEncoder().encode(usuario.getSenha()));

		// Adiciona no banco de dados
		dao.adiciona(usuario);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		model.addAttribute("usuarios", dao.lista());
		return "usuario/lista";
	}

	@Secured("hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')")
	@RequestMapping("/remove")
	public String remove(Long id) {
		dao.remove(id);
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("usuario", dao.buscaPorId(id));
		return "usuario/exibe";
	}

	@Secured("hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')")
	@RequestMapping("/edita")
	public String edita(Long id, Model model) {

		model.addAttribute("setores", dao_setor.lista());
		model.addAttribute("usuario", dao.buscaPorId(id));
		model.addAttribute("perfis", dao_perfil.lista());
		return "usuario/edita";
	}

	@Secured("hasAnyRole('ROLE_Administrador', 'ROLE_Gerenciador')")
	@RequestMapping("/altera")
	public String altera(@Valid Usuario usuario, BindingResult result) {
		this.lista_usuario = dao.buscaPorEmail(usuario.getEmail());
		if (result.hasErrors()) {
			return "redirect:edita?id=" + usuario.getId();
		} else if (usuario.comparaSenhas() == false) {
			return "redirect:edita?id=" + usuario.getId();
		} else if (this.lista_usuario.size() > 0 && this.lista_usuario.get(0).getId() != usuario.getId()) {
			return "redirect:edita?id=" + usuario.getId();
		}

		// aplica o hash a senha fornecida
		usuario.setSenha(new BCryptPasswordEncoder().encode(usuario.getSenha()));

		// Altera no banco
		dao.altera(usuario);
		return "redirect:lista";
	}

}
