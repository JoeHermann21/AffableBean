
<%--

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <sql:query var="categorias" dataSource="jdbc/affablebean">
            SELECT * FROM categoria
        </sql:query> --%>


            <div id="indexLeftColumn">
                <div id="welcomeText">
                    <p style="font-size: larger">Bem-vindo à loja virtual Affable Bean</p>

                    <p>Navegue e aprenda mais sobre nosso serviço único de entrega,
						onde trazemos a você produtos orgânicos e frescos para o
						dia-a-dia, com variedades em carnes, frutas, legumes, pães,
						entre outras delícias</p>
                </div>
            </div>
               
            <div id="indexRightColumn">
                <c:forEach var="categoria" items="${categorias}">
                    <div class="categoryBox">
                        <a href="categoria?${categoria.id}">
							<span class="categoryLabel"></span>
                            <span class="categoryLabelText">${categoria.nome}</span>

                            <img src="${initParam.categoriaImagePath}${categoria.nome}.jpg"
                                 alt="${categoria.nome}" class="categoryImage">
                        </a>
                    </div>
                </c:forEach>
            </div>