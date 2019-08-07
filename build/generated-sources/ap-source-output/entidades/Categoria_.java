package entidades;

import entidades.Produto;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-07-16T12:58:10")
@StaticMetamodel(Categoria.class)
public class Categoria_ { 

    public static volatile SingularAttribute<Categoria, String> nome;
    public static volatile CollectionAttribute<Categoria, Produto> produtoCollection;
    public static volatile SingularAttribute<Categoria, Short> id;

}