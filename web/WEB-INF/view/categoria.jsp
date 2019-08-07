<%-- 
    Document   : categoria
    Created on : 03/07/2019, 12:13:25
    Author     : e.andre.germano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>

    <div id="categoryLeftColumn">
        <div class="categoryButton" id="selectedCategory">
            <span class="categoryText">dairy</span>
        </div>

        <a href="#" class="categoryButton">
            <span class="categoryText">meats</span>
        </a>

        <a href="#" class="categoryButton">
            <span class="categoryText">bakery</span>
        </a>

        <a href="#" class="categoryButton">
            <span class="categoryText">fruit & veg</span>
        </a>
    </div>

    <div id="categoryRightColumn">
        <p id="categoryTitle">[ selected category ]</p>

        <table id="productTable">
            <tr>
                <td class="lightBlue">
                    <img src="#" alt="product image">
                </td>
                <td class="lightBlue">
                    [ product name ]
                    <br>
                    <span class="smallText">[ product description ]</span>
                </td>
                <td class="lightBlue">[ price ]</td>
                <td class="lightBlue">
                    <form action="#" method="post">
                        <input type="submit" value="purchase button">
                    </form>
                </td>
            </tr>

            <tr>
                <td class="white">
                    <img src="#" alt="product image">
                </td>
                <td class="white">
                    [ product name ]
                    <br>
                    <span class="smallText">[ product description ]</span>
                </td>
                <td class="white">[ price ]</td>
                <td class="white">
                    <form action="#" method="post">
                        <input type="submit" value="purchase button">
                    </form>
                </td>
            </tr>

            <tr>
                <td class="lightBlue">
                    <img src="#" alt="product image">
                </td>
                <td class="lightBlue">
                    [ product name ]
                    <br>
                    <span class="smallText">[ product description ]</span>
                </td>
                <td class="lightBlue">[ price ]</td>
                <td class="lightBlue">
                    <form action="#" method="post">
                        <input type="submit" value="purchase button">
                    </form>
                </td>
            </tr>

            <tr>
                <td class="white">
                    <img src="#" alt="product image">
                </td>
                <td class="white">
                    [ product name ]
                    <br>
                    <span class="smallText">[ product description ]</span>
                </td>
                <td class="white">[ price ]</td>
                <td class="white">
                    <form action="#" method="post">
                        <input type="submit" value="purchase button">
                    </form>
                </td>
            </tr>
        </table>
    </div>

    <div id="footer">
        <hr>
        <p id="footerText">[ footer text ]</p>
    </div>
</div>
</body>
</html>
