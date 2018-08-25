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
		return manager.createQuery("select s from Setor s", Setor.class).getResultList();
	}

	public List<Setor> buscaPorNome(String nome) {
		return manager.createQuery("select s from Setor s where s.nome = :nome", Setor.class).setParameter("nome", nome)
				.getResultList();
	}

	public String buscaNomePorId(Long id) {
		return manager.createQuery("select s.nome from Setor s where s.id = :id", String.class).setParameter("id", id)
				.getSingleResult();
	}

	public Setor buscaPorId(Long id) {
		return manager.find(Setor.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Setor s where s.id = :id").setParameter("id", id).executeUpdate();
	}

}
