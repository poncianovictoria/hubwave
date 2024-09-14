<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>Hub Wave</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #012130;
        }   

        div {
            text-align: center;
            width: 350px;
            background-color: aliceblue;
            border-radius: 30px;
            padding-bottom: 10px;

        }

        h2 {
            color:  #13678b;
            font-size: 20px;
            
        }
        i{
            font-size: 40px;
            color: #45c4af;

        }
        a{
            color:  #13678b;
        }
        a:hover{
            color: #13678b8b;
        }
    </style>
</head>
<body>
    <%@page language = "java" import = "java.sql.*" %>

<%
    //criar as variaveis  e armazenar as informações digitadas pelo usuario
    String vnome = request.getParameter("txtnome") ;
    String vemail = request.getParameter("txtemail") ;
    String vcel = request.getParameter("txtcel") ;
    String vmsg = request.getParameter("descricao") ; 

    // variavel para acessar o banco de dados 
    String database = "hub_wave" ;
    String endereco = "jdbc:mysql://localhost:3306/" + database ;
    String usuario = "root" ;
    String senha = "" ;

    // driver
    String driver = "com.mysql.jdbc.Driver" ;

    // carregar o driver na memoria 
    Class.forName(driver) ;

    //cria a variavel para conectar com o banco 
    Connection conexao ;

     //abrir a conexão com o banco 
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    String sql = "INSERT INTO usuarios (nome, email, telefone, mensagem) VALUES (?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setString(1, vnome) ;
    stm.setString(2, vemail) ;
    stm.setString(3, vcel) ;
    stm.setString(4, vmsg) ;

    stm.execute() ;
    stm.close() ;

    out.print("<div> <h2>Obrigado por entrar em contato conosco. Recebemos sua mensagem e nossa equipe retornara o contato em breve.</h2></di>") ;
    out.print("<div><i class='bi bi-send-check-fill'></i></div>");
    out.print("<a href= 'index.html'>Voltar</a>") ;
%>
</body>
</html>