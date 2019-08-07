package entidades;

import entidades.Pedido;
import entidades.Produto;
import entidades.ProdutoSolicitadoPK;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-07-16T12:58:10")
@StaticMetamodel(ProdutoSolicitado.class)
public class ProdutoSolicitado_ { 

    public static volatile SingularAttribute<ProdutoSolicitado, Produto> produto;
    public static volatile SingularAttribute<ProdutoSolicitado, Pedido> pedido;
    public static volatile SingularAttribute<ProdutoSolicitado, Short> quantidade;
    public static volatile SingularAttribute<ProdutoSolicitado, ProdutoSolicitadoPK> produtoSolicitadoPK;

}