<%-- 
    Document   : Amortizacao-americana
    Created on : 20/09/2016, 23:10:08
    Author     : BrunoNistico
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<center><div class="container"> <div class="caixa">
         <h2 align="center">Sistema de Amortização Americano</h2><br>
        <form action="Amortizacao-americana.jsp" method="post">
            <table>
                <tr>
                    <td style="float:right;">Valor Financiado (R$): </td> <td><input type="text" name="valor"></td>
                </tr>

                <tr>
                    <td style="float:right;">Taxa de Juros (%): </td> <td><input type="text" name="taxa"></td>
                </tr>

                <tr>
                    <td style="float:right;">Número de Meses: </td> <td><input type="text" name="periodo"></td></tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit"  value="Calcular"></td>
                </tr>
            </table>
        </form>
        </div></div>
        <%
            String v = request.getParameter("valor");
            String t = request.getParameter("taxa");
            String p = request.getParameter("periodo");
            float valor, taxa;
            int periodo;
            
            try{
                valor = Float.parseFloat(v);
                taxa = Float.parseFloat(t);
               periodo = Integer.parseInt(p);
                
            
            float juros = valor*(taxa/100);
            float totaljuros = juros*periodo;
            
            DecimalFormat df = new DecimalFormat("##0.00;");
            v = df.format(valor);
            String j = df.format(juros);
            String tj = df.format(totaljuros);
            
        %>
        

        <table>
            
            <tr>
                <td>Mês: </td> 
                <td>Valor Financiado (R$)</td>
                <td>Amortização (R$)</td>
                <td>Juros (R$)</td>
                <td>Prestação (R$)</td>
            </tr>
            
            <tr>
                <td>0</td>
                <td><%=v%></td>
                <td align="center">-</td>
                <td align="center">-</td>
                <td align="center">-</td>
            </tr>
            
            <%for (int i=1; i<=periodo; i++){%>
                <tr>
                    <td><%=i%></td>
                    <td><%=v%></td>
                    <td align="center">-</td>
                    <td><%=j%></td>
                    <td><%=j%></td>
                    
                </tr>
            <%}%>
            

            
            <tr>
                <td><b>Total</b></td>
                    <td align="center"><b>-</b></td>
                    <td><b><%=v%></b></td>
                    <td><b><%=tj%></b></td>
                    <td><b><%=df.format(valor+totaljuros)%></b></td>
                    
            </tr>
            </div>   
        </table>
 </center>
        <% }catch(Exception ex){
                valor = 0;
                taxa = 0;
                periodo = 0;
                out.println("Campos em Branco");
            }%>
    </body>
</html>
