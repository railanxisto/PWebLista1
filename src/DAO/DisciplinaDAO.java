package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Conexao.Conexao;
import model.Aluno;

public class DisciplinaDAO {
	public static String getDisciplina(String codDisciplina) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "SELECT NOMEDISCIPLINA FROM DISCIPLINAS WHERE codDisciplina=?";
		String nome = "";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, codDisciplina);
		ResultSet rs = statement.executeQuery();
		while (rs.next()){
			nome = rs.getString(1);
		}
		statement.close();
		con.close();
		return nome;
	}
}
