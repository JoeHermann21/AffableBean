<%-- 
    Document   : index
    Created on : 01/07/2019, 19:08:09
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>   
    <body>
        <div id="main">


            <div id="indexLeftColumn">
                <div id="welcomeText">
                    <p>[ welcome text ]</p>
                </div>
            </div>

            <div id="indexRightColumn">
                <!--  <div class="categoryBox">
                      <a href="#">
                          <span class="categoryLabelText">dairy</span>
                      </a>
                  </div> -->
                <c:forEach var="categoria" items="${categories}">
                </c:forEach>
                <div class="categoryBox">
                    <a href="#">
                        <span class="categoryLabelText">meats</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="#">
                        <span class="categoryLabelText">bakery</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="#">
                        <span class="categoryLabelText">fruit & veg</span>
                    </a>
                </div>

            </div>

        </div>
    </body>
</html>
