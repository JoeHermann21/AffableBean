/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import carrinho.CarrinhoDeCompra;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Locale;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Categoria;
import model.Produto;
import sessao.CategoriaFacade;
import sessao.PedidoManager;
import sessao.ProdutoFacade;
import validate.Validator;

/**
 *
 * @author andre
 */
@WebServlet(name = "Controle",
        loadOnStartup = 1,
        urlPatterns = {"/categoria",
            "/adicionarAoCarrinho",
            "/viewCarrinho",
            "/atualizarCarrinho",
            "/checkout",
            "/compra",
            "/selecionarIdioma"})
public class ControleServlet extends HttpServlet {

    private String surcharge;

    @EJB
    private CategoriaFacade categoriaFacade;
    @EJB
    private ProdutoFacade produtoFacade;
    @EJB
    private PedidoManager pedidoManager;

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

        super.init(servletConfig);

        surcharge = servletConfig.getServletContext().getInitParameter("deliverySurcharge");

        getServletContext().setAttribute("categorias", categoriaFacade.findAll());
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        Categoria selectedCategoria;
        Collection<Produto> categoriaProdutos;

        if (userPath.equals("/categoria")) {

            String categoriaId = request.getQueryString();

            if (categoriaId != null) {

                selectedCategoria = categoriaFacade.find(Short.parseShort(categoriaId));

                session.setAttribute("selectedCategoria", selectedCategoria);

                categoriaProdutos = selectedCategoria.getProdutoCollection();

                session.setAttribute("categoriaProdutos", categoriaProdutos);

            }
        } else if (userPath.equals("/viewCarrinho")) {

            String limpar = request.getParameter("limpar");

            if ((limpar != null) && limpar.equals("true")) {

                CarrinhoDeCompra carrinho = (CarrinhoDeCompra) session.getAttribute("carrinho");
                carrinho.limpar();
            }

            userPath = "/carrinho";

        } else if (userPath.equals("/checkout")) {

            CarrinhoDeCompra carrinho = (CarrinhoDeCompra) session.getAttribute("carrinho");

            carrinho.calcularTotal(surcharge);

        } else if (userPath.equals("/selecionarIdioma")) {

            String idioma = request.getParameter("idioma");

            request.setAttribute("idioma", idioma);

            String usuarioView = (String) session.getAttribute("view");

            if ((usuarioView != null)
                    && (!usuarioView.equals("/index"))) {

                userPath = usuarioView;
            } else {

                try {
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                return;
            }

        }

        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        CarrinhoDeCompra carrinho = (CarrinhoDeCompra) session.getAttribute("carrinho");
        Validator validator = new Validator();

        if (userPath.equals("/adicionarAoCarrinho")) {

            if (carrinho == null) {

                carrinho = new CarrinhoDeCompra();
                session.setAttribute("carrinho", carrinho);
            }

            // get user input from request
            String produtoId = request.getParameter("produtoId");

            if (!produtoId.isEmpty()) {

                Produto produto = produtoFacade.find(Integer.parseInt(produtoId));
                carrinho.adicionarItem(produto);
            }

            userPath = "/categoria";

        } else if (userPath.equals("/atualizarCarrinho")) {

            String produtoId = request.getParameter("produtoId");
            String quantidade = request.getParameter("quantidade");

            boolean invalidEntry = validator.validateQuantity(produtoId, quantidade);

            if (!invalidEntry) {

                Produto produto = produtoFacade.find(Integer.parseInt(produtoId));
                carrinho.atualizar(produto, quantidade);

            }

            userPath = "/carrinho";

        } else if (userPath.equals("/compra")) {
            if (carrinho != null) {

                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String telefone = request.getParameter("telefone");
                String endereco = request.getParameter("endereco");
                String cidade = request.getParameter("cidade");
                String numCartaoCredito = request.getParameter("numCartaoCredito");

                boolean validationErrorFlag = false;
                validationErrorFlag = validator.validateForm(nome, email, telefone, endereco, cidade, numCartaoCredito, request);

                if (validationErrorFlag == true) {
                    request.setAttribute("validationErrorFlag", validationErrorFlag);
                    userPath = "/checkout";

                } else {

                    int pedidoId = pedidoManager.placePedido(nome, email, telefone, endereco, cidade, numCartaoCredito, carrinho);

                    if (pedidoId != 0) {

                        Locale locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");
                        String idioma = "";

                        if (locale != null) {

                            idioma = (String) locale.getLanguage();
                        }

                        carrinho = null;

                        session.invalidate();

                        if (!idioma.isEmpty()) {

                            request.setAttribute("idioma", idioma);
                        }

                        Map orderMap = pedidoManager.getDetalhesPedido(pedidoId);

                        request.setAttribute("cliente", orderMap.get("cliente"));
                        request.setAttribute("produtos", orderMap.get("produtos"));
                        request.setAttribute("gravarPedido", orderMap.get("gravarPedido"));
                        request.setAttribute("produtosSolicitados", orderMap.get("produtosSolicitados"));

                        userPath = "/confirmacao";

                    } else {
                        userPath = "/checkout";
                        request.setAttribute("orderFailureFlag", true);
                    }
                }

            }
        }

        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
