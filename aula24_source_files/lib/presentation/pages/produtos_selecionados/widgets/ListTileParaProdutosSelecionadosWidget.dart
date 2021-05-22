import 'package:flutter/material.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/stores/produto_selecionado_store.dart';

class ListTileParaProdutosSelecionadosWidget extends StatelessWidget {
  final ProdutoSelecionadoStore produtoSelecionadoStore;

  ListTileParaProdutosSelecionadosWidget(
      {@required this.produtoSelecionadoStore});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        produtoSelecionadoStore.produtoModel.nome,
      ),
      subtitle: Text(produtoSelecionadoStore.produtoModel.descricao),
    );
  }
}
