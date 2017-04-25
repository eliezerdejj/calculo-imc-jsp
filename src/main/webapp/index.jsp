<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Calculo de IMC</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
    <div class="col-md-12">
        <div class="modal-dialog" style="margin-bottom:0">
            <div class="modal-content">
                <div class="panel-heading">
                    <h1 class="panel-title">Calculo do IMC</h1>
                </div>
                <div class="panel-body">
                    <form name="formulario">
                        <fieldset>
                            <div class="form-group">
                                <label for="sel1">Altura:</label>

                                    <input type="text" class="form-control" placeholder="ex: 1.70" name="altura">
                            </div>

                            <div class="form-group">
                                <label for="sel1">Peso:</label>

                                     <input type="text" class="form-control" placeholder="ex: 53" name="peso">
                            </div>

                            <div class="form-group">
                                <label for="sex">Sexo:</label>
                            <select class="form-control" id="sexo" name="sexo">
                              <option>Masculino</option>
                              <option>Feminino</option>
                            </select>
                            </div>
                            <button class="btn btn-sm btn-success">Calcular</button>
                        </fieldset>
                </form>
            </div>
        </div>

        <!-- Scriptlet. Código Java na página JSP. -->

        <%
        String alturaStr = request.getParameter("altura");
        String pesoStr = request.getParameter("peso");
        String sexoStr = request.getParameter("sexo");
        String mensagem = "";
        String mensagem2 = "";

        if(request.getParameter("altura") != null) {

          float peso = Float.parseFloat(pesoStr);
          float altura = Float.parseFloat(alturaStr);

          float imc = peso / (altura * altura);

          if(sexoStr.equals("Masculino")){
            if (imc < 20) {
              mensagem = "Abaixo do peso";
              mensagem2 = "warning";
            } else if (imc < 26.4) {
              mensagem = "Peso Normal";
              mensagem2 = "success";
            } else {
              mensagem = "Acima do peso";
              mensagem2 = "warning";
            }
          }else{
            if (imc < 19.1) {
              mensagem = "Abaixo do peso";
              mensagem2 = "warning";
            } else if (imc < 25.8) {
              mensagem = "Peso Normal";
              mensagem2 = "success";
            } else {
              mensagem = "Acima do peso";
              mensagem2 = "warning";
            }
          }
          
        }
        %>
        <!-- Utilização de vaviáveis em expressões JSP. -->
        <div class="alert alert-<%=mensagem2%>" role="alert" style="margin-top:45px"><%=mensagem%></div>
      </div>
    </div>

  </body>
</html>
