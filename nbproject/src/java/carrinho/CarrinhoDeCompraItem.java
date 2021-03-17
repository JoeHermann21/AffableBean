package carrinho;

import model.Produto;

public class CarrinhoDeCompraItem {

    Produto produto;
    short quantidade;

    public CarrinhoDeCompraItem(Produto produto) {
        this.produto = produto;
        quantidade = 1;
    }

    public Produto getProduto() {
        return produto;
    }

    public short getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(short quantidade) {
        this.quantidade = quantidade;
    }

    public void incrementaQuantidade() {
        quantidade++;
    }

    public void decrementaQuantidade() {
        quantidade--;
    }

    public double getTotal() {
        double valorTotal = 0;
        valorTotal = (this.getQuantidade() * produto.getPreco().doubleValue());
        return valorTotal;
    }

}