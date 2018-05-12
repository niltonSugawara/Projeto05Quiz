<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpggrupo1.BD"%>
<%@page import="br.com.fatecpggrupo1.Usuario"%>
<%@page import="br.com.fatecpggrupo1.   Question"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <ul class="nav">
            <li class="active"><a href="home.jsp">Home</a></li>
            <li><a href="questionario.jsp">Questionário</a></li>
        </ul>
        
        <%String name="";
        if (request.getParameter("user") == "deslogado"){%><script language="JavaScript">alert("Para acessar o questionário é necessário estar logado!");</script><%}%>
        <!--tela de login--> 
       
       <%try {
           if(request.getParameter("btnUsuario") != null){
               String nomeUsuario = request.getParameter("inputUsuario");
               Usuario usuario = new Usuario();
               usuario.setNome(nomeUsuario);
               BD.getUsuarios().add (usuario);
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
            <input type="email" id="inputEmail" placeholder="Usuario@email.com" name="inputUsuario" required>
            <button type="submit" name="btnUsuario" class="btn">Logar</button>
            </form>
        <%} else {
        name=(String)session.getAttribute("nomeSessao"); %>
               
           <p>Olá, <%=name%></p>
        <br>
        <form name="form1" method="post">
        <input type="hidden" name="buttonName">
        <input type="button" value="Deslogar" onclick="button1()" class="btn">
        </form>
        
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
     </body>
</html>
