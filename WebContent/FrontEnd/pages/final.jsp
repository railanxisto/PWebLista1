<!DOCTYPE html>
<%@page import="DAO.TurmaDAO"%>
<%@page import="model.Turmas"%>
<%@page import="DAO.MatriculaDAO"%>
<%@page import="DAO.DisciplinaDAO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Matriculas"%>

<html lang="en">

<head>
<script type="text/javascript" language="javascript">
	function getVar(param){
		var wl = window.location.href;
		var params = urlDecode(wl.substring(wl.indexOf("?")+1));
		return(params[param]);
	}
	
	function voltar(param){
		window.location="../../Controle/controleLogin.jsp?action=Logout"; 
	}
	
		function closePage(){
			close();
		}
</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Comprovante de Matricula</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<% 
	long matricula = 0;
	
	long checkUsuario = session.getAttribute("matricula") == null ? 0 : (long) session.getAttribute("matricula");
	if(checkUsuario == 0){
		response.sendRedirect("../pages/login.html?");
	}else{  
		matricula = checkUsuario;
	}
	
	ArrayList<Matriculas> matriculasList = new ArrayList<>();
	MatriculaDAO matriculaDAO = new MatriculaDAO();
	matriculasList = matriculaDAO.getMatriculas(matricula);
	


%>


</head>

<body>
<div id="wrapper">
     <div class="panel panel-default">
                 <div class="row">
     
                     <div class="col-lg-12">
     
                        <div class="panel-heading">
                            <center><h1><b>COMPROVANTE DE MATRICULA</b></h1>
                        </div>
    <table class="table table-striped table-bordered table-hover">
     <thead>
                                        <tr>
                                        	<th><center>Matricula do Aluno</th>
                                            <td><center><%=session.getAttribute("matricula")%></th>
                                        </tr>
                                        <tr>
                                        	<th><center>Nome do Aluno</th>
                                            <td><center><%=session.getAttribute("nomeAluno")%></th>
                                        </tr>
                                        <tr>
                                        	<th><center>Curso do Aluno</th>
                                            <td><center><%=session.getAttribute("codCurso")%></th>
                                        </tr>
      </thead>
     </table>
                        
                        
                        
                        <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
    
                                        	<th><center>Código da Turma</th>
                                            <th><center>Nome da Disciplina</th>
                                            <th><center>Código da Disciplina</th>
                                            <th><center>Horarios</th>
                                            <th><center>Local</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% for(int i=0; i < matriculasList.size() ;i++){
                                    	System.out.println("");
                                    	Turmas turma = new Turmas();
                                    	turma = TurmaDAO.getTurma(matriculasList.get(i).getCodDisciplina(), matriculasList.get(i).getCodTurma());
                                    	String nomeDisciplina = DisciplinaDAO.getDisciplina(turma.getCodDisciplina()); 
                                    %>
										<tr class="odd gradeX">
											<td><center><%=turma.getCodTurma()%></td>
                                            <td><center><%=turma.getCodDisciplina()%></td>
											<td><center><%=nomeDisciplina%></td>	
                                            <td><center><%=TurmaDAO.tratarHorario(turma.getHorario1())%> 
                                            			<% if(turma.getHorario2() != 0){%> e <%=TurmaDAO.tratarHorario(turma.getHorario2())%><%} %> 
                                            			<% if(turma.getHorario3() != 0){%> e <%=TurmaDAO.tratarHorario(turma.getHorario3())%><%} %>
                                            </td>
                                            <td>
                                            	<center><%=TurmaDAO.tratarLocal(turma.getLocal1())%>
                                         	</td> 
                                        </tr>
                                    <%} %>
                                    </tbody>
                                </form>
                                </table>
                                <center><a class="btn btn-lg btn-success btn-block" onclick="voltar(this);">Sair</a></center>
                                
    </div>
    </div>
    </div>
<div>
    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
