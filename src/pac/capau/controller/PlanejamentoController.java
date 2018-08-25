package pac.capau.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pac.capau.dao.EstudoPreliminarDao;
import pac.capau.dao.GerenciamentoRiscoDao;
import pac.capau.dao.GrupoDao;
import pac.capau.dao.ItemDao;
import pac.capau.modelo.EstudoPreliminar;
import pac.capau.modelo.GerenciamentoRisco;
import pac.capau.modelo.Grupo;
import pac.capau.modelo.Item;

@Transactional
@Controller
@RequestMapping("/demanda/planejamento")
public class PlanejamentoController {

	private GerenciamentoRisco gerenciamento_risco;
	private Item item;
	private Grupo grupo;
	private List<EstudoPreliminar> estudo_preliminar;

	@Autowired
	ItemDao dao;

	@Autowired
	GrupoDao dao_grupo;

	@Autowired
	EstudoPreliminarDao dao_estudo_preliminar;

	@Autowired
	GerenciamentoRiscoDao dao_gerenciamento_risco;

	@RequestMapping("/item/novo")
	public String planejamentoItem(Long id, Model model) {
		this.item = dao.buscaPorId(id);

		if (this.item == null) { // se o ID não existir
			return "redirect:/demanda/nova";
		} else if (dao_estudo_preliminar.buscaEstudoPreliminarPeloItemId(id).size() > 0) {
			return "redirect:/demanda/nova"; // se houver estudo_preliminar cadastrado para o item
		}

		model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloItemId(this.item.getId()));
		model.addAttribute("item", this.item);
		model.addAttribute("view", "item");
		return "planejamento/novo";
	}

	@RequestMapping("/grupo/novo")
	public String planejamentoGrupo(Long id, Model model) {

		this.grupo = dao_grupo.buscaPorId(id);

		if (this.grupo == null) { // se o ID não existir
			return "redirect:/grupo/novo";
		} else if (dao_estudo_preliminar.buscaEstudoPreliminarPeloGrupoId(id).size() > 0) {
			return "redirect:/grupo/novo"; // se houver estudo_preliminar cadastrado para o grupo
		}

		model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloGrupoId(this.grupo.getId()));
		model.addAttribute("grupo", this.grupo);
		model.addAttribute("view", "grupo");
		return "planejamento/novo";
	}

	@RequestMapping("/adiciona")
	public String adicionaPlanejamento(@Valid EstudoPreliminar estudo_preliminar,
			BindingResult result_estudo_preliminar, HttpServletRequest request) {

		if (result_estudo_preliminar.hasErrors()) {
			return "redirect:nova";
		}

		dao_estudo_preliminar.adiciona(estudo_preliminar);

		if (request.getParameter("grupo.id") == null) {
			return "redirect:/demanda/lista";
		} else {
			return "redirect:/grupo/lista";
		}
	}

	@RequestMapping("/item/edita")
	public String editaItem(Long id, Model model) {
		this.item = dao.buscaPorId(id);
		this.estudo_preliminar = dao_estudo_preliminar.buscaEstudoPreliminarPeloItemId(id);

		if (this.item == null) { // se o ID não existir
			return "redirect:/demanda/nova";
		} else if (this.estudo_preliminar.size() == 0) {
			return "redirect:/demanda/planejamento/item/novo?id=" + this.item.getId();
			// se não houver estudo_preliminar cadastrado para o item
		} else {
			model.addAttribute("estudo_preliminar", this.estudo_preliminar.get(0));
		}

		model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloItemId(this.item.getId()));
		model.addAttribute("item", this.item);
		model.addAttribute("view", "item");
		return "planejamento/edita";
	}

	@RequestMapping("/grupo/edita")
	public String editaGrupo(Long id, Model model) {
		this.grupo = dao_grupo.buscaPorId(id);
		this.estudo_preliminar = dao_estudo_preliminar.buscaEstudoPreliminarPeloGrupoId(id);

		if (this.grupo == null) { // se o ID não existir
			return "redirect:/demanda/planejamento/grupo/novo";
		} else if (this.estudo_preliminar.size() == 0) {
			return "redirect:/demanda/planejamento/grupo/novo?id=" + this.grupo.getId();
			// se não houver estudo_preliminar cadastrado para o item
		} else {
			model.addAttribute("estudo_preliminar", this.estudo_preliminar.get(0));
		}

		model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloGrupoId(this.grupo.getId()));
		model.addAttribute("grupo", this.grupo);
		model.addAttribute("view", "grupo");
		return "planejamento/edita";
	}

	@RequestMapping("/altera")
	public String altera(@Valid EstudoPreliminar estudo_preliminar, BindingResult result_estudo_preliminar,
			HttpServletRequest request) {
		if (result_estudo_preliminar.hasErrors()) {
			return "redirect:nova";
		}

		dao_estudo_preliminar.altera(estudo_preliminar);
		if (request.getParameter("grupo.id") == null) {
			return "redirect:/demanda/lista";
		} else {
			return "redirect:/grupo/lista";
		}
	}

	@RequestMapping(value = "/risco/adiciona", method = RequestMethod.POST)
	public String adicionaRisco(HttpServletRequest request, HttpServletResponse response, Model model) {

		this.gerenciamento_risco = new GerenciamentoRisco(); // instancia o objeto

		if (request.getParameter("grupo_id").equals("")) { // Testa se veio da view grupo ou item
			this.item = dao.buscaPorId(Long.parseLong(request.getParameter("item_id")));
			this.gerenciamento_risco.setItem(this.item);
		} else {
			this.grupo = dao_grupo.buscaPorId(Long.parseLong(request.getParameter("grupo_id")));
			this.gerenciamento_risco.setGrupo(this.grupo);
		}

		this.gerenciamento_risco.setDescricao(request.getParameter("descricao"));
		this.gerenciamento_risco.setProbabilidade(request.getParameter("probabilidade"));
		this.gerenciamento_risco.setImpacto(request.getParameter("impacto"));
		this.gerenciamento_risco.setAcao_preventiva(request.getParameter("acao_preventiva"));
		this.gerenciamento_risco.setResponsavel_acao_preventiva(request.getParameter("responsavel_acao_preventiva"));
		this.gerenciamento_risco.setAcao_contingencia(request.getParameter("acao_contingencia"));
		this.gerenciamento_risco
				.setResponsavel_acao_contingencia(request.getParameter("responsavel_acao_contingencia"));

		dao_gerenciamento_risco.adiciona(this.gerenciamento_risco);
		if (request.getParameter("grupo_id").equals("")) { // Testa se veio da view grupo ou item
			model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloItemId(this.item.getId()));
		} else {
			model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloGrupoId(this.grupo.getId()));
		}

		return "planejamento/risco/lista";
	}

	@RequestMapping(value = "/risco/remove", method = RequestMethod.POST)
	public String removeRisco(HttpServletRequest request, HttpServletResponse response, Model model) {
		dao_gerenciamento_risco.remove(Long.parseLong(request.getParameter("risco_id")));

		if (request.getParameter("grupo_id").equals("0")) { // Testa se veio da view grupo ou item
			this.item = dao.buscaPorId(Long.parseLong(request.getParameter("item_id")));
			model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloItemId(this.item.getId()));
		} else {
			this.grupo = dao_grupo.buscaPorId(Long.parseLong(request.getParameter("grupo_id")));
			model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloGrupoId(this.grupo.getId()));
		}

		return "planejamento/risco/lista";
	}

	@RequestMapping(value = "/risco/edita", method = RequestMethod.POST)
	public String editaRisco(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("risco",
				dao_gerenciamento_risco.buscaPorId(Long.parseLong(request.getParameter("risco_id"))));
		return "planejamento/risco/modal_edita";
	}

	@RequestMapping(value = "/risco/exibe", method = RequestMethod.POST)
	public String exibeRisco(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("risco",
				dao_gerenciamento_risco.buscaPorId(Long.parseLong(request.getParameter("risco_id"))));
		return "planejamento/risco/modal_exibe";
	}

	@RequestMapping(value = "/risco/altera", method = RequestMethod.POST)
	public String alteraRisco(HttpServletRequest request, HttpServletResponse response, Model model) {

		this.gerenciamento_risco = new GerenciamentoRisco(); // instancia o objeto

		if (request.getParameter("grupo_id").equals("")) { // Testa se veio da view grupo ou item
			this.item = dao.buscaPorId(Long.parseLong(request.getParameter("item_id")));
			this.gerenciamento_risco.setItem(this.item);
		} else {
			this.grupo = dao_grupo.buscaPorId(Long.parseLong(request.getParameter("grupo_id")));
			this.gerenciamento_risco.setGrupo(this.grupo);
		}

		this.gerenciamento_risco.setId(Long.parseLong(request.getParameter("risco_id")));
		this.gerenciamento_risco.setDescricao(request.getParameter("descricao"));
		this.gerenciamento_risco.setProbabilidade(request.getParameter("probabilidade"));
		this.gerenciamento_risco.setImpacto(request.getParameter("impacto"));
		this.gerenciamento_risco.setAcao_preventiva(request.getParameter("acao_preventiva"));
		this.gerenciamento_risco.setResponsavel_acao_preventiva(request.getParameter("responsavel_acao_preventiva"));
		this.gerenciamento_risco.setAcao_contingencia(request.getParameter("acao_contingencia"));
		this.gerenciamento_risco
				.setResponsavel_acao_contingencia(request.getParameter("responsavel_acao_contingencia"));

		dao_gerenciamento_risco.altera(this.gerenciamento_risco);
		if (request.getParameter("grupo_id").equals("")) { // Testa se veio da view grupo ou item
			model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloItemId(this.item.getId()));
		} else {
			model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloGrupoId(this.grupo.getId()));
		}
		return "planejamento/risco/lista";
	}
}
