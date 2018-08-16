package pac.capau.modelo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Item {

	@Id
	private Long codigo;

	@NotNull
	@Size(max = 50)
	private String tipo;

	@Size(max = 50)
	private String tipo_material;

	@Size(max = 50)
	private String tipo_servico;

	@NotNull
	private String descricao;

	@NotNull
	private String descricao_detalhada;

	@NotNull
	private String unidade_fornecimento;

}
