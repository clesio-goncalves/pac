package pac.capau.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import pac.capau.modelo.InformacoesGerenciais;

@Repository
public class InformacoesGerenciaisDao {

	@PersistenceContext
	private EntityManager manager;

	public InformacoesGerenciais adiciona(InformacoesGerenciais informacoesGerenciais) {
		manager.persist(informacoesGerenciais);
		return informacoesGerenciais;
	}

	public void altera(InformacoesGerenciais informacoesGerenciais) {
		manager.merge(informacoesGerenciais);
	}

	public InformacoesGerenciais buscaPorId(Long id) {
		return manager.find(InformacoesGerenciais.class, id);
	}

	public void remove(InformacoesGerenciais informacoesGerenciais) {
		manager.remove(buscaPorId(informacoesGerenciais.getId()));
	}

}
