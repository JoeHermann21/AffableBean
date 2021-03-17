/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessao;

import carrinho.CarrinhoDeCompra;
import carrinho.CarrinhoDeCompraItem;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Cliente;
import model.Pedido;
import model.Produto;
import model.ProdutoSolicitado;
import model.ProdutoSolicitadoPK;

/**
 *
 * @author andre
 */
@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class PedidoManager {

    @PersistenceContext(unitName = "AffableBeanPU")
    private EntityManager em;
    @Resource
    private SessionContext context;
    @EJB
    private ProdutoFacade produtoFacade;
    @EJB
    private PedidoFacade pedidoFacade;
    @EJB
    private ProdutoSolicitadoFacade produtoSolicitadoFacade;
	

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public int placePedido(String nome, String email, String telefone, String endereco, String cidade, String numCartaoCredito, CarrinhoDeCompra carrinho) {
        try {
            Cliente cliente = adicionarCliente(nome, email, telefone, endereco, cidade, numCartaoCredito);
            Pedido pedido = adicionarPedido(cliente, carrinho);
            adicionarItensPedido(pedido, carrinho);
            return pedido.getId();
        } catch (Exception e) {
            context.setRollbackOnly();
            return 0;
        }
    }

    private Cliente adicionarCliente(String nome, String email, String telefone, String endereco, String cidade, String numCartaoCredito) {
        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setEmail(email);
        cliente.setTelefone(telefone);
        cliente.setEndereco(endereco);
        cliente.setCidade(cidade);
        cliente.setNumCartaoCredito(numCartaoCredito);

        em.persist(cliente);
        return cliente;
    }

    private Pedido adicionarPedido(Cliente cliente, CarrinhoDeCompra carrinho) {

        Pedido pedido = new Pedido();
        pedido.setCliente(cliente);
        pedido.setTotal(BigDecimal.valueOf(carrinho.getTotal()));

        Random random = new Random();
        int i = random.nextInt(999999999);
        pedido.setNumeroConfirmacao(i);

        em.persist(pedido);
        return pedido;
    }

    private void adicionarItensPedido(Pedido pedido, CarrinhoDeCompra carrinho) {

        em.flush();

        List<CarrinhoDeCompraItem> itens = carrinho.getItens();

        for (CarrinhoDeCompraItem ccItem : itens) {

            int produtoId = ccItem.getProduto().getId();

            ProdutoSolicitadoPK produtoSolicitadoPK = new ProdutoSolicitadoPK();
            produtoSolicitadoPK.setPedidoId(pedido.getId());
            produtoSolicitadoPK.setProdutoId(produtoId);

            ProdutoSolicitado itemSolicitado = new ProdutoSolicitado(produtoSolicitadoPK);

            itemSolicitado.setQuantidade(ccItem.getQuantidade());

            em.persist(itemSolicitado);
        }
    }
	
	 public Map getDetalhesPedido(int pedidoId) {

        Map orderMap = new HashMap();

        Pedido pedido = pedidoFacade.find(pedidoId);

        Cliente cliente = pedido.getCliente();

        List<ProdutoSolicitado> produtosSolicitados = produtoSolicitadoFacade.findByPedidoId(pedidoId);

        List<Produto> produtos = new ArrayList<Produto>();

        for (ProdutoSolicitado ps : produtosSolicitados) {

            Produto p = (Produto) produtoFacade.find(ps.getProdutoSolicitadoPK().getProdutoId());
            produtos.add(p);
        }

        orderMap.put("gravarPedido", pedido);
        orderMap.put("cliente", cliente);
        orderMap.put("produtosSolicitados", produtosSolicitados);
        orderMap.put("produtos", produtos);

        return orderMap;
    }

}
