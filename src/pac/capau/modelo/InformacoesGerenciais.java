package pac.capau.modelo;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class InformacoesGerenciais {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	private String grau_prioridade;

	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar data_estimada;

	private boolean contratacao_emergencial;

	private boolean dispensa;

	private boolean renovacao_contrato;

	private boolean capacitacao_servidores;

	private boolean vinculacao_outro_item;

	private String outro_item_vinculado;

	@NotNull
	@OneToOne
	private Item item;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getGrau_prioridade() {
		return grau_prioridade;
	}

	public void setGrau_prioridade(String grau_prioridade) {
		this.grau_prioridade = grau_prioridade;
	}

	public Calendar getData_estimada() {
		return data_estimada;
	}

	public void setData_estimada(Calendar data_estimada) {
		this.data_estimada = data_estimada;
	}

	public boolean isContratacao_emergencial() {
		return contratacao_emergencial;
	}

	public void setContratacao_emergencial(boolean contratacao_emergencial) {
		this.contratacao_emergencial = contratacao_emergencial;
	}

	public boolean isDispensa() {
		return dispensa;
	}

	public void setDispensa(boolean dispensa) {
		this.dispensa = dispensa;
	}

	public boolean isRenovacao_contrato() {
		return renovacao_contrato;
	}

	public void setRenovacao_contrato(boolean renovacao_contrato) {
		this.renovacao_contrato = renovacao_contrato;
	}

	public boolean isCapacitacao_servidores() {
		return capacitacao_servidores;
	}

	public void setCapacitacao_servidores(boolean capacitacao_servidores) {
		this.capacitacao_servidores = capacitacao_servidores;
	}

	public boolean isVinculacao_outro_item() {
		return vinculacao_outro_item;
	}

	public void setVinculacao_outro_item(boolean vinculacao_outro_item) {
		this.vinculacao_outro_item = vinculacao_outro_item;
	}

	public String getOutro_item_vinculado() {
		return outro_item_vinculado;
	}

	public void setOutro_item_vinculado(String outro_item_vinculado) {
		this.outro_item_vinculado = outro_item_vinculado;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

}
