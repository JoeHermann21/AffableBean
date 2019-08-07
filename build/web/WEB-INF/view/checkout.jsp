<%-- 
    Document   : checkout
    Created on : 03/07/2019, 12:15:05
    Author     : e.andre.germano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>

    <div id="centerColumn">

        <h2>checkout</h2>

        <p>[ text ]</p>

        <form action="purchase" method="post">

            <table id="checkoutTable">
                <tr>
                    <td>[ form containing fields to
                        <br>capture customer details ]</td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="submit" value="submit button"></td>
                </tr>

            </table>

        </form>

        <div id="infoBox">

            <div style="border: black solid 1px; height:100px; padding: 10px">
                [ purchase conditions ]
            </div>

            <div id="priceBox">
                [ purchase calculations:<br>subtotal + delivery charge ]
            </div>
        </div>
    </div>

    <div id="footer">
        <hr>
        <p id="footerText">[ footer text ]</p>
    </div>
</div>
</body>
</html>
