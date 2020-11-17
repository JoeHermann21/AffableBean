<div id="singleColumn">

    <h2>checkout</h2>

    <p>Antes de concluir a compra, por favor, informe seus dados abaixo:</p>

    <form action="compra" method="post">
        <table id="checkoutTable">
            <tr>
                <td><label for="name">nome:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="nome"
                           name="nome"
                           value="${param.nome}">
                </td>
            </tr>
            <tr>
                <td><label for="email">email:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="email"
                           name="email"
                           value="${param.email}">
                </td>
            </tr>
            <tr>
                <td><label for="phone">telefone:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="16"
                           id="telefone"
                           name="telefone"
                           value="${param.telefone}">
                </td>
            </tr>
            <tr>
                <td><label for="address">endereco:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="endereco"
                           name="endereco"
                           value="${param.endereco}">

                    <br>
                    região
                    <select name="cityRegion">
                      <c:forEach begin="1" end="10" var="regionNumber">
                        <option value="${regionNumber}"
                                <c:if test="${param.cityRegion eq regionNumber}">selecionar</c:if>>${regionNumber}</option>
                      </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="creditcard">número do cartão:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="19"
                           id="numCartaoCredito"
                           name="numCartaoCredito"
                           value="${param.numCartaoCredito}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="concluir compra">
                </td>
            </tr>
        </table>
    </form>

    <div id="infoBox">

        <ul>
            <li>Garantimos sua entrega até amanhã</li>
            <li>Uma taxa de entrega de R$ ${initParam.deliverySurcharge}
                é aplicada em todos os pedidos</li>
        </ul>

        <table id="priceBox">
            <tr>
                <td>subtotal:</td>
                <td class="checkoutPriceColumn">
                    R$ ${carrinho.subtotal}</td>
            </tr>
            <tr>
                <td>frete:</td>
                <td class="checkoutPriceColumn">
                    R$ ${initParam.deliverySurcharge}</td>
            </tr>
            <tr>
                <td class="total">total:</td>
                <td class="total checkoutPriceColumn">
                    R$ ${carrinho.total}</td>
            </tr>
        </table>
    </div>
</div>