import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_app/domain/models/produto_model.dart';
import 'package:mobx_app/presentation/pages/home/stores/home_page_store.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/stores/produto_selecionado_store.dart';

part 'produtos_selecionados_store.g.dart';

class ProdutosSelecionadosStore = _ProdutosSelecionadosStore
    with _$ProdutosSelecionadosStore;

abstract class _ProdutosSelecionadosStore with Store {
  ObservableList<ProdutoSelecionadoStore> _produtosSelecionados =
      ObservableList<ProdutoSelecionadoStore>();

  @computed
  ObservableList<ProdutoSelecionadoStore> get produtosSelecionados {
    _produtosSelecionados.sort((a, b) => a.produtoModel.nome
        .toLowerCase()
        .compareTo(b.produtoModel.nome.toLowerCase()));
    return _produtosSelecionados;
  }

  @action
  registrarProduto({@required ProdutoModel produto, @required int quantidade}) {
    int indexDoProduto = _produtosSelecionados.indexWhere(
        (element) => element.produtoModel.produtoId == produto.produtoId);

    if (indexDoProduto < 0) {
      _produtosSelecionados.add(
        ProdutoSelecionadoStore(
          produtoModel: produto,
          quantidade: quantidade,
        ),
      );

      GetIt.instance.get<HomePageStore>().somarAoTotalDoPedido(
          valor: produto.valor * quantidade,
          operacao:
              "Item ${produto.nome.toUpperCase()} selecionado com a quantidade $quantidade");
    } else {
      _produtosSelecionados[indexDoProduto].adicionarQuantidade(
        quantidadeParaAdicionar: quantidade,
      );
    }
  }

  @action
  retirarProduto({@required ProdutoSelecionadoStore produtoSelecionadoStore}) {
    final HomePageStore _homePageStore = GetIt.I.get<HomePageStore>();
    final ProdutoModel _produtoModel = produtoSelecionadoStore.produtoModel;

    _produtosSelecionados.removeWhere(
        (produto) => produto.produtoModel.produtoId == _produtoModel.produtoId);

    _homePageStore.subtrairDoTotalDoPedido(
        valor: produtoSelecionadoStore.quantidade * _produtoModel.valor,
        operacao:
            'O produto ${_produtoModel.nome.toUpperCase()} foi retirado do pedido');
  }
}
