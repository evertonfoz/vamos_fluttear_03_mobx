import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_app/domain/models/produto_model.dart';

part 'produto_selecionado_store.g.dart';

class ProdutoSelecionadoStore = _ProdutoSelecionadoStore
    with _$ProdutoSelecionadoStore;

abstract class _ProdutoSelecionadoStore with Store {
  ProdutoModel produtoModel;

  @observable
  int quantidade;

  _ProdutoSelecionadoStore(
      {@required this.produtoModel, @required this.quantidade});
}
