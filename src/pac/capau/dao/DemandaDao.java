package pac.capau.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import pac.capau.modelo.Demanda;

public class DemandaDao {

	@PersistenceContext
	private EntityManager manager;

	public Long adiciona(Demanda demanda) {
		manager.persist(demanda);
		return demanda.getId();
	}

	public void altera(Demanda demanda) {
		manager.merge(demanda);
	}

	public List<Demanda> lista() {
		return manager.createQuery("select d from Demanda d", Demanda.class).getResultList();
	}

	public Demanda buscaPorId(Long id) {
		return manager.find(Demanda.class, id);
	}

	public void remove(Demanda demanda) {
		manager.remove(buscaPorId(demanda.getId()));
	}

}
