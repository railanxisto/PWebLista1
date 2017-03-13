<%@page import="DAO.DisciplinaDAO"%>
<%@page import="model.Aluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@page import="DAO.TurmaDAO"%>
<%@page import="model.Turmas"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Escolher Turmas</title>
    
    <script>
        var a = [];
	    function adicionaDisciplina(valor){
	    	if(valor.checked){
	    		a[valor.value] = true;
	    	}else{
	    		a[valor.value] = false;
	    	}
	    	alert(a[valor.value]);
		}
	    
	    function valida_form(){
	    	quantidade = document.forms["formLogin"]["quantidade"].value;
	    	marcados = 0;
	    	for (i=0; i < quantidade; i++){
	    		marcado = document.forms["formLogin"]["a"+i].checked;
	    		if(marcado){
	    			marcados++;
	    		}
	    	}
	    	if(marcados == 0){
	    		alert('Selecione pelo menos uma turma para efetuar a matricula')
	    	}else{
		    	document.formLogin.submit();
	    	}
		}
    </script>

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
	ArrayList<Turmas> turmasList = new ArrayList<Turmas>();
    TurmaDAO TurmaDAO = new TurmaDAO();
    
    Aluno aluno = new Aluno();
    
    long checkUsuario = session.getAttribute("matricula") == null ? 0 : (long) session.getAttribute("matricula");
	long matricula = 0;
    if(checkUsuario == 0){
		response.sendRedirect("../pages/login.html?");
	}else{  
	    matricula = ((long) session.getAttribute("matricula"));
	}
   	turmasList = TurmaDAO.getTurmas();
	session.putValue("quantidade", turmasList.size()); //Grava a session com o Login


%>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 10px">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Seleção de Turmas</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  Olá, <%=session.getAttribute("nomeAluno")%><i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
       
							 <li class="divider"></li>
                        <li><a href="../../Controle/controleLogin.jsp?action=Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	</div>
	<div>
        <div id="page-wrapper"  style="padding-top: 5%">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Selecione Suas Turmas
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            <form method="post" id="formLogin" role="form" name="formLogin" action="../../Controle/controleListTurmas.jsp">
                            	<input type="hidden" name="quantidade" value="<%=turmasList.size()%>">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
    
                                        	<th><center>Código Disciplina</th>
                                            <th><center>Nome da Disciplina</th>
                                            <th><center>Código da Turma</th>
                                            <th><center>Horarios</th>
                                            <th><center>Matricular</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% for(int i=0; i < turmasList.size() ;i++){
                                    	String nomeDisciplina = DisciplinaDAO.getDisciplina(turmasList.get(i).getCodDisciplina()); 
                                    %>
										<tr class="odd gradeX">
                                            <td><center><%=turmasList.get(i).getCodDisciplina()%></td>
											<td><center><%=nomeDisciplina%></td>	
					                        <td><center><%=turmasList.get(i).getCodTurma()%></td>
                                            <td><center>
														<%=TurmaDAO.tratarHorario(turmasList.get(i).getHorario1())%>
                                            			<% if(turmasList.get(i).getHorario2() != 0){%> e <%=TurmaDAO.tratarHorario(turmasList.get(i).getHorario2()) %> <%} %> 
                                            			<% if(turmasList.get(i).getHorario3() != 0){%> e <%=TurmaDAO.tratarHorario(turmasList.get(i).getHorario3()) %> <%} %>                                            
                                            </td>
                                            <td><center><INPUT TYPE="checkbox" id="a<%=i%>" NAME="a<%=i%>" VALUE="<%=i%>" onclick=""></td> 
                                        </tr>
                                    <%} %>
                                    </tbody>
                                </form>
                                </table>
                                <center><a class="btn btn-lg btn-success btn-block" onclick="valida_form(this);">Matricular</a></center>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>