package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Conexao.Conexao;
import model.Matriculas;
import model.Turmas;

public class MatriculaDAO {
	public static void insertMatricula(Matriculas matricula) throws SQLException{
		if(!verificaSeExiste(matricula)){
			Connection con = new Conexao().getConnection();
			String sql = "INSERT INTO MATRICULAS (CODTURMA, MATRICULA, CODDISCIPLINA) VALUES (?,?,?)";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, matricula.getCodTurma());
			statement.setLong(2, matricula.getMatricula());
			statement.setString(3, matricula.getCodDisciplina());
			statement.executeUpdate();
			statement.close();
			con.close();
		}
	}
	
	public static boolean verificaSeExiste(Matriculas matricula) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "SELECT * FROM MATRICULAS WHERE MATRICULA = ? AND CODTURMA like ? AND CODDISCIPLINA like ?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setLong(1, matricula.getMatricula());
		statement.setString(2, matricula.getCodTurma());
		statement.setString(3, matricula.getCodDisciplina());
		ResultSet rs = statement.executeQuery();
		while (rs.next()){
			return true;
		}
		statement.close();
		con.close();
		return false;
	}
	
	public static ArrayList<Matriculas> getMatriculas(long matricula) throws SQLException{
		Connection con = new Conexao().getConnection();
		System.out.println("================");
		System.out.println("Matricula " + matricula);


		String sql = "SELECT CODDISCIPLINA, CODTURMA FROM MATRICULAS WHERE MATRICULA=?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setLong(1, matricula);
		ResultSet rs = statement.executeQuery();
		ArrayList<Matriculas> matriculasList = new ArrayList<>();
		while (rs.next()){
			Matriculas matriculaobj = new Matriculas();
			System.out.println("1 " + rs.getString(1));

			matriculaobj.setCodDisciplina(rs.getString(1));
			matriculaobj.setCodTurma(rs.getString(2));
			matriculasList.add(matriculaobj);
			System.out.println("2 " + matriculaobj.getCodTurma());

		}
		
		statement.close();
		con.close();

		return matriculasList;
	}
}
