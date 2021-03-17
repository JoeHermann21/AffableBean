<c:set var='view' value='/carrinho' scope='session' />
<div id="singleColumn">

    <c:choose>
        <c:when test="${carrinho.numeroDeItens > 1}">
            <p><fmt:message key="seuCarrinhoContem"/> ${carrinho.numeroDeItens} <fmt:message key="itens"/>.</p>
        </c:when>
        <c:when test="${carrinho.numeroDeItens == 1}">
            <p><fmt:message key="seuCarrinhoContem"/> ${carrinho.numeroDeItens} <fmt:message key="item"/>.</p>
        </c:when>
        <c:otherwise>
            <p><fmt:message key="seuCarrinhoVazio"/></p>
        </c:otherwise>
    </c:choose>

        <div id="actionBar">
        <c:if test="${!empty carrinho && carrinho.numeroDeItens != 0}">
		
			<c:url var="url" value="viewCarrinho">
                <c:param name="limpar" value="true"/>
            </c:url>
			
            <a href="${url}" class="bubble hMargin"><fmt:message key="limparCarrinho"/></a>
        </c:if>

                 
        <c:set var="value">
            <c:choose>
                
                <c:when test="${!empty selectedCategoria}">
                    categoria
                </c:when>

                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

		<c:url var="url" value="${value}"/>
        <a href="${value}" class="bubble hMargin"><fmt:message key="continueComprando"/></a>

        <c:if test="${!empty carrinho && carrinho.numeroDeItens != 0}">
            <a href="checkout" class="bubble hMargin"><fmt:message key="seguirParaOCheckout"/></a>
        </c:if>

            </div>

        <c:if test="${!empty carrinho && carrinho.numeroDeItens != 0}">

      <h4 id="subtotal"><fmt:message key="subtotal"/>:
	  <fmt:formatNumber type="currency" currencySymbol="R$ " value="${carrinho.subtotal}"/>
	  </h4>

      <table id="cartTable">

        <tr class="header">
			<th><fmt:message key="produto"/></th>
            <th><fmt:message key="nome"/></th>
            <th><fmt:message key="preco"/></th>
            <th><fmt:message key="quantidade"/></th>
        </tr>

        <c:forEach var="carinhoDeCompraItem" items="${carrinho.itens}" varStatus="iter">

          <c:set var="produto" value="${carinhoDeCompraItem.produto}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
            <td>
              <img src="${initParam.produtoImagePath}${produto.nome}.png"
                   alt="${produto.nome}">
            </td>

			<td><fmt:message key="${produto.nome}"/></td>

            <td>
				<fmt:formatNumber type="currency" currencySymbol="R$ " value="${carinhoDeCompraItem.total}"/>
                <br>
                <span class="smallText">(
                    <fmt:formatNumber 
					type="currency" 
					currencySymbol="R$ " 
					value="${produto.preco}"/>
                    / <fmt:message key="unidade"/> )</span>
            </td>

            <td>
                <form action="atualizarCarrinho" method="post">
                    <input type="hidden"
                           name="produtoId"
                           value="${produto.id}">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="${carinhoDeCompraItem.quantidade}"
                           name="quantidade"
                           style="margin:5px">
                    <input type="submit"
                           name="submit"
                           value="update">
                </form>
            </td>
          </tr>

        </c:forEach>

      </table>

    </c:if>
</div>