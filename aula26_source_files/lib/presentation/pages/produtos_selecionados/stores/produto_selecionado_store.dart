import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_app/domain/models/produto_model.dart';
import 'package:mobx_app/presentation/pages/home/stores/home_page_store.dart';

part 'produto_selecionado_store.g.dart';

class ProdutoSelecionadoStore = _ProdutoSelecionadoStore
    with _$ProdutoSelecionadoStore;

abstract class _ProdutoSelecionadoStore with Store {
  ProdutoModel produtoModel;
  final HomePageStore _homePageStore = GetIt.I.get<HomePageStore>();

  _ProdutoSelecionadoStore(
      {@required this.produtoModel, @required this.quantidade});

  @observable
  int quantidade;

  @action
  adicionarQuantidade({@required int quantidadeParaAdicionar = 1}) {
    quantidade += quantidadeParaAdicionar;

    _homePageStore.somarAoTotalDoPedido(
      valor: produtoModel.valor * quantidadeParaAdicionar,
      operacao:
          'Produto ${produtoModel.nome.toUpperCase()} atualizado para $quantidade.',
    );
  }
}
