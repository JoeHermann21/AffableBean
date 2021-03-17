/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sessao;

import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Pedido;

/**
 *
 * @author andre
 */
@Stateless
public class PedidoFacade extends AbstractFacade<Pedido> {
    @PersistenceContext(unitName = "AffableBeanPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public PedidoFacade() {
        super(Pedido.class);
    }
    
	public Pedido find(Object id) {
        Pedido pedido = em.find(Pedido.class, id);
        em.refresh(pedido);
        return pedido;
    }
	@RolesAllowed("affableBeanAdmin")
	public Pedido findbyCliente(Object cliente) {
        return (Pedido) em.createNamedQuery("Pedido.findbyCliente").setParameter("cliente", cliente).getSingleResult();
    }
}
