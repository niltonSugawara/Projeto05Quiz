<%-- 
    Document   : sobre
    Created on : 11/05/2018, 01:31:23
    Author     : nilsonli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz do Grupo 01</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <h1>Desenvolvedores do Quiz</h1>
           <main role="main" class="container">
            <h1>Grupo 01</h1>
            <h2> Integrantes</h2>
            <p> O GRupo 01 é formado pelos seguintes integrantes:</p>
            <table class="table table-sm">
                <%--<thead class="thead-dark">
                    <tr><th>View</th></tr>
                    <tr><th>Nome</th></tr>
                    <tr><th>Contato</th></tr>
                </thead> --%>
                <tbody>
                    <tr><th>View</th><th><img src="img/Newton Swegara.jpg" alt=""width="200"height="200"/></th><th><img src="img/Fabio Pecora.jpg" alt=""width="200"height="200"/></th><th><img src="img/Thiago.jpg" alt=""width="200"height="200"/></th><th><img src="img/Nilson Lima.jpg" alt=""width="200"height="200"/></th></tr>                
                    <tr><th>Nome:</th><th>Nilton Sugawara</th><th>Fábio Pecora</th><th>Tiago Thomas Assis</th><th>Nilson José de Lima</th></tr>
                    <tr><th>e-mail:</th><th><a href="mailto:nilton.sugawara@gmail.com" title="">nilton.sugawara@gmail.com</a></th>
                        <th><a href="mailto:brener_bg@hotmail.com" title="">pecorafatec@gmail.com</a></th>
                        <th><a href="mailto:tiagotassis505@gmail.com" title="">tiagotassis505@gmail.com</a></th>
                        <th><a href="mailto:nilsonli@gmail.com" title="">nilsonli@gmail.com</a></th></tr>
                    <tr><th>WhatsApp</th><th>+55 13 99710-2353</th><th>+55 13 98172-5946</th><th>+55 13 98203-6593</th><th>+55 13 98129-4280</th></tr>
                </tbody>
            </table>
            <p> Todos integrantes são alunos do 4º Ciclo do curso de ADS - Análise e Desenvolvimento de Sistemas, da FATEC-PG</p>
            <h2> Sobre a Aplicação</h2>
            <p> Esta aplicação tem como objetivo apresentar um jogo do tipo Quiz, apresentando pontuação e classificação dos usuários, <br>
                
        </main>
    </body>
</html>
