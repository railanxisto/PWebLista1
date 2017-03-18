package Servlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Conexao.Conexao;
import model.Aluno;

public class AlunoDAO {	
	public Aluno loginAluno(long matricula) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "SELECT * FROM ALUNOS WHERE matricula=?";
		Aluno aluno = new Aluno();
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setLong(1, matricula);
		ResultSet rs = statement.executeQuery();
		while (rs.next()){
			aluno.setMatricula(rs.getLong(1));
			aluno.setNomeAluno(rs.getString(2));
			aluno.setCodCurso(rs.getInt(3));
			return aluno;
		}
		statement.close();
		con.close();
		return null;
	}
}
