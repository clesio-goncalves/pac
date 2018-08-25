package pac.capau.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import pac.capau.modelo.EstudoPreliminar;

@Repository
public class EstudoPreliminarDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(EstudoPreliminar estudoPreliminar) {
		manager.persist(estudoPreliminar);
	}

	public void altera(EstudoPreliminar estudoPreliminar) {
		manager.merge(estudoPreliminar);
	}

	public List<EstudoPreliminar> buscaEstudoPreliminarPeloItemId(Long id) {
		return manager.createQuery("select ep from EstudoPreliminar ep where ep.item.id = :id", EstudoPreliminar.class)
				.setParameter("id", id).getResultList();
	}

	public List<EstudoPreliminar> buscaEstudoPreliminarPeloGrupoId(Long id) {
		return manager.createQuery("select ep from EstudoPreliminar ep where ep.grupo.id = :id", EstudoPreliminar.class)
				.setParameter("id", id).getResultList();
	}

	public void removeEstudoPreliminarPeloItemId(Long id) {
		manager.createQuery("delete from EstudoPreliminar ep where ep.item.id = :id").setParameter("id", id)
				.executeUpdate();
	}

	public void removeEstudoPreliminarPeloGrupoId(Long id) {
		manager.createQuery("delete from EstudoPreliminar ep where ep.grupo.id = :id").setParameter("id", id)
				.executeUpdate();
	}

}
