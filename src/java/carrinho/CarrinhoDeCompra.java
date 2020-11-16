/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrinho;

import model.Produto;
import java.util.*;

/**
 *
 * @author andre
 */
public class CarrinhoDeCompra {

    List<CarrinhoDeCompraItem> itens;
    int numeroDeItens;
    double total;

    public CarrinhoDeCompra() {
        itens = new ArrayList<CarrinhoDeCompraItem>();
        numeroDeItens = 0;
        total = 0;
    }

    public synchronized void adicionarItem(Produto produto) {
        boolean novoItem = true;

        for (CarrinhoDeCompraItem scItem : itens) {

            if (scItem.getProduto().getId() == produto.getId()) {

                novoItem = false;
                scItem.incrementaQuantidade();
            }
        }

        if (novoItem) {
            CarrinhoDeCompraItem scItem = new CarrinhoDeCompraItem(produto);
            itens.add(scItem);
        }
    }

    public synchronized void atualizar(Produto produto, String quantidade) {
        short qtd = -1;

        // cast quantity as short
        qtd = Short.parseShort(quantidade);

        if (qtd >= 0) {

            CarrinhoDeCompraItem item = null;

            for (CarrinhoDeCompraItem scItem : itens) {

                if (scItem.getProduto().getId() == produto.getId()) {

                    if (qtd != 0) {
                        // set item quantity to new value
                        scItem.setQuantidade(qtd);
                    } else {
                        // if quantity equals 0, save item and break
                        item = scItem;
                        break;
                    }
                }
            }

            if (item != null) {
                // remove from cart
                itens.remove(item);
            }
        }
    }

      public synchronized List<CarrinhoDeCompraItem> getItens() {

        return itens;
    }

    public synchronized int getNumeroDeItens() {

        numeroDeItens = 0;

        for (CarrinhoDeCompraItem scItem : itens) {

            numeroDeItens += scItem.getQuantidade();
        }

        return numeroDeItens;
    }

    public synchronized double getSubtotal() {

        double valorTotal = 0;

        for (CarrinhoDeCompraItem scItem : itens) {

            Produto produto = (Produto) scItem.getProduto();
            valorTotal += (scItem.getQuantidade() * produto.getPreco().doubleValue());
        }

        return valorTotal;
    }


    public synchronized void calcularTotal(String surcharge) {
        double valorTotal = 0;

        // cast surcharge as double
        double s = Double.parseDouble(surcharge);

        valorTotal = this.getSubtotal();
        valorTotal += s;

        total = valorTotal;
    }
    
    public synchronized double getTotal() {
        return total;
    }

    
    public synchronized void limpar() {
        itens.clear();
        numeroDeItens = 0;
        total = 0;
    }
}
