<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortizacao Constante</title>
    </head>
    <body>
        <h1>Amortizacao Constante!</h1>
        <form>
            <input type="text" name="vl_debito" placeholder="Digite um valor" />
            <input type="text" name="taxa" placeholder="Digite uma taxa" />
            <input type="number" name="periodo" placeholder="Digite um periodo" />
            <button type="submit">Calcular</button>
        </form>
        
        <%
            double valor = 0;
            double taxa = 0;
            int periodo = 0;
                
            try {
                valor = Double.parseDouble(request.getParameter("vl_debito"));
                taxa = Double.parseDouble(request.getParameter("taxa"));
                periodo = Integer.parseInt(request.getParameter("periodo"));
            } catch (Exception ex) {
                periodo = 1;
                out.println("<div class='erro'><p>Erro ao converter numeros</p></div>");
            }
            
            double vl_amortizacao = valor/periodo;
            double[] juros = new double[periodo];
            double[] prestacao = new double[periodo];
            double saldoDevedor = valor;
            double totalPago = 0;
        %>
        
        <table>
            <tr>
                <th>Periodo</th>
                <th>Saldo Devedor</th>
                <th>Amortização</th>
                <th>Juros</th>
                <th>Prestação</th>
            </tr>
            
            <% for (int i = 0; i<=periodo; i++) { %>
            <tr>
                <td><%= i %></td>
                
                <% if (i == 0) { %>
                    <td><%= valor %></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                <% } else {
                    juros[i] = saldoDevedor * (1.0 + (taxa/100));
                    prestacao[i] = vl_amortizacao + juros[i];
                    saldoDevedor -= vl_amortizacao;
                    totalPago += prestacao[i];

                    %>
                    <td><%= saldoDevedor %></td>
                    <td><%= vl_amortizacao %></td>
                    <td><%= juros[i] %></td>
                    <td><%= prestacao[i] %></td>
                <% } %>
            </tr>
            <% } %>
        </table>
    </body>
</html>
