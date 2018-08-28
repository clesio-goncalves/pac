package pac.capau.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import pac.capau.modelo.FiltroItem;
import pac.capau.modelo.Item;

@Repository
public class ItemDao {

	private String sql;

	@PersistenceContext
	private EntityManager manager;

	public Item adiciona(Item item) {
		manager.persist(item);
		return item;
	}

	public void altera(Item item) {
		manager.merge(item);
	}

	public List<Item> lista() {
		return manager
				.createQuery("select i from Item i order by i.informacoes_gerenciais.data_solicitacao desc", Item.class)
				.getResultList();
	}

	public Long buscarGrupoIdPeloItemId(Long id) {
		return manager.createQuery("select i.grupo.id from Item i where i.id = :id", Long.class).setParameter("id", id)
				.getSingleResult();
	}

	public Long buscarUsuarioIdPeloItemId(Long id) {
		return manager.createQuery("select i.usuario.id from Item i where i.id = :id", Long.class)
				.setParameter("id", id).getSingleResult();
	}

	public Item buscaPorId(Long id) {
		return manager.find(Item.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Item i where i.id = :id").setParameter("id", id).executeUpdate();
	}

	public List<Item> filtraItens(FiltroItem filtro_item) {

		sql = "select i from Item as i";

		sql = sql + " where DATE(i.informacoes_gerenciais.data_solicitacao) between '"
				+ filtro_item.getData_inicial_solicitacao() + "' and '" + filtro_item.getData_final_solicitacao() + "'";

		// Data inicial necessidade
		if (!filtro_item.getData_inicial_necessidade().equals("")) {
			filtro_item.formataData(filtro_item.getData_inicial_necessidade());
			sql = sql + " and DATE(i.informacoes_gerenciais.data_estimada) >= '"
					+ filtro_item.formataData(filtro_item.getData_inicial_necessidade()) + "'";
		}

		// Data final necessidade
		if (!filtro_item.getData_final_necessidade().equals("")) {
			sql = sql + " and DATE(i.informacoes_gerenciais.data_estimada) <= '"
					+ filtro_item.formataData(filtro_item.getData_final_necessidade()) + "'";
		}

		// Grupo
		if (filtro_item.getGrupo() != null) {
			sql = sql + " and i.grupo.id = " + filtro_item.getGrupo();
		}

		// Descrição
		if (!filtro_item.getDescricao().equals("")) {
			sql = sql + " and i.descricao like '%" + filtro_item.getDescricao() + "%'";
		}

		// Tipo Item
		if (!filtro_item.getTipo().equals("")) {
			sql = sql + " and i.tipo like '" + filtro_item.getTipo() + "'";
		}

		// Setor
		if (!filtro_item.getSetor().equals("")) {
			sql = sql + " and i.usuario.setor.id = " + filtro_item.getSetor();
		}

		// Responsavel pela demanda
		if (filtro_item.getResponsavel() != null) {
			sql = sql + " and i.usuario.id = " + filtro_item.getResponsavel();
		}

		// Valor total abaixo de:
		if (!filtro_item.getValor().equals("0")) {
			sql = sql + " and (i.quantidade * i.valor_unitario_estimado) <= " + filtro_item.getValor();
		}

		// Contratação emergencial
		if (filtro_item.getContratacao_emergencial().equals("Sim")) {
			sql = sql + " and i.informacoes_gerenciais.contratacao_emergencial = " + true;
		} else {
			sql = sql + " and i.informacoes_gerenciais.contratacao_emergencial = " + false;
		}

		sql = sql + " order by i.informacoes_gerenciais.data_solicitacao desc";

		return manager.createQuery(sql, Item.class).getResultList();

	}

}
