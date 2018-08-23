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

	public void adiciona(Grupo grupo) {
		manager.persist(grupo);
	}

	public void altera(Grupo grupo) {
		manager.merge(grupo);
	}

	public List<Grupo> lista() {
		return manager.createQuery("select g from Grupo g", Grupo.class).getResultList();
	}

	public List<Grupo> buscaPorNome(String nome) {
		return manager.createQuery("select g from Grupo g where g.nome = :nome", Grupo.class).setParameter("nome", nome)
				.getResultList();
	}

	public String buscaNomePorId(Long id) {
		return manager.createQuery("select g.nome from Grupo g where g.id = :id", String.class).setParameter("id", id)
				.getSingleResult();
	}

	public Grupo buscaPorId(Long id) {
		return manager.find(Grupo.class, id);
	}

	public void remove(Grupo grupo) {
		manager.remove(buscaPorId(grupo.getId()));
	}

}
