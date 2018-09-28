package pac.capau.modelo;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class FiltroItem {

	private String data_inicial_solicitacao;
	private String data_final_solicitacao;
	private String data_inicial_necessidade;
	private String data_final_necessidade;
	private String grupo;
	private String descricao;
	private String status;
	private String tipo;
	private String setor;
	private String responsavel;
	private String valor;
	private String contratacao_emergencial;
	private String[] data_formatada;

	public String getData_inicial_solicitacao() {
		return data_inicial_solicitacao;
	}

	public void setData_inicial_solicitacao(String data_inicial_solicitacao) {
		this.data_inicial_solicitacao = data_inicial_solicitacao;
	}

	public String getData_final_solicitacao() {
		return data_final_solicitacao;
	}

	public void setData_final_solicitacao(String data_final_solicitacao) {
		this.data_final_solicitacao = data_final_solicitacao;
	}

	public String getData_inicial_necessidade() {
		return data_inicial_necessidade;
	}

	public void setData_inicial_necessidade(String data_inicial_necessidade) {
		this.data_inicial_necessidade = data_inicial_necessidade;
	}

	public String getData_final_necessidade() {
		return data_final_necessidade;
	}

	public void setData_final_necessidade(String data_final_necessidade) {
		this.data_final_necessidade = data_final_necessidade;
	}

	public String getGrupo() {
		return grupo;
	}

	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getSetor() {
		return setor;
	}

	public void setSetor(String setor) {
		this.setor = setor;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getContratacao_emergencial() {
		return contratacao_emergencial;
	}

	public void setContratacao_emergencial(String contratacao_emergencial) {
		this.contratacao_emergencial = contratacao_emergencial;
	}

	public String[] getData_formatada() {
		return data_formatada;
	}

	public void setData_formatada(String[] data_formatada) {
		this.data_formatada = data_formatada;
	}

	public String retornaDataFinal() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		return fmt.format(calendar.getTime());
	}

	public String formataData(String data) {
		this.data_formatada = data.split("/");
		return this.data_formatada[2] + "-" + this.data_formatada[1] + "-" + this.data_formatada[0];
	}

}
