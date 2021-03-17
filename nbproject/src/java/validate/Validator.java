package validate;

import javax.servlet.http.HttpServletRequest;

public class Validator {

    public boolean validateQuantity (String produtoId, String quantidade) {

        boolean errorFlag = false;

        if (!produtoId.isEmpty() && !quantidade.isEmpty()) {

            int i = -1;

            try {

                i = Integer.parseInt(quantidade);
            } catch (NumberFormatException nfe) {

                System.out.println("O usuário não entrou com valor válido na quantidade");
            }

            if (i < 0 || i > 99) {

                errorFlag = true;
            }
        }

        return errorFlag;
    }


    // performs simple validation on checkout form
    public boolean validateForm(String nome,
                                String email,
                                String telefone,
                                String endereco,
                                String cidade,
                                String numCartaoCredito,
                                HttpServletRequest request) {

        boolean errorFlag = false;
        boolean nomeError;
        boolean emailError;
        boolean telefoneError;
        boolean enderecoError;
        boolean cidadeError;
        boolean numCartaoCreditoError;

        if (nome == null
                || nome.equals("")
                || nome.length() > 45) {
            errorFlag = true;
            nomeError = true;
            request.setAttribute("nomeError", nomeError);
        }
        if (email == null
                || email.equals("")
                || !email.contains("@")) {
            errorFlag = true;
            emailError = true;
            request.setAttribute("emailError", emailError);
        }
        if (telefone == null
                || telefone.equals("")
                || telefone.length() < 9) {
            errorFlag = true;
            telefoneError = true;
            request.setAttribute("telefoneError", telefoneError);
        }
        if (endereco == null
                || endereco.equals("")
                || endereco.length() > 45) {
            errorFlag = true;
            enderecoError = true;
            request.setAttribute("enderecoError", enderecoError);
        }
        if (cidade == null
                || cidade.equals("")
                || cidade.length() > 2) {
            errorFlag = true;
            cidadeError = true;
            request.setAttribute("cidadeError", cidadeError);
        }
        if (numCartaoCredito == null
                || numCartaoCredito.equals("")
                || numCartaoCredito.length() > 19) {
            errorFlag = true;
            numCartaoCreditoError = true;
            request.setAttribute("numCartaoCreditoError", numCartaoCreditoError);
        }

        return errorFlag;
    }

}