<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">



<div id="singleColumn">

                <p id="confirmationText">
        <strong>Seu pedido foi processado com sucesso e vai ser entregue dentro de 24 horas.</strong>
        <br><br>
        Aqui está o número de confirmação da compra:
        <strong>${pedidoGravacao.confirmacaoNumero}</strong>
        <br>
        Para mais informações <a href="#">entre em contato conosco</a>.
        <br><br>
        Obrigado por comprar conosco!
    </p>

               <div class="summaryColumn" >

        <table id="orderSummaryTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">resumo da compra</th>
            </tr>

            <tr class="tableHeading">
                <td>produto</td>
                <td>quantidade</td>
                <td>preco</td>
            </tr>

            <c:forEach var="produtoSolicitado" items="${produtosSolicitados}" varStatus="iter">

                <tr class="${((iter.index % 2) != 0) ? 'lightBlue' : 'white'}">
                    <td>${produtos[iter.index].nome}</td>
                    <td class="quantityColumn">
                        ${produtoSolicitado.quantidade}
                    </td>
                    <td class="confirmationPriceColumn">
                        &euro; ${produtos[iter.index].preco * produtoSolicitado.quantidade}
                    </td>
                </tr>

            </c:forEach>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="2" id="deliverySurchargeCellLeft"><strong>sobretaxa de entrega:</strong></td>
                <td id="deliverySurchargeCellRight">R$; ${initParam.deliverySurcharge}</td>
            </tr>

            <tr class="lightBlue">
                <td colspan="2" id="totalCellLeft"><strong>total:</strong></td>
                <td id="totalCellRight">R$; ${orderRecord.valorTotal}</td>
            </tr>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="3" id="dateProcessedRow"><strong>data de criação:</strong>
                    ${orderRecord.dataCriacao}
                </td>
            </tr>
        </table>

    </div>

    <div class="summaryColumn" >

        <table id="deliveryAddressTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">endereco de entrega</th>
            </tr>

            <tr>
                <td colspan="3" class="lightBlue">
                    ${cliente.nome}
                    <br>
                    ${cliente.endereco}
                    <br>
                    Região ${cliente.regiao}
                    <br>
                    <hr>
                    <strong>email:</strong> ${cliente.email}
                    <br>
                    <strong>telefone:</strong> ${cliente.telefone}
                </td>
            </tr>
        </table>

    </div>
</div>