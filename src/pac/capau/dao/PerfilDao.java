package pac.capau.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import pac.capau.modelo.Perfil;

@Repository
public class PerfilDao {

	@PersistenceContext
	private EntityManager manager;

	public List<Perfil> lista() {
		return manager.createQuery("select p from Perfil p", Perfil.class).getResultList();
	}

}
