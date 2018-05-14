<%@page import="java.util.Collections"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="br.com.fatecpggrupo1.BD"%>
<%@page import="br.com.fatecpggrupo1.Usuario"%>
<%@page import="br.com.fatecpggrupo1.Question"%>
<%@page import="br.com.fatecpggrupo1.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean tested = false;
    double media = 0;
    int aux=0;
    if(request.getParameter("tested")!=null)
    {
        tested = true;
        int count = 0;
        for (int i = 0; i <Quiz.getTest().size(); i++) {
            Question q = Quiz.getTest().get(i);
            String p = request.getParameter(q.getQuestion());
            if(q.getAnswer().equals(p))
                count++;
            }
        
        media = 100.0 * ((double) (count)/Quiz.getTest().size());
        
        String nome = (session.getAttribute("nomeSessao").toString());
        
        Usuario u = new Usuario();
        u.setNome(nome);
        u.setDataTeste(LocalDateTime.now());
        u.setResultadoTeste(media);
        
        BD.getUsuarios().add(u);
        BD.getTop10().add(u);
        response.sendRedirect(request.getRequestURI());
        }
    
    %>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz de Conhecimentos Gerais</title>
        <style>
            body {background-color: activecaption}
            main {width: 955px; margin: -1px auto 10px;border: 1px solid captiontext;background-color: white}
            h1,h2,h3,p,form,table {margin-left: 30px}
            #top10 {float: right}
            
        </style>
    </head>
    <body>
        
        <main>
       
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        
        <center><h1>Quiz de Conhecimentos Gerais</h1></center>
        <h2>Teste seus conhecimentos e cultura</h2>
        
        
        
        <!--Tela de login--> 
        <%String name="";%>
        <!--Se o valor do btnUsuario for diferente de null, 
        ele obtém aquele nome inserido no login pelo usuário-->
       <%try {
           if(request.getParameter("btnUsuario") != null){
               String nomeUsuario = request.getParameter("inputUsuario");
               session.setAttribute("nomeSessao", nomeUsuario);
           }
           else 
           {             
           }
       } catch(Exception ex) {
           
       }      
       %>
       <!--Se o nome da sessão for nulo ou vazio (usuário deslogado) a aplicação 
       exibe o campo de login para o usuário entrar-->
       <%if(session.getAttribute("nomeSessao") == null || session.getAttribute("nomeSessao").equals("")) {%>
        <form>
            Login:
            <input type="text" id="inputEmail" placeholder="Nome" name="inputUsuario" required>
            <button type="submit" name="btnUsuario" class="btn">Logar</button>
            </form>
        <%} else {
        //Se o usuário já estiver logado, o sistema só busca o nome da sessão 
        //para atribuir à variável "name" e exibir a mensagem de boas vindas
        name=(String)session.getAttribute("nomeSessao"); %>  
        <p>Olá, <%=name%></p>
        <form name="form1" method="post">
        <input type="hidden" name="buttonName">
        <input type="button" value="Sair" onclick="button1()" class="btn">
        </form>
         <% try {
            if(BD.getUsuarios().get(BD.getUsuarios().size()-1).getNome() != null) { %>          
         <% if (session.getAttribute("nomeSessao").toString() == BD.getUsuarios().get(BD.getUsuarios().size()-1).getNome() && BD.getUsuarios().get(BD.getUsuarios().size()-1).getResultadoTeste() >= 80 ){%>
         <hr>
         <h2>Parabéns <%=BD.getUsuarios().get(BD.getUsuarios().size()-1).getNome()%>,ótimo resultado,você acertou <%=BD.getUsuarios().get(BD.getUsuarios().size()-1).getResultadoTeste()%>% das questões</h2>
         <hr>
         <%}%>
         <% if (session.getAttribute("nomeSessao").toString() == BD.getUsuarios().get(BD.getUsuarios().size()-1).getNome() &&
                 BD.getUsuarios().get(BD.getUsuarios().size()-1).getResultadoTeste() >= 50 && 
                 BD.getUsuarios().get(BD.getUsuarios().size()-1).getResultadoTeste() < 80){%>

         <hr>
         <h2> Seu resultado foi bom <%=BD.getUsuarios().get(BD.getUsuarios().size()-1).getNome()%>,você acertou <%=BD.getUsuarios().get(BD.getUsuarios().size()-1).getResultadoTeste()%>% das questões</h2>
         <hr>
         <%}%>
        <% if (session.getAttribute("nomeSessao").toString() == BD.getUsuarios().get(BD.getUsuarios().size()-1).getNome() &&
                 BD.getUsuarios().get(BD.getUsuarios().size()-1).getResultadoTeste() >= 0 && 
                 BD.getUsuarios().get(BD.getUsuarios().size()-1).getResultadoTeste() < 50){%>
         <hr>
         <h2>Infelizmente seu resultado foi fraco <%=BD.getUsuarios().get(BD.getUsuarios().size()-1).getNome()%>,você acertou <%=BD.getUsuarios().get(BD.getUsuarios().size()-1).getResultadoTeste()%>% das questões</h2>
         <h2>Tente novamente para obter um resultado melhor</h2>
         <hr>
         <%}%>  
        <%
          }
       } catch(Exception ex) {
         %><%
       }    %>
       <h3><a href="quiz.jsp">Realizar QUIZ</a></h3>
           
       <h1>Seus 10 Ultimos Testes</h1>
           <table name="10log">
        <tr>
            <th>Nome</th>
            <th>Resultado</th>
            <th>Data</th>
        </tr>
        <% for(int i = 0; i < BD.getUsuarios().size(); i++){
        if (session.getAttribute("nomeSessao").toString() == BD.getUsuarios().get(i).getNome()){%>
        <tr>
        <td><%=BD.getUsuarios().get(i).getNome() %></td>
        <td><%= BD.getUsuarios().get(i).getResultadoTeste() %></td>
        <td><%=BD.getUsuarios().get(i).getDataTeste().getDayOfMonth() + "/" +
                BD.getUsuarios().get(i).getDataTeste().getMonth()+ "/" +
                BD.getUsuarios().get(i).getDataTeste().getYear() + " " +
                BD.getUsuarios().get(i).getDataTeste().getHour() + ":" +
                BD.getUsuarios().get(i).getDataTeste().getMinute() %>  </td>
        </tr>
        <%}}%>
        
           </table>
        <%}%>
            
            

    <!-- Função JavaScript que é chamada pelo botão "Sair"-->
    <script language="JavaScript">

        function button1()
        {
            document.form1.buttonName.value = "deslogou";
            form1.submit();
        } 
        
    </script>
    <!-- Com a chamada da função do button1, a comparação do if abaixo
    é validada, e a sessão é invalidada, redirecioando à home novamente-->
    <% 
        if(request.getParameter("buttonName") != null) {
               session.invalidate();
               response.sendRedirect("home.jsp");
        }
    %>
    <div id="top10">
    <h1>TOP 10</h1>

    <table name="top10">
        <tr>
             <th>Posição</th>
            <th>Nome</th>
            <th>Resultado</th>
            <th>Data</th>
        </tr>
    <%
        
        Collections.sort(BD.getTop10());
        for(int i = 0; i < BD.getTop10().size(); i++){%>
        <tr>
            <td><%=i%></td>
        <td><%=BD.getTop10().get(i).getNome() %></td>
        <td><%= BD.getTop10().get(i).getResultadoTeste() %></td>
        <td><%=BD.getTop10().get(i).getDataTeste().getDayOfMonth() + "/" +
                BD.getTop10().get(i).getDataTeste().getMonth()+ "/" +
                BD.getTop10().get(i).getDataTeste().getYear() + " " +
                BD.getTop10().get(i).getDataTeste().getHour() + ":" +
                BD.getTop10().get(i).getDataTeste().getMinute() %> </td>
        </tr>
        <%
         if (i>=10){i = BD.getTop10().size();}
       }
        %>
    </table>
    </div>
    <div id="top10Ult">
    <h1>Ultimos 10 </h1>
    <table name="top10">
        <tr>
            <th>Nome</th>
            <th>Resultado</th>
            <th>Data</th>
            <th>Hora</th>
        </tr>
    <%
        aux = 0;
        for(int i = BD.getUsuarios().size()-1; i >= 0;i--){%>
        <tr>
        <td><%=BD.getUsuarios().get(i).getNome() %></td>
        <td><%= BD.getUsuarios().get(i).getResultadoTeste() %></td>
        <td><%=BD.getUsuarios().get(i).getDataTeste().getDayOfMonth() + "/" +
                BD.getUsuarios().get(i).getDataTeste().getMonth()+ "/" +
                BD.getUsuarios().get(i).getDataTeste().getYear() + " "%>
        </td><td>
                <%=
                BD.getUsuarios().get(i).getDataTeste().getHour() + ":" +
                BD.getUsuarios().get(i).getDataTeste().getMinute() + ":"  +
                BD.getUsuarios().get(i).getDataTeste().getSecond()%> 
        </td>
        </tr>
        <% aux++;
          if (aux>=10){i=0;}
           }
        %>
    </table>
    </div>
        </main>
    </body>
      <%@include file="WEB-INF/jspf/rodapé.jspf" %>
</html>
