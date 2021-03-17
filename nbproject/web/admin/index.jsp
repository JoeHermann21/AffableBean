<div id="adminMenu" class="alignLeft">
    <p><a href="<c:url value='viewClientes'/>">ver todos os clientes</a></p>

    <p><a href="<c:url value='viewPedidos'/>">ver todos os pedidos</a></p>

    <p><a href="<c:url value='logout'/>">log out</a></p>
</div>

<c:if test="${!empty clienteLista}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="4">clientes</th>
        </tr>

        <tr class="tableHeading">
            <td>clientes id</td>
            <td>nome</td>
            <td>email</td>
            <td>telefone</td>
        </tr>

        <c:forEach var="cliente" items="${clienteLista}" varStatus="iter">

            <tr class="${((iter.index % 2) == 1) ? 'lightBlue' : 'white'} tableRow"
                onclick="document.location.href='clienteGravar?${cliente.id}'">

                <td><a href="clienteGravar?${cliente.id}" class="noDecoration">${cliente.id}</a></td>
                <td><a href="clienteGravar?${cliente.id}" class="noDecoration">${cliente.nome}</a></td>
                <td><a href="clienteGravar?${cliente.id}" class="noDecoration">${cliente.email}</a></td>
                <td><a href="clienteGravar?${cliente.id}" class="noDecoration">${cliente.telefone}</a></td>
            </tr>

        </c:forEach>

    </table>

</c:if>

<c:if test="${!empty pedidoLista}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="4">pedidos</th>
        </tr>

        <tr class="tableHeading">
            <td>pedido id</td>
            <td>numero de confirmacao</td>
            <td>total</td>
            <td>data criacao</td>
        </tr>

        <c:forEach var="pedido" items="${pedidoLista}" varStatus="iter">

            <tr class="${((iter.index % 2) == 1) ? 'lightBlue' : 'white'} tableRow"
                onclick="document.location.href='pedidoGravar?${pedido.id}'">

                <td><a href="pedidoGravar?${pedido.id}" class="noDecoration">${pedido.id}</a></td>
                <td><a href="pedidoGravar?${pedido.id}" class="noDecoration">${pedido.numeroConfirmacao}</a></td>
                <td><a href="pedidoGravar?${pedido.id}" class="noDecoration">
                        <fmt:formatNumber type="currency"
                                          currencySymbol="R$ "
                                          value="${pedido.total}"/></a></td>

                <td><a href="pedidoGravar?${pedido.id}" class="noDecoration">
                        <fmt:formatDate value="${pedido.dataCriacao}"
                                        type="both"
                                        dateStyle="short"
                                        timeStyle="short"/></a></td>
            </tr>

        </c:forEach>

    </table>

</c:if>

<c:if test="${!empty clienteGravar}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="2">detalhes do cliente</th>
        </tr>
        <tr>
            <td style="width: 290px"><strong>cliente id:</strong></td>
            <td>${clienteGravar.id}</td>
        </tr>
        <tr>
            <td><strong>nome:</strong></td>
            <td>${clienteGravar.nome}</td>
        </tr>
        <tr>
            <td><strong>email:</strong></td>
            <td>${clienteGravar.email}</td>
        </tr>
        <tr>
            <td><strong>telefone:</strong></td>
            <td>${clienteGravar.telefone}</td>
        </tr>
        <tr>
            <td><strong>endereco:</strong></td>
            <td>${clienteGravar.endereco}</td>
        </tr>
        <tr>
            <td><strong>cidade:</strong></td>
            <td>${clienteGravar.cidade}</td>
        </tr>
        <tr>
            <td><strong>numero do cartao de credito:</strong></td>
            <td>${clienteGravar.numCartaoCredito}</td>
        </tr>

        <tr><td colspan="2" style="padding: 0 20px"><hr></td></tr>

        <tr class="tableRow"
            onclick="document.location.href='pedidoGravar?${pedido.id}'">
            <td colspan="2">

                <a href="pedidoGravar?${pedido.id}" class="noDecoration">
                <strong>ver resumo do pedido &#x279f;</strong></a></td>
        </tr>
    </table>

</c:if>

<c:if test="${!empty pedidoGravar}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="2">resumo do pedido</th>
        </tr>
        <tr>
            <td><strong>pedido id:</strong></td>
            <td>${pedidoGravar.id}</td>
        </tr>
        <tr>
            <td><strong>numero de confirmacao:</strong></td>
            <td>${pedidoGravar.numeroConfirmacao}</td>
        </tr>
        <tr>
            <td><strong>data processamento:</strong></td>
            <td>
                <fmt:formatDate value="${pedidoGravar.dataCriacao}"
                                type="both"
                                dateStyle="short"
                                timeStyle="short"/></td>
        </tr>

        <tr>
            <td colspan="2">
                <table class="embedded detailsTable">
                   <tr class="tableHeading">
                        <td class="rigidWidth">produto</td>
                        <td class="rigidWidth">quantidade</td>
                        <td>preco</td>
                    </tr>

                    <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                    <c:forEach var="produtoSolicitado" items="${produtosSolicitados}" varStatus="iter">

                        <tr>
                            <td>
                                <fmt:message key="${produtos[iter.index].nome}"/>
                            </td>
                            <td>
                                ${produtoSolicitado.quantidade}
                            </td>
                            <td class="confirmationPriceColumn">
                                <fmt:formatNumber type="currency" currencySymbol="R$ "
                                                  value="${produtos[iter.index].preco * produtoSolicitado.quantidade}"/>
                            </td>
                        </tr>

                    </c:forEach>

                    <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                    <tr>
                        <td colspan="2" id="deliverySurchargeCellLeft"><strong>taxa de entrega:</strong></td>
                        <td id="deliverySurchargeCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="R$ "
                                              value="${initParam.taxaEntrega}"/></td>
                    </tr>

                    <tr>
                        <td colspan="2" id="totalCellLeft"><strong>subtotal:</strong></td>
                        <td id="totalCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="R$ "
                                              value="${pedidoGravar.total}"/></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

        <tr class="tableRow"
            onclick="document.location.href='clienteGravar?${cliente.id}'">
            <td colspan="2">

                <a href="clienteRecord?${cliente.id}" class="noDecoration">
                    <strong>ver detalhes do cliente &#x279f;</strong></a></td>
        </tr>
    </table>

</c:if>