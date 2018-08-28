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
import pac.capau.dao.SetorDao;
import pac.capau.dao.UsuarioDao;
import pac.capau.modelo.EstudoPreliminar;
import pac.capau.modelo.FiltroItem;
import pac.capau.modelo.InformacoesGerenciais;
import pac.capau.modelo.Item;
import pac.capau.modelo.Usuario;

@Transactional
@Controller
@RequestMapping("/demanda")
public class ItemController {

	private List<EstudoPreliminar> lista_estudo_preliminar;
	private PlanejamentoController pc;
	private Long grupo_id;
	private FiltroItem filtro_item;
	private Usuario usuario;

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

	@Autowired
	SetorDao dao_setor;

	@Autowired
	UsuarioDao dao_responsavel;

	@RequestMapping("/nova")
	public String novaDemanda(Model model) {
		model.addAttribute("usuario", retornaUsuarioLogado()); // Pego o usuário logado
		model.addAttribute("grupos", dao_grupo.lista());
		return "demanda/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Item item, BindingResult resultItem,
			@Valid InformacoesGerenciais informacoes_gerenciais, BindingResult result_informacoes_gerenciais,
			HttpServletRequest request) {

		if (result_informacoes_gerenciais.hasErrors()) {
			return "redirect:nova";
		} else if (resultItem.hasErrors()) {
			return "redirect:nova";
		}

		informacoes_gerenciais.setData_solicitacao(Calendar.getInstance());
		item.setInformacoes_gerenciais(dao_informacoes_gerenciais.adiciona(informacoes_gerenciais));

		// Adiciona Item no banco
		item = dao.adiciona(item);

		// Caso seja informado o grupo
		if (request.getParameter("grupo.id") != null) {
			return "redirect:lista";
		} else {
			return "redirect:/demanda/planejamento/item/novo?id=" + item.getId();
		}

	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		model.addAttribute("grupos", dao_grupo.listaDemanda());
		model.addAttribute("setores", dao_setor.lista());
		model.addAttribute("responsaveis", dao_responsavel.lista());
		model.addAttribute("itens", dao.lista());
		return "demanda/lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("item", dao.buscaPorId(id));
		this.grupo_id = dao.buscarGrupoIdPeloItemId(id);

		if (this.grupo_id == null) { // se o item não estiver vinculado a um grupo
			this.lista_estudo_preliminar = dao_estudo_preliminar.buscaEstudoPreliminarPeloItemId(id);
			model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloItemId(id));
		} else {
			this.lista_estudo_preliminar = dao_estudo_preliminar.buscaEstudoPreliminarPeloGrupoId(this.grupo_id);
			model.addAttribute("riscos", dao_gerenciamento_risco.listaPeloGrupoId(this.grupo_id));
		}

		if (this.lista_estudo_preliminar.size() > 0) {
			model.addAttribute("estudo_preliminar", this.lista_estudo_preliminar.get(0));
		}

