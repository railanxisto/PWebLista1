package model;

public class Turmas {
	private String codTurma;
	public String getCodTurma() {
		return codTurma;
	}
	public void setCodTurma(String codTurma) {
		this.codTurma = codTurma;
	}
	public String getCodDisciplina() {
		return codDisciplina;
	}
	public void setCodDisciplina(String codDisciplina) {
		this.codDisciplina = codDisciplina;
	}
	public int getHorario1() {
		return horario1;
	}
	public void setHorario1(int horario1) {
		this.horario1 = horario1;
	}
	public int getHorario2() {
		return horario2;
	}
	public void setHorario2(int horario2) {
		this.horario2 = horario2;
	}
	public int getHorario3() {
		return horario3;
	}
	public void setHorario3(int horario3) {
		this.horario3 = horario3;
	}
	public int getLocal1() {
		return local1;
	}
	public void setLocal1(int local1) {
		this.local1 = local1;
	}

	private String codDisciplina;
	private int horario1;
	private int horario2;
	private int horario3;
	private int local1;
	
}
