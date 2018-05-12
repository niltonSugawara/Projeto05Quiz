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
    }
    %>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz de Conhecimentos Gerais</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <h1>Quiz de Conhecimentos Gerais</h1>
        <h2>Teste seus conhecimentos e cultura</h2>
        
         <% if (tested== true && media>=80 ){%>
         <hr>
         <h2>Parabéns,ótimo resultado,você acertou <%=media%>% das questões</h2>
         <hr>
         <%}%>
         <%if (tested== true && media>=50 && media<80){%>
         <hr>
         <h2> Seu resultado foi bom,você acertou <%=media%>% das questões</h2>
         <hr>
         <%}%>
         <%if (tested== true && media>=0 && media<50){%>
         <hr>
         <h2>Infelizmente seu resultado foi fraco,você acertou <%=media%>% das questões</h2>
         <h2>Tente novamente para obter um resultado melhor</h2>
         <hr>
         <%}%>  
        
        <%String name="";
        if (request.getParameter("user") == "deslogado"){%><script language="JavaScript">alert("Para acessar o questionário é necessário estar logado!");</script><%}%>
        <!--tela de login--> 
       
       <%try {
           if(request.getParameter("btnUsuario") != null){
               String nomeUsuario = request.getParameter("inputUsuario");
               session.setAttribute("nomeSessao", nomeUsuario);
           }
           else 
           {             
           }
       } catch(Exception ex) {
           %><script language="JavaScript">alert("Digite um valor válido!");</script><%
       }      
       %>
       
       <%if(session.getAttribute("nomeSessao") == null || session.getAttribute("nomeSessao").equals("")) {%>
        <form>
            Login:
            <input type="text" id="inputEmail" placeholder="Nome" name="inputUsuario" required>
            <button type="submit" name="btnUsuario" class="btn">Logar</button>
            </form>
        <%} else {
        name=(String)session.getAttribute("nomeSessao"); %>
               
        <p>Olá, <%=name%></p>
        <form name="form1" method="post">
        <input type="hidden" name="buttonName">
        <input type="button" value="Deslogar" onclick="button1()" class="btn">
        </form>
        
       <h3><a href="quiz.jsp">Realizar QUIZ</a></h3>
        
        <%}%>
            
            <% 
        if(request.getParameter("buttonName") != null) {
               session.invalidate();
               response.sendRedirect("home.jsp");
        }
    %>


    <script language="JavaScript">
        
        function button1()
        {
            document.form1.buttonName.value = "yes";
            form1.submit();
        } 
        
    </script>
    <h1>TOP 10</h1>
    <table name="top10">
        <tr>
            <th>Nome</th>
            <th>Resultado</th>
            <th>Data</th>
        </tr>
    <%
        for(int i = 0; i < BD.getUsuarios().size(); i++){%>
        <tr>
            <td><%=BD.getUsuarios().get(i).getNome() %></td>
        <td><%= BD.getUsuarios().get(i).getResultadoTeste() %></td>
        <td><%=BD.getUsuarios().get(i).getDataTeste().getDayOfMonth() + "/" +
                BD.getUsuarios().get(i).getDataTeste().getMonth()+ "/" +
                BD.getUsuarios().get(i).getDataTeste().getYear() + " " +
                BD.getUsuarios().get(i).getDataTeste().getHour() + ":" +
                BD.getUsuarios().get(i).getDataTeste().getMinute() %>  </td>
        </tr>
        <%}%>
    </table>
    </body>
</html>
