/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sessao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.ProdutoSolicitado;

/**
 *
 * @author andre
 */
@Stateless
public class ProdutoSolicitadoFacade extends AbstractFacade<ProdutoSolicitado> {
    @PersistenceContext(unitName = "AffableBeanPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProdutoSolicitadoFacade() {
        super(ProdutoSolicitado.class);
    }
    
}
