<div id="categoryLeftColumn">
    <c:forEach var="categoria" items="${categorias}">
        <c:choose>
            <c:when test="${categoria.id == pageContext.request.queryString}">
                <div class="categoryButton" id="selectedCategory">
                    <span class="categoryText">
                        ${categoria.nome}
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                <a href="categoria?${categoria.id}" class="categoryButton">
                    <div class="categoryText">
                        ${categoria.nome}
                    </div>
                </a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>

<div id="categoryRightColumn">
    <p id="categoryTitle">${selectedCategoria.nome}</p>

    <table id="productTable">
        <c:forEach var="produto" items="${categoriaProdutos}" varStatus="iter">

            <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                <td>
                    <img src="${initParam.produtoImagePath}${produto.nome}.png"
                         alt="${produto.nome}">
                </td>
                <td>
                    ${produto.nome}
                    <br>
                    <span class="smallText">${produto.descricao}</span>
                </td>
                <td>
                    &euro; ${produto.preco} / unit
                </td>
                <td>
                    <form action="adicionarAoCarrinho" method="post">
                        <input type="hidden"
                               name="produtoId"
                               value="${produto.id}">
                        <input type="submit"
                               value="adicionar ao carrinho">
                    </form>
                </td>
            </tr>

        </c:forEach>
    </table>
</div>