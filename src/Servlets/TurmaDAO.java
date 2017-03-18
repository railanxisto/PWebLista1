package Servlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Conexao.Conexao;
import model.Aluno;
import model.Turmas;

public class TurmaDAO {
	public static ArrayList<Turmas> getTurmas() throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "SELECT  codDisciplina, codTurma, horario1, horario2, horario3, local_1 FROM TURMAS";
		PreparedStatement statement = con.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		ArrayList<Turmas> turmasList = new ArrayList<>();
		while (rs.next()){
			Turmas turmas = new Turmas();
			turmas.setCodDisciplina(rs.getString(1));
			turmas.setCodTurma(rs.getString(2));
			turmas.setHorario1(rs.getInt(3));
			turmas.setHorario2(rs.getInt(4));
			turmas.setHorario3(rs.getInt(5));
			turmas.setLocal1(rs.getInt(6));
			turmasList.add(turmas);
		}
		
		statement.close();
		con.close();

		return turmasList;
	}
	
	public static Turmas getTurma(String codDisciplina, String codTurma) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "SELECT  codDisciplina, codTurma, horario1, horario2, horario3, local_1 FROM TURMAS WHERE CODTURMA=? AND CODDISCIPLINA=?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, codTurma);
		statement.setString(2, codDisciplina);
		ResultSet rs = statement.executeQuery();
		Turmas turma = new Turmas();

		while (rs.next()){
			turma.setCodDisciplina(rs.getString(1));
			turma.setCodTurma(rs.getString(2));
			turma.setHorario1(rs.getInt(3));
			turma.setHorario2(rs.getInt(4));
			turma.setHorario3(rs.getInt(5));
			turma.setLocal1(rs.getInt(6));
		}
		
		statement.close();
		con.close();

		return turma;
	}
	
	public static String tratarHorario(int horario){
		String horarioTexto = "";
		String h1 = Integer.toString(horario);
		switch (h1.substring(0, 1)){
		case "1":
			horarioTexto = horarioTexto + "Dom ";
			break;
		case "2":
			horarioTexto = horarioTexto + "Seg ";
			break;
		case "3":
			horarioTexto = horarioTexto + "Ter ";
			break;
		case "4":
			horarioTexto = horarioTexto + "Qua ";
			break;
		case "5":
			horarioTexto = horarioTexto + "Qui ";
			break;
		case "6":
			horarioTexto = horarioTexto + "Sex ";
			break;
		case "7":
			horarioTexto = horarioTexto + "Sab ";	
			break;
		}
		String horaIni = h1.substring(1,3);
		int duracao = Integer.parseInt(h1.substring(3,4));
		int horaInicial = Integer.parseInt(horaIni);
		horarioTexto = horarioTexto + horaIni + "-" + (horaInicial+duracao);
		
		return horarioTexto;
	}
	
	public static String tratarLocal(int local){
		String localTexto = "";
		String l1 = Integer.toString(local);
		switch (l1.substring(0, 1)){
		case "1":
			localTexto = localTexto + "Did1 ";
			break;
		case "2":
			localTexto = localTexto + "Did2 ";
			break;
		case "3":
			localTexto = localTexto + "Did3 ";
			break;
		case "4":
			localTexto = localTexto + "Did4 ";
			break;
		case "5":
			localTexto = localTexto + "Did5 ";
			break;
		case "6":
			localTexto = localTexto + "Did6 ";
			break;
		}
		System.out.println("L1 " + l1);
		String sala = l1.substring(1,4);
		localTexto = localTexto + sala;
		
		
		return localTexto;
	}
	
}
