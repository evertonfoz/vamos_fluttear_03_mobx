import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_app/data/datasources/produtos_datasource.dart'
    as datasource;
import 'package:mobx_app/domain/models/produto_model.dart';
import 'package:mobx_app/presentation/pages/lista_de_produtos/lista_de_produtos_mixin.dart';
import 'package:mobx_app/presentation/pages/lista_de_produtos/stores/lista_de_produtos_store.dart';
import 'package:mobx_app/presentation/pages/lista_de_produtos/widgets/listtile_para_lista_de_produtos_widget.dart';

class ListaDeProdutosPage extends StatelessWidget with ListaDeProdutosMixin {
  @override
  Widget build(BuildContext context) {
    final List<ProdutoModel> produtos = datasource.listaDeProdutos();
    final ListaDeProdutosStore listaDeProdutosStore =
        GetIt.instance<ListaDeProdutosStore>();

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8),
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        return ListTileParaListaDeProdutosWidget(
          produtoModel: produtos[index],
          funcaoDeCallbackParaInserirProduto: () async {
            int quantidade = await exibirSelecaoDeQuantidade(
                context: context, item: produtos[index].nome);
            if (quantidade != null)
              listaDeProdutosStore.registrarProduto(
                produto: produtos[index],
                quantidade: quantidade,
              );
            // print('Você selecionou quantidade: $quantidade');
          },
        );
      },
    );
  }
}
