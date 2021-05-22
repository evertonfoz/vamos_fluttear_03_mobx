import 'package:flutter/material.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/stores/produto_selecionado_store.dart';

class BotoesWidgetParaListTileDeProdutosSelecionados extends StatelessWidget {
  final ProdutoSelecionadoStore produtoSelecionadoStore;

  const BotoesWidgetParaListTileDeProdutosSelecionados(
      {@required this.produtoSelecionadoStore});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Icon(Icons.add, size: 38),
          onTap: () => produtoSelecionadoStore.adicionarQuantidade(),
        ),
        InkWell(
          child: Icon(Icons.remove, size: 38),
          onTap: () {
            produtoSelecionadoStore.retirarQuantidade();
          },
        ),
        InkWell(
          child: Icon(Icons.delete, size: 38),
          onTap: () {},
        ),
      ],
    );
  }
}
