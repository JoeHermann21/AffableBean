<div id="singleColumn">

    <c:choose>
        <c:when test="${carrinho.numeroDeItens > 1}">
            <p>Seu carrinho de compras contém ${carrinho.numeroDeItens} itens.</p>
        </c:when>
        <c:when test="${carrinho.numeroDeItens == 1}">
            <p>Seu carrinho de compras contém ${carrinho.numeroDeItens} item.</p>
        </c:when>
        <c:otherwise>
            <p>Seu carrinho de compras está vazio.</p>
        </c:otherwise>
    </c:choose>

        <div id="actionBar">
        <c:if test="${!empty carrinho && carrinho.numeroDeItens != 0}">
		
			<c:url var="url" value="viewCarrinho">
                <c:param name="limpar" value="true"/>
            </c:url>
			
            <a href="viewCarrinho?limpar=true" class="bubble hMargin">Limpar carrinho</a>
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
        <a href="${value}" class="bubble hMargin">continue comprando</a>

        <c:if test="${!empty carrinho && carrinho.numeroDeItens != 0}">
            <a href="checkout" class="bubble hMargin">concluir compra &#x279f;</a>
        </c:if>

            </div>

        <c:if test="${!empty carrinho && carrinho.numeroDeItens != 0}">

      <h4 id="subtotal">subtotal: R$ ${carrinho.subtotal}</h4>

      <table id="cartTable">

        <tr class="header">
            <th>produto</th>
            <th>nome</th>
            <th>preço</th>
            <th>quantidade</th>
        </tr>

        <c:forEach var="carinhoDeCompraItem" items="${carrinho.itens}" varStatus="iter">

          <c:set var="produto" value="${carinhoDeCompraItem.produto}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
            <td>
              <img src="${initParam.produtoImagePath}${produto.nome}.png"
                   alt="${produto.nome}">
            </td>

            <td>${produto.nome}</td>

            <td>
                R$ ${carinhoDeCompraItem.total}
                <br>
                <span class="smallText">( R$ ${produto.preco} / unidade )</span>
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