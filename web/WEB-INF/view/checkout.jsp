<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var='view' value='/checkout' scope='session' />
<script src="js/jquery.validate.js" type="text/javascript"></script>

<c:choose>
  <c:when test="${empty language}">
    <c:if test="${pageContext.request.locale.language eq 'cs'}">
      <script src="js/localization/messages_cs.js" type="text/javascript"></script>
    </c:if>
  </c:when>
  <c:otherwise>
    <c:if test="${sessionScope['javax.servlet.jsp.jstl.fmt.locale.session'] eq 'cs'}">
      <script src="js/localization/messages_cs.js" type="text/javascript"></script>
    </c:if>
  </c:otherwise>
</c:choose>

<script type="text/javascript">

<script type="text/javascript">

    $(document).ready(function(){
        $("#checkoutForm").validate({
            rules: {
                nome: "required",
                email: {
                    required: true,
                    email: true
                },
                telefone: {
                    required: true,
                    number: true,
                    minlength: 9
                },
                endereco: {
                    required: true
                },
                numCartaoCredito: {
                    required: true,
                    numCartaoCredito: true
                }
            }
        });
    });
</script>

<div id="singleColumn">

    <h2><fmt:message key="checkout"/></h2>

    <p><fmt:message key="textoCheckout"/></p>

	<c:if test="${!empty orderFailureFlag}">
        <p class="error"><fmt:message key="orderFailureError"/></p>
    </c:if>
	
    <form id="checkoutForm" action="<c:url value='compra'/>" method="post">
        <table id="checkoutTable">
		<c:if test="${!empty validationErrorFlag}">
            <tr>
                <td colspan="2" style="text-align:left">
                    <span class="error smallText"><fmt:message key="mensagemErroValidacao"/>

                      <c:if test="${!empty nomeError}">
                        <br><span class="indent"><fmt:message key="erroNome"/></span>
                      </c:if>
                      <c:if test="${!empty emailError}">
                        <br><span class="indent"><fmt:message key="erroEmail"/></span>
                      </c:if>
                      <c:if test="${!empty telefoneError}">
                        <br><span class="indent"><fmt:message key="erroTelefone"/></span>
                      </c:if>
                      <c:if test="${!empty enderecoError}">
                        <br><span class="indent"><fmt:message key="erroEndereco"/></span>
                      </c:if>
                      <c:if test="${!empty cidaxeError}">
                        <br><span class="indent"><fmt:message key="erroCidade"/></span>
                      </c:if>
                      <c:if test="${!empty numCartaoCreditoError}">
                        <br><span class="indent"><fmt:message key="erroNumCartaoCredito"/></span>
                      </c:if>

                    </span>
                </td>
            </tr>
          </c:if>
            <tr>
                <td><label for="name"><fmt:message key="nome"/>:</label></td>
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
                <td><label for="email"><fmt:message key="email"/>:</label></td>
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
                <td><label for="phone"><fmt:message key="telefone"/>:</label></td>
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
                <td><label for="address"><fmt:message key="endereco"/>:</label></td>
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
                      <c:forEach begin="1" end="10" var="regiao">
                        <option value="${regionNumber}"
                                <c:if test="${param.cityRegion eq regionNumber}">selecionar</c:if>>${regionNumber}</option>
                      </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="creditcard"><fmt:message key="cartaoCredito"/>:</label></td>
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
                    <input type="submit" value="<fmt:message key='submit'/>">
                </td>
            </tr>
        </table>
    </form>

    <div id="infoBox">

        <ul>
            <li><fmt:message key="garantiaDiaSeguinte"/></li>
            <li><fmt:message key="taxaEntrega1"/>
                <fmt:formatNumber type="currency" currencySymbol="R$ " value="${initParam.deliverySurcharge}"/>
                <fmt:message key="taxaEntrega2"/></li>
        </ul>

        <table id="priceBox">
            <tr>
                <td><fmt:message key="subtotal"/>:</td>
                <td class="checkoutPriceColumn">
                    <fmt:formatNumber type="currency" currencySymbol="R$ " value="${carrinho.subtotal}"/></td>
            </tr>
            <tr>
                <td><fmt:message key="frete"/>:</td>
                <td class="checkoutPriceColumn">
                    <fmt:formatNumber type="currency" currencySymbol="R$ " value="${initParam.deliverySurcharge}"/></td>
            </tr>
            <tr>
                <td class="total"><fmt:message key="total"/>:</td>
                <td class="total checkoutPriceColumn">
                    <fmt:formatNumber type="currency" currencySymbol="R$ " value="${carrinho.total}"/></td>
            </tr>
        </table>
    </div>
</div>