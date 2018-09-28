package pac.capau.modelo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	private Long codigo;

	@NotNull
	@Size(max = 50)
	private String tipo;

	@NotNull
	private String descricao;

	@NotNull
	@Column(columnDefinition = "TEXT")
	private String descricao_detalhada;

	@NotNull
	private String unidade_fornecimento;

	@NotNull
	private int quantidade;

	@NotNull
	private Double valor_unitario_estimado;

	@Transient
	private String valor_unitario;

	@Transient
	private String valor_total_estimado;

	private String informacoes_orcamentarias;

	@NotNull
	private String status;

	@OneToOne
	@NotNull
	private Usuario usuario;

	@OneToOne(cascade = CascadeType.REMOVE)
	private InformacoesGerenciais informacoes_gerenciais;

	@ManyToOne
	private Grupo grupo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao_detalhada() {
		return descricao_detalhada;
	}

	public void setDescricao_detalhada(String descricao_detalhada) {
		this.descricao_detalhada = descricao_detalhada;
	}

	public String getUnidade_fornecimento() {
		return unidade_fornecimento;
	}

	public void setUnidade_fornecimento(String unidade_fornecimento) {
		this.unidade_fornecimento = unidade_fornecimento;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public Double getValor_unitario_estimado() {
		return valor_unitario_estimado;
	}

	public void setValor_unitario_estimado(Double valor_unitario_estimado) {
		this.valor_unitario_estimado = valor_unitario_estimado;
	}

	public String getValor_unitario() {
		return valor_unitario;
	}

	public void setValor_unitario(String valor_unitario) {
		this.valor_unitario = valor_unitario;
	}

	public String getValor_total_estimado() {
		return valor_total_estimado;
	}

	public void setValor_total_estimado(String valor_total_estimado) {
		this.valor_total_estimado = valor_total_estimado;
	}

	public String getInformacoes_orcamentarias() {
		return informacoes_orcamentarias;
	}

	public void setInformacoes_orcamentarias(String informacoes_orcamentarias) {
		this.informacoes_orcamentarias = informacoes_orcamentarias;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public InformacoesGerenciais getInformacoes_gerenciais() {
		return informacoes_gerenciais;
	}

	public void setInformacoes_gerenciais(InformacoesGerenciais informacoes_gerenciais) {
		this.informacoes_gerenciais = informacoes_gerenciais;
	}

	public Grupo getGrupo() {
		return grupo;
	}

	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}
}
