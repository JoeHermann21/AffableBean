<c:set var='view' value='/categoria' scope='session' />
<div id="categoryLeftColumn">
    <c:forEach var="categoria" items="${categorias}">
        <c:choose>
            <c:when test="${categoria.id == selectedCategoria.nome}">
                <div class="categoryButton" id="selectedCategory">
                    <span class="categoryText">
						<fmt:message key="${categoria.nome}"/>                        
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                <a href="<c:url value='categoria?${categoria.id}'/>" class="categoryButton">
                    <span class="categoryText">
						<fmt:message key="${categoria.nome}"/>
                    </span>
                </a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>

<div id="categoryRightColumn">
    <p id="categoryTitle"><fmt:message key="${selectedCategoria.nome}" /></p>

    <table id="productTable">
        <c:forEach var="produto" items="${categoriaProdutos}" varStatus="iter">

            <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                <td>
                    <img src="${initParam.produtoImagePath}${produto.nome}.png"
                         alt="${produto.nome}">
                </td>
                <td>
				<fmt:message key="${produto.nome}"/>
                    
                    <br>
                    <span class="smallText"><fmt:message key='${produto.descricao}Descrição'/></span>
                </td>
                <td>
                    <fmt:formatNumber type="currency" currencySymbol="R$ " value="${produto.preco}"/>
                </td>
                <td>
                    <form action="<c:url value='adicionarAoCarrinho'/>" method="post">
                        <input type="hidden"
                               name="produtoId"
                               value="${produto.id}">
                        <input type="submit"
								name="submit"
                               value="<fmt:message key='adicionar ao carrinho'/>">
                    </form>
                </td>
            </tr>

        </c:forEach>
    </table>
</div>