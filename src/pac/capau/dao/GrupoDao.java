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
		return manager.createNativeQuery(
				"select id, nome, (select count(*) from Item as i where i.grupo_id = g.id) as 'total_itens' from Grupo as g;",
				Grupo.class).getResultList();
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

	public void remove(Long id) {
		manager.createQuery("delete from Grupo g where g.id = :id").setParameter("id", id).executeUpdate();
	}

}
