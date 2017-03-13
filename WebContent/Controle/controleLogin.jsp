<%@page import="DAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
	function chamar_alert(){
		alert("Preencha os campos");
	}
</script>
<title></title>
</head>

<body>
<%

String action = request.getParameter("action"); 


if (action.equalsIgnoreCase("Logar")){
  long matricula;

  // dados informados no formulário
  matricula = Long.parseLong(request.getParameter("matricula"));
 
  Aluno aluno = new Aluno();
  AlunoDAO alunoDAO = new AlunoDAO();
  aluno = alunoDAO.loginAluno(matricula);
  if(aluno != null){
	  //int tipoUsuario = usuarioDAO.getTipoUsuario(usuario.getIdUsuario());
	  session.putValue("matricula", aluno.getMatricula()); //Grava a session com o Login
	  session.putValue("nomeAluno", aluno.getNomeAluno()); //Grava a session com o Login
	  session.putValue("codCurso", aluno.getCodCurso());
	  response.sendRedirect("../FrontEnd/pages/listTurmas.jsp");
  }else{
	  response.sendRedirect("../FrontEnd/pages/login.html?erro=1");
  }
}

if (action.equalsIgnoreCase("Logout")){
	  String login;
	  String senha;

	  // dados informados no formulário
	  session.putValue("matricula", null); 
	 
	  session.putValue("quantidade", null); 
	  session.putValue("nomealuno", null); 
	  response.sendRedirect("../FrontEnd/pages/login.html");

}
%>

</body>
</html>