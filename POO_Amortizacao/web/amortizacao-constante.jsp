<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/main.css" />
        <title>Amortizacao Constante</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1>Amortizacao Constante!</h1>
                <div class="col-md-4">
                <form>
                    <div>
                        <div class="input-group">
                            <input class="form-control" type="text" name="vl_debito" placeholder="Digite um valor" />
                        </div>

                        <div class="form-inline">
                            <div class="input-group">
                                <input class="form-control" type="number" name="periodo" placeholder="Digite um periodo" />
                                <input class="form-control" type="text" name="taxa" placeholder="Digite uma taxa" />
                            </div>
                        </div>
                        <button class="btn btn-default" type="submit">Calcular</button>
                    </div>
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
                    out.println("<div class='erro'><p>Erro ao converter numeros</p></div>");
                }

                double vl_amortizacao = valor/periodo;
                double juros = 0;
                double prestacao = 0;
                
                //VALORES TOTAIS PARA EXIBIR QUANTIDADE PAGA
                double saldoDevedor = valor;
                double totalPago = 0;
                double totalJuros = 0;

            %>
                </div>
                
            </div>
            <div class="row">
                <div class="col-md-6">
                <table class="table table-hover">
                    <tr>
                        <th>Periodo</th>
                        <th>Saldo Devedor</th>
                        <th>Amortização</th>
                        <th>Juros</th>
                        <th>Prestação</th>
                    </tr>

                    <% for (int i = 0; i<=periodo; i++) { 
                        juros = 0;
                        prestacao = 0;
                    %>
                    <tr>
                        <td><%= i %></td> <!-- periodo -->

                        <% if (i == 0) { %> <!-- caso periodo for 0 só exibe saldo que precisa pagar -->
                            <td><%= valor %></td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        <% } else {
                            juros = saldoDevedor * (1.0 + (taxa/100)); //calcular juros
                            prestacao = vl_amortizacao + juros;
                            saldoDevedor -= vl_amortizacao; //retirar amortizacao da divida
                            totalPago += prestacao; 
                            totalJuros += juros;
                            
                            %>
                            <td><%= saldoDevedor %></td>
                            <td><%= vl_amortizacao %></td>
                            <td><%= juros %></td>
                            <td><%= prestacao %></td>
                        <% } %>
                    </tr>
                    <% } %>
                    <tr class="tabela--totais">
                        <td>TOTAL</td>
                        <td>-</td>
                        <td><%= valor %></td>
                        <td><%= totalJuros %></td>
                        <td><%= totalPago %></td>
                    </tr>
                </table>
                </div> <!-- coluna -->
            </div> <!-- row -->

        </div><!-- container site -->
        
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
