/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.ServletSecurity.TransportGuarantee;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Pedido;
import sessao.ClienteFacade;
import sessao.PedidoFacade;
import sessao.PedidoManager;

/**
 *
 * @author tgiunipero
 */
@WebServlet(name = "AdminServlet",
            urlPatterns = {"/admin/",
                           "/admin/viewPedidos",
                           "/admin/viewClientes",
                           "/admin/clienteGravar",
                           "/admin/pedidoGravar",
                           "/admin/logout"})
@ServletSecurity( 
	@HttpConstraint(transportGuarantee = TransportGuarantee.CONFIDENTIAL,
							rolesAllowed = {"affableBeanAdmin"}) )
public class AdminServlet extends HttpServlet {

    @EJB
    private PedidoManager pedidoManager;
    @EJB
    private ClienteFacade clienteFacade;
    @EJB
    private PedidoFacade pedidoFacade;

    private String userPath;
    private Cliente cliente;
    private Pedido pedido;
    private List pedidoLista = new ArrayList();
    private List clienteLista = new ArrayList();


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        userPath = request.getServletPath();

        if (userPath.equals("/admin/viewClientes")) {
            clienteLista = clienteFacade.findAll();
            request.setAttribute("clienteLista", clienteLista);
        }

        if (userPath.equals("/admin/viewPedidos")) {
            pedidoLista = pedidoFacade.findAll();
            request.setAttribute("pedidoLista", pedidoLista);
        }

        if (userPath.equals("/admin/clienteGravar")) {

            String clienteId = request.getQueryString();

            cliente = clienteFacade.find(Integer.parseInt(clienteId));
            request.setAttribute("clienteGravar", clienteId);

            pedido = pedidoFacade.findbyCliente(cliente);
            request.setAttribute("pedido", pedido);
        }

        if (userPath.equals("/admin/pedidoGravar")) {

            String pedidoId = request.getQueryString();

            Map orderMap = pedidoManager.getDetalhesPedido(Integer.parseInt(pedidoId));

            request.setAttribute("cliente", orderMap.get("cliente"));
            request.setAttribute("produtos", orderMap.get("produtos"));
            request.setAttribute("pedidoGravar", orderMap.get("pedidoGravar"));
            request.setAttribute("produtosSolicitados", orderMap.get("produtosSolicitados"));
        }

        if (userPath.equals("/admin/logout")) {
            session = request.getSession();
            session.invalidate();
            response.sendRedirect("/AffableBean/admin/");
            return;
        }

        userPath = "/admin/index.jsp";
        try {
            request.getRequestDispatcher(userPath).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}