import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx_app/domain/models/produto_model.dart';
import 'package:mobx_app/presentation/mixins/presentation_mixin.dart';

class ListTileParaListaDeProdutosWidget extends StatelessWidget
    with PresentationMixin {
  final formacaoMonetaria = NumberFormat.simpleCurrency(locale: 'pt_BR');
  final ProdutoModel produtoModel;
  final Function funcaoDeCallbackParaInserirProduto;

  ListTileParaListaDeProdutosWidget({
    @required this.produtoModel,
    @required this.funcaoDeCallbackParaInserirProduto,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(produtoModel.urlImagem),
      ),
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gerarTexto(texto: produtoModel.nome, negrito: true),
                gerarTexto(texto: produtoModel.descricao, tamanhoDaFonte: 15),
              ],
            ),
          ),
          gerarTexto(
            texto: formacaoMonetaria.format(produtoModel.valor),
            negrito: true,
            cor: Colors.blue,
          ),
        ],
      ),
      trailing: Column(
        children: [
          InkWell(
            child: Icon(
              Icons.add,
              size: 48,
            ),
            onTap: funcaoDeCallbackParaInserirProduto,
          ),
        ],
      ),
    );
  }
}
