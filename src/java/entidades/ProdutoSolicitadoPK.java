/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author e.andre.germano
 */
@Embeddable
public class ProdutoSolicitadoPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "pedido_id")
    private int pedidoId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "produto_id")
    private int produtoId;

    public ProdutoSolicitadoPK() {
    }

    public ProdutoSolicitadoPK(int pedidoId, int produtoId) {
        this.pedidoId = pedidoId;
        this.produtoId = produtoId;
    }

    public int getPedidoId() {
        return pedidoId;
    }

    public void setPedidoId(int pedidoId) {
        this.pedidoId = pedidoId;
    }

    public int getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(int produtoId) {
        this.produtoId = produtoId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) pedidoId;
        hash += (int) produtoId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProdutoSolicitadoPK)) {
            return false;
        }
        ProdutoSolicitadoPK other = (ProdutoSolicitadoPK) object;
        if (this.pedidoId != other.pedidoId) {
            return false;
        }
        if (this.produtoId != other.produtoId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.ProdutoSolicitadoPK[ pedidoId=" + pedidoId + ", produtoId=" + produtoId + " ]";
    }
    
}
