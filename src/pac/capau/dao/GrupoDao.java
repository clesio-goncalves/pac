package pac.capau.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import pac.capau.modelo.Grupo;

@Repository
public class GrupoDao {

	@PersistenceContext
	private EntityManager manager;

	public Grupo adiciona(Grupo grupo) {
		manager.persist(grupo);
		return grupo;
	}

	public void altera(Grupo grupo) {
		manager.merge(grupo);
	}

	public List<Grupo> lista() {
		return manager.createQuery("select g from Grupo g", Grupo.class).getResultList();
	}

	public Long totalItensGrupo(Long id) {
		return manager.createQuery("select count(*) from Item i where i.grupo.id = :id", Long.class)
				.setParameter("id", id).getSingleResult();
	}

	public List<Grupo> buscaPorNome(String nome) {
		return manager.createQuery("select g from Grupo g where g.nome = :nome", Grupo.class).setParameter("nome", nome)
				.getResultList();
	}

	public List<Grupo> buscaPorId(Long id) {
		return manager.createQuery("select g from Grupo g where g.id = :id", Grupo.class).setParameter("id", id)
				.getResultList();
	}

	public void remove(Long id) {
		manager.createQuery("delete from Grupo g where g.id = :id").setParameter("id", id).executeUpdate();
	}

}
