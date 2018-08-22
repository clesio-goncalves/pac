package pac.capau.controller;

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
import pac.capau.dao.ItemDao;
import pac.capau.modelo.EstudoPreliminar;
import pac.capau.modelo.GerenciamentoRisco;
import pac.capau.modelo.Item;

@Transactional
@Controller
@RequestMapping("/demanda/planejamento")
public class PlanejamentoController {

	private GerenciamentoRisco gerenciamento_risco;
	private Item item;

	@Autowired
	ItemDao dao;

	@Autowired
	EstudoPreliminarDao dao_estudo_preliminar;

	@Autowired
	GerenciamentoRiscoDao dao_gerenciamento_risco;

	@RequestMapping("/novo")
	public String planejamento(Long id, Model model) {

		this.item = dao.buscaPorId(id);

		if (this.item == null) { // se o ID não existir
			return "redirect:/demanda/nova";
		} else if (dao_estudo_preliminar.buscaEstudoPreliminarPorItemId(id).size() > 0) {
			return "redirect:/demanda/nova"; // se houver estudo_preliminar cadastrado para o item
		}

		model.addAttribute("riscos", dao_gerenciamento_risco.lista(this.item.getId()));
		model.addAttribute("item", id);
		return "planejamento/novo";
	}

	@RequestMapping("/adiciona")
	public String adicionaPlanejamento(@Valid EstudoPreliminar estudo_preliminar,
			BindingResult result_estudo_preliminar) {

		/* ESTUDOS PRELIMINARES */
		if (result_estudo_preliminar.hasErrors()) {
			System.out.println(result_estudo_preliminar);
			return "redirect:nova";
		}

		dao_estudo_preliminar.adiciona(estudo_preliminar);
		return "redirect:/demanda/lista";
	}

	@RequestMapping(value = "/risco/adiciona", method = RequestMethod.POST)
	public String adicionaRisco(HttpServletRequest request, HttpServletResponse response, Model model) {

		this.gerenciamento_risco = new GerenciamentoRisco();
		this.gerenciamento_risco.setItem(this.item);
		this.gerenciamento_risco.setDescricao(request.getParameter("descricao"));
		this.gerenciamento_risco.setProbabilidade(request.getParameter("probabilidade"));
		this.gerenciamento_risco.setImpacto(request.getParameter("impacto"));
		this.gerenciamento_risco.setAcao_preventiva(request.getParameter("acao_preventiva"));
		this.gerenciamento_risco.setResponsavel_acao_preventiva(request.getParameter("responsavel_acao_preventiva"));
		this.gerenciamento_risco.setAcao_contingencia(request.getParameter("acao_contingencia"));
		this.gerenciamento_risco
				.setResponsavel_acao_contingencia(request.getParameter("responsavel_acao_contingencia"));

		dao_gerenciamento_risco.adiciona(this.gerenciamento_risco);
		model.addAttribute("riscos", dao_gerenciamento_risco.lista(this.item.getId()));

		return "planejamento/risco/lista";
	}

	@RequestMapping(value = "/risco/remove", method = RequestMethod.POST)
	public String removeRisco(HttpServletRequest request, HttpServletResponse response, Model model) {

		System.out.println("Removendo...............................");
		
		this.gerenciamento_risco = new GerenciamentoRisco();
		this.gerenciamento_risco.setId(Long.parseLong(request.getParameter("risco_id")));

		dao_gerenciamento_risco.remove(this.gerenciamento_risco);
		model.addAttribute("riscos", dao_gerenciamento_risco.lista(this.item.getId()));

		return "planejamento/risco/lista";
	}

	@RequestMapping(value = "/risco/edita", method = RequestMethod.POST)
	public String editaRisco(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("risco",
				dao_gerenciamento_risco.buscaPorId(Long.parseLong(request.getParameter("risco_id"))));
		return "planejamento/risco/modal_edita";
	}

	@RequestMapping(value = "/risco/altera", method = RequestMethod.POST)
	public String alteraRisco(HttpServletRequest request, HttpServletResponse response, Model model) {

		System.out.println("Alterando..........................................");

		this.gerenciamento_risco = new GerenciamentoRisco();
		this.gerenciamento_risco.setItem(this.item);
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
		model.addAttribute("riscos", dao_gerenciamento_risco.lista(this.item.getId()));

		return "planejamento/risco/lista";
	}
}
