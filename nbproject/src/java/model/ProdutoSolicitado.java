/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author andre
 */
@Entity
@Table(name = "produto_solicitado")
@NamedQueries({
    @NamedQuery(name = "ProdutoSolicitado.findAll", query = "SELECT p FROM ProdutoSolicitado p"),
    @NamedQuery(name = "ProdutoSolicitado.findByPedidoId", query = "SELECT p FROM ProdutoSolicitado p WHERE p.produtoSolicitadoPK.pedidoId = :pedidoId"),
    @NamedQuery(name = "ProdutoSolicitado.findByProdutoId", query = "SELECT p FROM ProdutoSolicitado p WHERE p.produtoSolicitadoPK.produtoId = :produtoId"),
    @NamedQuery(name = "ProdutoSolicitado.findByQuantidade", query = "SELECT p FROM ProdutoSolicitado p WHERE p.quantidade = :quantidade")})
public class ProdutoSolicitado implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProdutoSolicitadoPK produtoSolicitadoPK;
    @Basic(optional = false)
    @Column(name = "quantidade")
    private short quantidade;
    @JoinColumn(name = "pedido_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Pedido pedido;
    @JoinColumn(name = "produto_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Produto produto;

    public ProdutoSolicitado() {
    }

    public ProdutoSolicitado(ProdutoSolicitadoPK produtoSolicitadoPK) {
        this.produtoSolicitadoPK = produtoSolicitadoPK;
    }

    public ProdutoSolicitado(ProdutoSolicitadoPK produtoSolicitadoPK, short quantidade) {
        this.produtoSolicitadoPK = produtoSolicitadoPK;
        this.quantidade = quantidade;
    }

    public ProdutoSolicitado(int pedidoId, int produtoId) {
        this.produtoSolicitadoPK = new ProdutoSolicitadoPK(pedidoId, produtoId);
    }

    public ProdutoSolicitadoPK getProdutoSolicitadoPK() {
        return produtoSolicitadoPK;
    }

    public void setProdutoSolicitadoPK(ProdutoSolicitadoPK produtoSolicitadoPK) {
        this.produtoSolicitadoPK = produtoSolicitadoPK;
    }

    public short getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(short quantidade) {
        this.quantidade = quantidade;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (produtoSolicitadoPK != null ? produtoSolicitadoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProdutoSolicitado)) {
            return false;
        }
        ProdutoSolicitado other = (ProdutoSolicitado) object;
        if ((this.produtoSolicitadoPK == null && other.produtoSolicitadoPK != null) || (this.produtoSolicitadoPK != null && !this.produtoSolicitadoPK.equals(other.produtoSolicitadoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ProdutoSolicitado[ produtoSolicitadoPK=" + produtoSolicitadoPK + " ]";
    }
    
}
