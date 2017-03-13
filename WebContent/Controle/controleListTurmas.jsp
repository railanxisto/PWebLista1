<%@page import="DAO.MatriculaDAO"%>
<%@page import="DAO.TurmaDAO"%>
<%@page import="model.Matriculas"%>
<%@page import="model.Aluno"%>
<%@page import="model.Turmas"%>


<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	if(session.isNew()){
		response.sendRedirect("../FrontEnd/pages/login.html");
	}

	Aluno aluno = new Aluno();
	int quantidade = 0;
	long matricula = 0;
	long checkUsuario = session.getAttribute("matricula") == null ? 0 : (long) session.getAttribute("matricula");
	if(checkUsuario == 0){
		response.sendRedirect("../pages/login.html?");
	}else{  
		quantidade = Integer.parseInt(request.getParameter("quantidade")); 
		matricula = checkUsuario;
	}
	
	ArrayList<Turmas> turmasList = new ArrayList<Turmas>();
   	turmasList = TurmaDAO.getTurmas();
	MatriculaDAO matriculaDAO = new MatriculaDAO();
	for (int i = 0; i < quantidade; i++){
		boolean myCheckBox = request.getParameter("a"+i) != null;
		if(myCheckBox){	
			Matriculas matriculaobj = new Matriculas();
			matriculaobj.setCodDisciplina(turmasList.get(i).getCodDisciplina());
			matriculaobj.setCodTurma(turmasList.get(i).getCodTurma());
			matriculaobj.setMatricula(matricula);
			matriculaDAO.insertMatricula(matriculaobj);
		}
	}
	response.sendRedirect("../FrontEnd/pages/final.jsp");

%>
</body>
</html>