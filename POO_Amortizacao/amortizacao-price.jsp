<%-- 
    Document   : Tabela-price
    Created on : 20/09/2016, 20:11:00
    Author     : BrunoNistico
--%>


<!--
PMT: Valor da parcela (do inglês payment)
PV: Valor Presente (do inglês Present Value)
i: Taxa de juros (do inglês Interest Rate)
n: Número de períodos

pmt = PV * ((math.pow(1 + i,n)*1)/(math.pow(1 + i,n)-1))

-Algoritmo p checar meses e anos

Processo:
- Calcula PMT
- Monta uma tabela com as <th> Período, Parcela, Prestação, Juros, Amortização, Dívida
- Período 0 - só tem a Dívida total (PV)
- Período 1 - Começa com o PMT (Parcela), pega 10% da Dívida e coloca nos Juros, Retira os juros da Parcela e vira a Amortização, Retira a amortização do PV anterior

-->
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela-Price</title>
    </head>
    <body>
        <h1></h1>
        

        <%
            String v_pv = request.getParameter("ValorPresente");
            String v_i = request.getParameter("juros");
            String v_n = request.getParameter("periodo");
            
            double pv;
            double i;
            int n;
            try{
               

               pv = Double.parseDouble(v_pv);
               i = Double.parseDouble(v_i);
               n = Integer.parseInt(v_n);
               
            }catch(Exception ex){
               pv = 10;
               i = 10;
               n = 10;
               out.println("Erro ao ler o parâmetro");
            }


        %>    
        
        <form>
           <input type="text" name="ValorPresente" placeholder="ValorPresente"/>
           <input type="text" name="juros" placeholder="Juros"/>
           <input type="text" name="periodo" placeholder="Periodo"/>
           <input type="submit" Value="Gerar"/>
        </form>
        
        <%
            double pmt;  
            
            i = i/100;
            pmt = pv * ((Math.pow(1 + i,n)*i)/(Math.pow(1 + i,n)-1));
                    
            DecimalFormat df = new DecimalFormat("0.##");
            
            double pmttotal = pmt;
            double jurostotal = 0;
            double amtotal = 0;
            double divtotal = pv;
        %>
        <table border ="1">
            <tr><th>Período</th><th> Prestação</th><th> Juros</th><th> Amortização</th><th> Dívida</th></tr>
            <tr>
            <td> 0 </td>
            <td> <%= df.format
                (pmt) %> </td>
            <td> 0 </td>
            <td> 0 </td> <% %>
            <td> <%= df.format
                (pv) %></td>
            </tr>

            <% for (int ct=1;ct<=n;ct++){%>
            <tr>
            <td> <%= ct %> </td> 
            <td> <%= df.format
                (pmt) %> </td> <% pmttotal = pmttotal + pmt; %>
            <td> <%= df.format
                (i*pv) %> </td> <% jurostotal = jurostotal + (i*pv); %>
            <td> <%= df.format
                (pmt-i*pv) %></td> <% amtotal = amtotal + (pmt-i*pv); %>
            <td> <%= df.format
                (pv = (pv -(pmt-i*pv))) %></td>
            </tr>
            <%}%>
            <tr>
            
            <td> TOTAL </td>
            <td> <%= df.format(pmttotal) %> </td>
            <td> <%= df.format(jurostotal) %> </td>
            <td> <%= df.format(amtotal) %> </td>
            <td> <%= df.format(divtotal-amtotal) %> </td>
            </tr>
            
        </table>
        
        
    </body>
    
</html>
