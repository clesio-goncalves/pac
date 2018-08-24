package pac.capau.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import pac.capau.modelo.GerenciamentoRisco;

@Repository
public class GerenciamentoRiscoDao {

	@PersistenceContext
	private EntityManager manager;

	public GerenciamentoRisco adiciona(GerenciamentoRisco derenciamentoRisco) {
		manager.persist(derenciamentoRisco);
		return derenciamentoRisco;
	}

	public void altera(GerenciamentoRisco derenciamentoRisco) {
		manager.merge(derenciamentoRisco);
	}

	public List<GerenciamentoRisco> listaPeloItemId(Long id) {
		return manager
				.createQuery("select gr from GerenciamentoRisco gr where gr.item.id = :id", GerenciamentoRisco.class)
				.setParameter("id", id).getResultList();
	}

	public List<GerenciamentoRisco> listaPeloGrupoId(Long id) {
		return manager
				.createQuery("select gr from GerenciamentoRisco gr where gr.grupo.id = :id", GerenciamentoRisco.class)
				.setParameter("id", id).getResultList();
	}

	public GerenciamentoRisco buscaPorId(Long id) {
		return manager.find(GerenciamentoRisco.class, id);
	}

	public void remove(GerenciamentoRisco derenciamentoRisco) {
		manager.remove(buscaPorId(derenciamentoRisco.getId()));
	}

	public void removeGerenciamentoRiscoPeloItemId(Long id) {
		manager.createQuery("delete from GerenciamentoRisco gr where gr.item.id = :id").setParameter("id", id)
				.executeUpdate();
	}

}
