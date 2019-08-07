<%-- 
    Document   : confirmacao
    Created on : 03/07/2019, 12:14:28
    Author     : e.andre.germano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <div id="singleColumn">

        <p id="confirmationText">
            [ text ]
            <br><br>
            [ order reference number ]
        </p>

        <div class="summaryColumn" >

            <table id="orderSummaryTable" class="detailsTable" >
                <tr class="header">
                    <th style="padding:10px">[ order summary table ]</th>
                </tr>
            </table>

        </div>

        <div class="summaryColumn" >

            <table id="deliveryAddressTable" class="detailsTable">
                <tr class="header">
                    <th style="padding:10px">[ customer details ]</th>
                </tr>
            </table>
        </div>
    </div>

    <div id="footer">
        <hr>
        <p id="footerText">[ footer text ]</p>
    </div>
</div>
</body>
</html>
