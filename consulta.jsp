<%@page language = "java" import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta JSP</title>
    <style>
        tr:nth-child(even){
            background-color: lightgray ;
        }
    </style>
</head>
<body>
    <%
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

        String sql = "SELECT * FROM usuarios" ; // se eu quiser que apareça pela ordem de nome eu posso acrescenta mais comando "order by nome" ou se quiser decrescente "order by nome desc"

        //criar o statement para executar o comando do banco de dados
        PreparedStatement stm = conexao.prepareStatement(sql) ; 

        ResultSet dados = stm.executeQuery() ;

        out.print("<table border=1>") ;
        out.print("<tr>") ; 
        out.print("<th>Codigo</th>") ;
        out.print("<th>Nome</th>") ;
        out.print("<th>E-mail</th>") ;
        out.print("<th>Telefone</th>") ;
        out.print("<th>Mensagem</th>") ;
        out.print("</tr>") ;

        while(dados.next()){
            out.print("<tr>") ;
                out.print("<td>") ;
                out.print(dados.getString("codigo")) ;
                out.print("</td>") ;

                out.print("<td>") ;
                out.print(dados.getString("nome")) ;
                out.print("</td>") ;

                out.print("<td>") ;
                out.print(dados.getString("email")) ;
                out.print("</td>") ;

                out.print("<td>") ;
                out.print(dados.getString("telefone")) ;
                out.print("</td>") ;

                out.print("<td>") ;
                out.print(dados.getString("mensagem")) ;
                out.print("</td>") ;
            out.print("</tr>") ;
    
        }


    %>
</body>
</html>