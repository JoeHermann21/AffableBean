<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">



<div id="singleColumn">

    <p id="confirmationText">
        <strong><fmt:message key="mensagemSucesso"/></strong>
        <br><br>
        <fmt:message key="mensagemNumeroConfirmacao"/>
        <strong>${pedidoGravar.confirmacaoNumero}</strong>
        <br>
        <fmt:message key="mensagemContato"/>
        <br><br>
        <fmt:message key="mensagemObrigado"/>
    </p>

	<div class="summaryColumn" >

        <table id="orderSummaryTable" class="detailsTable">
            <tr class="header">
                <th colspan="3"><fmt:message key="sumarioPedido"/></th>
            </tr>

            <tr class="tableHeading">
                <td><fmt:message key="produto"/></td>
                <td><fmt:message key="quantidade"/></td>
                <td><fmt:message key="preco"/></td>
            </tr>

            <c:forEach var="produtoSolicitado" items="${produtosSolicitados}" varStatus="iter">

                <tr class="${((iter.index % 2) != 0) ? 'lightBlue' : 'white'}">
                    <td>
						<fmt:message key="${produtos[iter.index].nome}"/>
					</td>
                    <td class="quantityColumn">
                        ${produtoSolicitado.quantidade}
                    </td>
                    <td class="confirmationPriceColumn">
					<fmt:formatNumber type="currency" currencySymbol="R$ "
                        value="${produtos[iter.index].preco * produtoSolicitado.quantidade}"/>
                    </td>
                </tr>

            </c:forEach>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="2" id="deliverySurchargeCellLeft"><strong><fmt:message key="frete"/>:</strong></td>
                <td id="deliverySurchargeCellRight">
				<fmt:formatNumber type="currency"
                                      currencySymbol="R$ "
                                      value="${initParam.deliverySurcharge}"/></td>
            </tr>

            <tr class="lightBlue">
                <td colspan="2" id="totalCellLeft"><strong><fmt:message key="total"/>:</strong></td>
                <td id="totalCellRight">
				<fmt:formatNumber type="currency"
                                      currencySymbol="R$ "
                                      value="${pedidoGravar.total}"/></td>
            </tr>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="3" id="dateProcessedRow"><strong><fmt:message key="dataProcessada"/>:</strong>
                    <fmt:formatDate value="${pedidoGravar.dataCriacao}"
                                    type="both"
                                    dateStyle="short"
                                    timeStyle="short"/></td>
            </tr>
        </table>

    </div>

    <div class="summaryColumn" >

        <table id="deliveryAddressTable" class="detailsTable">
            <tr class="header">
                <th colspan="3"><fmt:message key="enderecoEntrega"/></th>
            </tr>

            <tr>
                <td colspan="3" class="lightBlue">
                    ${cliente.nome}
                    <br>
                    ${cliente.endereco}
                    <br>
                    <fmt:message key="regiao"/> ${cliente.regiao}
                    <br>
                    <hr>
                    <strong><fmt:message key="email"/>:</strong> ${cliente.email}
                    <br>
                    <strong><fmt:message key="telefone"/>:</strong> ${cliente.telefone}
                </td>
            </tr>
        </table>

    </div>
</div>