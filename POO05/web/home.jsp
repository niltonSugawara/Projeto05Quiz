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
        if (request.getParameter("user") == "deslogado"){%><script>alert("Para acessar o questionário é necessário estar logado!");</script><%}%>
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
           %><script>alert("Digite um valor válido!");</script><%
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
           <div class = "container">      
           <p>Olá, <%=name%></p>
        <br>
        <FORM NAME="form1" METHOD="POST">
        <INPUT TYPE="HIDDEN" NAME="buttonName">
        <INPUT TYPE="BUTTON" VALUE="Deslogar" ONCLICK="button1()" class="btn">
    </FORM>
        </div>
        <%}%>
            
            <% 
        if(request.getParameter("buttonName") != null) {
               session.invalidate();
               response.sendRedirect("home.jsp");
        }
    %>

    

    <SCRIPT LANGUAGE="JavaScript">
        
        function button1()
        {
            document.form1.buttonName.value = "yes";
            form1.submit();
        } 
        
    </SCRIPT>
     </body>
</html>
