package pac.capau.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import pac.capau.modelo.Item;

@Repository
public class ItemDao {

	@PersistenceContext
	private EntityManager manager;

	public Item adiciona(Item item) {
		manager.persist(item);
		return item;
	}

	public void altera(Item item) {
		manager.merge(item);
	}

	public List<Item> lista() {
		return manager.createQuery("select i from Item i", Item.class).getResultList();
	}

	public Item buscaPorId(Long id) {
		return manager.find(Item.class, id);
	}

	public void remove(Item item) {
		manager.remove(buscaPorId(item.getId()));
	}

}
