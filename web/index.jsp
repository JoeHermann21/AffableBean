<%-- <c:set var='view' value='/index' scope='session' /> --%>

<div id="indexLeftColumn">
    <div id="welcomeText">
        <p style="font-size: larger"><fmt:message key='saudação' /></p>

        <p><fmt:message key='textoEntrada' /></p>
    </div>
</div>

<div id="indexRightColumn">
    <c:forEach var="categoria" items="${categorias}">
        <div class="categoryBox">
            <a href="<c:url value='categoria?${categoria.id}'/>">
                <span class="categoryLabel"></span>
                <span class="categoryLabelText"><fmt:message key='${categoria.nome}'/></span>

                <img src="${initParam.categoriaImagePath}${categoria.nome}.jpg"
                     alt="<fmt:message key='${categoria.nome}'/>" class="categoryImage">
            </a>
        </div>
    </c:forEach>
</div>