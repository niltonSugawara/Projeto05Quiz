<%@page import="br.com.fatecpggrupo1.Question"%>
<%@page import="br.com.fatecpggrupo1.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean tested = false;
    double media =0;
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
        
         <% if (tested== true && media>=80  ){%>
         <hr>
         <h2>Parabéns,ótimo resultado,você acertou <%=media%>% das questões</h2>
         <hr>
         <%}%>
         <% if (tested== true && media>=50 && media<80){%>
         <hr>
         <h2> Seu resultado foi bom,você acertou <%=media%>% das questões</h2>
         <hr>
         <%}%>
       <% if (tested== true && media>=0 && media<50){%>
         <hr>
         <h2>Infelizmente seuresultado foi fraco,você acertou <%=media%>% das questões</h2>
         <h2>Tente novamente para obter um resultado melhor</h2>
         <hr>
         <%}%>  
         
         
         
        <h3><a href="quiz.jsp">Realizar QUIZ</a></h3>
    </body>
</html>
