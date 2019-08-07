package entidades;

import entidades.Cliente;
import entidades.ProdutoSolicitado;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-07-16T12:58:10")
@StaticMetamodel(Pedido.class)
public class Pedido_ { 

    public static volatile SingularAttribute<Pedido, Cliente> clienteId;
    public static volatile SingularAttribute<Pedido, BigDecimal> valor;
    public static volatile SingularAttribute<Pedido, Integer> id;
    public static volatile SingularAttribute<Pedido, Date> dataCriacao;
    public static volatile CollectionAttribute<Pedido, ProdutoSolicitado> produtoSolicitadoCollection;
    public static volatile SingularAttribute<Pedido, Integer> numeroConfirmacao;

}