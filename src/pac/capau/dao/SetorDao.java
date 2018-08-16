package pac.capau.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import pac.capau.modelo.Setor;

@Repository
public class SetorDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Setor setor) {
		manager.persist(setor);
	}

	public void altera(Setor setor) {
		manager.merge(setor);
	}

	public List<Setor> lista() {
		return manager.createQuery("select c from Setor c", Setor.class).getResultList();
	}

	public List<Setor> buscaPorNome(String nome) {
		return manager.createQuery("select c from Setor c where c.nome = :nome", Setor.class).setParameter("nome", nome)
				.getResultList();
	}

	public String buscaNomePorId(Long id) {
		return manager.createQuery("select c.nome from Setor c where c.id = :id", String.class).setParameter("id", id)
				.getSingleResult();
	}

	public Setor buscaPorId(Long id) {
		return manager.find(Setor.class, id);
	}

	public void remove(Setor setor) {
		manager.remove(buscaPorId(setor.getId()));
	}

}
