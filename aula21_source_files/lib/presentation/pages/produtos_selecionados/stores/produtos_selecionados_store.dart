import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_app/domain/models/';
import 'package:mobx_app/domain/models/produto_model.dart';
import 'package:mobx_app/domain/models/produto_pedido_model.dart';

part 'produtos_selecionados_store.g.dart';

class ProdutosSelecionadosStore = _ProdutosSelecionadosStore
    with _$ProdutosSelecionadosStore;

abstract class _ProdutosSelecionadosStore with Store {
  ObservableList<ProdutoPedidoModel> _produtosSelecionados =
      ObservableList<ProdutoPedidoModel>();

  @computed
  ObservableList<ProdutoPedidoModel> get produtosSelecionados {
    _produtosSelecionados.sort((a, b) => a.produtoModel.nome
        .toLowerCase()
        .compareTo(b.produtoModel.nome.toLowerCase()));
    return _produtosSelecionados;
  }

  @action
  registrarProduto({@required ProdutoModel produto, @required int quantidade}) {
    _produtosSelecionados.add(
      ProdutoPedidoModel(
        produtoModel: produto,
        quantidade: quantidade,
      ),
    );
  }
}
