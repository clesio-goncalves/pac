package pac.capau.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

@Entity
public class EstudoPreliminar {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Column(columnDefinition = "TEXT")
	private String necessidade_contratacao;

	@Column(columnDefinition = "TEXT")
	private String ref_outros_instrumentos;

	@Column(columnDefinition = "TEXT")
	private String requisitos_contratacao;

	@NotNull
	@Column(columnDefinition = "TEXT")
	private String estimativa_quantidades;

	@Column(columnDefinition = "TEXT")
	private String levantamento_mercado;

	@NotNull
	@Column(columnDefinition = "TEXT")
	private String metodo_estimativa_preco;

	@Column(columnDefinition = "TEXT")
	private String descricao_solucao;

	@NotNull
	@Column(columnDefinition = "TEXT")
	private String justificativa_parcelamento;

	@Column(columnDefinition = "TEXT")
	private String resultados_pretendidos;

	@Column(columnDefinition = "TEXT")
	private String providencias_adequacao;

	@Column(columnDefinition = "TEXT")
	private String contratacoes_correlatas;

	@NotNull
	@Column(columnDefinition = "TEXT")
	private String declaracao_viabilidade;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNecessidade_contratacao() {
		return necessidade_contratacao;
	}

	public void setNecessidade_contratacao(String necessidade_contratacao) {
		this.necessidade_contratacao = necessidade_contratacao;
	}

	public String getRef_outros_instrumentos() {
		return ref_outros_instrumentos;
	}

	public void setRef_outros_instrumentos(String ref_outros_instrumentos) {
		this.ref_outros_instrumentos = ref_outros_instrumentos;
	}

	public String getRequisitos_contratacao() {
		return requisitos_contratacao;
	}

	public void setRequisitos_contratacao(String requisitos_contratacao) {
		this.requisitos_contratacao = requisitos_contratacao;
	}

	public String getEstimativa_quantidades() {
		return estimativa_quantidades;
	}

	public void setEstimativa_quantidades(String estimativa_quantidades) {
		this.estimativa_quantidades = estimativa_quantidades;
	}

	public String getLevantamento_mercado() {
		return levantamento_mercado;
	}

	public void setLevantamento_mercado(String levantamento_mercado) {
		this.levantamento_mercado = levantamento_mercado;
	}

	public String getMetodo_estimativa_preco() {
		return metodo_estimativa_preco;
	}

	public void setMetodo_estimativa_preco(String metodo_estimativa_preco) {
		this.metodo_estimativa_preco = metodo_estimativa_preco;
	}

	public String getDescricao_solucao() {
		return descricao_solucao;
	}

	public void setDescricao_solucao(String descricao_solucao) {
		this.descricao_solucao = descricao_solucao;
	}

	public String getJustificativa_parcelamento() {
		return justificativa_parcelamento;
	}

	public void setJustificativa_parcelamento(String justificativa_parcelamento) {
		this.justificativa_parcelamento = justificativa_parcelamento;
	}

	public String getResultados_pretendidos() {
		return resultados_pretendidos;
	}

	public void setResultados_pretendidos(String resultados_pretendidos) {
		this.resultados_pretendidos = resultados_pretendidos;
	}

	public String getProvidencias_adequacao() {
		return providencias_adequacao;
	}

	public void setProvidencias_adequacao(String providencias_adequacao) {
		this.providencias_adequacao = providencias_adequacao;
	}

	public String getContratacoes_correlatas() {
		return contratacoes_correlatas;
	}

	public void setContratacoes_correlatas(String contratacoes_correlatas) {
		this.contratacoes_correlatas = contratacoes_correlatas;
	}

	public String getDeclaracao_viabilidade() {
		return declaracao_viabilidade;
	}

	public void setDeclaracao_viabilidade(String declaracao_viabilidade) {
		this.declaracao_viabilidade = declaracao_viabilidade;
	}

}
