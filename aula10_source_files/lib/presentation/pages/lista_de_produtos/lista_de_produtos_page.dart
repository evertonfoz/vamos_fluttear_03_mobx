import 'package:flutter/material.dart';
import 'package:mobx_app/data/datasources/produtos_datasource.dart'
    as datasource;
import 'package:mobx_app/domain/models/produto_model.dart';
import 'package:mobx_app/presentation/pages/lista_de_produtos/widgets/listtile_para_lista_de_produtos_widget.dart';

class ListaDeProdutosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ProdutoModel> produtos = datasource.listaDeProdutos();
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8),
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        return ListTileParaListaDeProdutosWidget(produtoModel: produtos[index]);
      },
    );
  }
}
