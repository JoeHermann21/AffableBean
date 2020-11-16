/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author andre
 */
@Entity
@Table(name = "pedido")
@NamedQueries({
    @NamedQuery(name = "Pedido.findAll", query = "SELECT p FROM Pedido p"),
    @NamedQuery(name = "Pedido.findById", query = "SELECT p FROM Pedido p WHERE p.id = :id"),
    @NamedQuery(name = "Pedido.findByTotal", query = "SELECT p FROM Pedido p WHERE p.total = :total"),
    @NamedQuery(name = "Pedido.findByDataCriacao", query = "SELECT p FROM Pedido p WHERE p.dataCriacao = :dataCriacao"),
    @NamedQuery(name = "Pedido.findByNumeroConfirmacao", query = "SELECT p FROM Pedido p WHERE p.numeroConfirmacao = :numeroConfirmacao")})
public class Pedido implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "total")
    private BigDecimal total;
    @Basic(optional = false)
    @Column(name = "data_criacao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataCriacao;
    @Basic(optional = false)
    @Column(name = "numero_confirmacao")
    private int numeroConfirmacao;
    @JoinColumn(name = "cliente_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Cliente cliente;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pedido")
    private Collection<ProdutoSolicitado> produtoSolicitadoCollection;

    public Pedido() {
    }

    public Pedido(Integer id) {
        this.id = id;
    }

    public Pedido(Integer id, BigDecimal total, Date dataCriacao, int numeroConfirmacao) {
        this.id = id;
        this.total = total;
        this.dataCriacao = dataCriacao;
        this.numeroConfirmacao = numeroConfirmacao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public int getNumeroConfirmacao() {
        return numeroConfirmacao;
    }

    public void setNumeroConfirmacao(int numeroConfirmacao) {
        this.numeroConfirmacao = numeroConfirmacao;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Collection<ProdutoSolicitado> getProdutoSolicitadoCollection() {
        return produtoSolicitadoCollection;
    }

    public void setProdutoSolicitadoCollection(Collection<ProdutoSolicitado> produtoSolicitadoCollection) {
        this.produtoSolicitadoCollection = produtoSolicitadoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pedido)) {
            return false;
        }
        Pedido other = (Pedido) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Pedido[ id=" + id + " ]";
    }
    
}