		return "demanda/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model, HttpServletResponse response) {
		if (possuiPermissaoItem(id)) {
			model.addAttribute("usuario", dao.buscarUsuarioIdPeloItemId(id));
			model.addAttribute("grupos", dao_grupo.lista());
			model.addAttribute("item", dao.buscaPorId(id));
			return "demanda/edita";
		} else {
			response.setStatus(403);
			return "redirect:/403";
		}
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Item item, BindingResult resultItem, HttpServletRequest request,
			HttpServletResponse response) {
		if (possuiPermissaoItem(item.getId())) {
			if (resultItem.hasErrors()) {
				return "redirect:edita?id=" + item.getId();
			}
			dao_informacoes_gerenciais.altera(item.getInformacoes_gerenciais());
			dao.altera(item);

			// Caso seja informado o grupo na edição
			if (request.getParameter("grupo.id") != null) {
				dao_estudo_preliminar.removeEstudoPreliminarPeloItemId(item.getId()); // Remove Estudo Preliminar
				dao_gerenciamento_risco.removeGerenciamentoRiscoPeloItemId(item.getId()); // Remove Gerenciamento Risco
				return "redirect:lista";
			} else {
				return "redirect:/demanda/planejamento/item/edita?id=" + item.getId();
			}
		} else {
			response.setStatus(403);
			return "redirect:/403";
		}
	}

	@RequestMapping("/remove")
	public String remove(Long id, HttpServletResponse response) {
		if (possuiPermissaoItem(id)) {
			if (dao.buscarGrupoIdPeloItemId(id) == null) { // sem grupo vinculado
				dao_estudo_preliminar.removeEstudoPreliminarPeloItemId(id); // Remove Estudo Preliminar
				dao_gerenciamento_risco.removeGerenciamentoRiscoPeloItemId(id); // Remove Gerenciamento Risco
			}
			dao.remove(id); // Remove Item e Informações Gerenciais
			return "redirect:lista";
		} else {
			response.setStatus(403);
			return "redirect:/403";
		}
	}

	@RequestMapping(value = "/filtrar", method = RequestMethod.POST)
	public String filtra(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("itens", dao.filtraItens(trataParametrosRequest(request)));
		return "demanda/import_lista/tabela";
	}

	@RequestMapping(value = "/risco/adiciona", method = RequestMethod.POST)
	public void adicionaRisco(HttpServletRequest request, HttpServletResponse response, Model model) {
		this.pc = new PlanejamentoController();
		this.pc.adicionaRisco(request, response, model);
	}

	private FiltroItem trataParametrosRequest(HttpServletRequest request) {
		this.filtro_item = new FiltroItem();
		this.filtro_item.setData_inicial_solicitacao(request.getParameter("data_inicial_solicitacao"));
		this.filtro_item.setData_final_solicitacao(request.getParameter("data_final_solicitacao"));
		this.filtro_item.setData_inicial_necessidade(request.getParameter("data_inicial_necessidade"));
		this.filtro_item.setData_final_necessidade(request.getParameter("data_final_necessidade"));
		this.filtro_item.setGrupo(request.getParameter("grupo"));
		this.filtro_item.setDescricao(request.getParameter("descricao"));
		this.filtro_item.setTipo(request.getParameter("tipo"));
		this.filtro_item.setSetor(request.getParameter("setor"));
		this.filtro_item.setResponsavel(request.getParameter("responsavel"));
		this.filtro_item.setValor(request.getParameter("valor"));
		this.filtro_item.setContratacao_emergencial(request.getParameter("contratacao_emergencial"));

		trataDatas();

		return this.filtro_item;
	}

	private void trataDatas() {
		// Data Solicitação
		this.filtro_item.setData_inicial_solicitacao(trataDataInicial(this.filtro_item.getData_inicial_solicitacao()));
		this.filtro_item.setData_final_solicitacao(trataDataFinal(this.filtro_item.getData_final_solicitacao()));
	}

	private String trataDataInicial(String data_inicial) {
		// Se a data inicial não estiver sido informada, será atribuido 01/01/2018
		if (data_inicial.equals("")) {
			return "2018-01-01";
		} else {
			return this.filtro_item.formataData(data_inicial);
		}
	}

	private String trataDataFinal(String data_final) {
		// Se a data final não estiver sido informada, sera atribuido a data atual do
		// servidor
		if (data_final.equals("")) {
			return this.filtro_item.retornaDataFinal();
		} else {
			return this.filtro_item.formataData(data_final);
		}
	}

	private boolean possuiPermissaoItem(Long id) {
		this.usuario = retornaUsuarioLogado(); // Pego o usuário logado
		// O demandante só realiza a ação se for dono do item
		if (this.usuario.getPerfil().getNome().equals("ROLE_Demandante")) {
			if (dao.buscarUsuarioIdPeloItemId(id) == this.usuario.getId()) {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
	}

	private Usuario retornaUsuarioLogado() {
		return (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}
