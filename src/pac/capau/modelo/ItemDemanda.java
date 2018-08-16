package pac.capau.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

@Entity
public class ItemDemanda {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	private int quantidade;

	@NotNull
	private Double valor_unitario_estimado;

	@Transient
	private Double valor_total_estimado;

	@NotNull
	private String informacoes_orcamentarias;

	@NotNull
	private String vincular_grupo;

}
