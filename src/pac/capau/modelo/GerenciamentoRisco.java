package pac.capau.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity
public class GerenciamentoRisco {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	private String descricao;

	@NotNull
	private String probabilidade;

	@NotNull
	private String impacto;

	@NotNull
	@Column(columnDefinition = "TEXT")
	private String acao_preventiva;

	@NotNull
	private String responsavel_acao_preventiva;

	@NotNull
	@Column(columnDefinition = "TEXT")
	private String acao_contingencia;

	@NotNull
	private String responsavel_acao_contingencia;

	@NotNull
	@ManyToOne
	private Item item;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getProbabilidade() {
		return probabilidade;
	}

	public void setProbabilidade(String probabilidade) {
		this.probabilidade = probabilidade;
	}

	public String getImpacto() {
		return impacto;
	}

	public void setImpacto(String impacto) {
		this.impacto = impacto;
	}

	public String getAcao_preventiva() {
		return acao_preventiva;
	}

	public void setAcao_preventiva(String acao_preventiva) {
		this.acao_preventiva = acao_preventiva;
	}

	public String getResponsavel_acao_preventiva() {
		return responsavel_acao_preventiva;
	}

	public void setResponsavel_acao_preventiva(String responsavel_acao_preventiva) {
		this.responsavel_acao_preventiva = responsavel_acao_preventiva;
	}

	public String getAcao_contingencia() {
		return acao_contingencia;
	}

	public void setAcao_contingencia(String acao_contingencia) {
		this.acao_contingencia = acao_contingencia;
	}

	public String getResponsavel_acao_contingencia() {
		return responsavel_acao_contingencia;
	}

	public void setResponsavel_acao_contingencia(String responsavel_acao_contingencia) {
		this.responsavel_acao_contingencia = responsavel_acao_contingencia;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

}
