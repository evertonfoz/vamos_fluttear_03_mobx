import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx_app/presentation/mixins/presentation_mixin.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/stores/produto_selecionado_store.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/widgets/botoes_widget_para_listtile_de_produtos_selecionados.dart';

class ListTileParaProdutosSelecionadosWidget extends StatelessWidget
    with PresentationMixin {
  final ProdutoSelecionadoStore produtoSelecionadoStore;
  final formatacaoMonetaria = NumberFormat.simpleCurrency(locale: 'pt_BR');

  ListTileParaProdutosSelecionadosWidget(
      {@required this.produtoSelecionadoStore});

  _imagemDoProduto() {
    return CircleAvatar(
      radius: 25,
      backgroundImage: AssetImage(
        produtoSelecionadoStore.produtoModel.urlImagem,
      ),
    );
  }

  _nomeEDescricaoDoProduto() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gerarTexto(
              texto: produtoSelecionadoStore.produtoModel.nome,
              negrito: true,
            ),
            gerarTexto(
              texto: produtoSelecionadoStore.produtoModel.descricao,
              tamanhoDaFonte: 15,
            ),
          ],
        ),
      ),
    );
  }

  _valoresParaProdutoSelecionado() {
    final produtoModel = produtoSelecionadoStore.produtoModel;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Observer(
          builder: (_) => gerarTexto(
            texto: produtoSelecionadoStore.quantidade,
            tamanhoDaFonte: 30,
            negrito: true,
            cor: Colors.indigo[900],
            alinhamento: TextAlign.end,
          ),
        ),
        gerarTexto(
          texto: ' x ',
          negrito: true,
          cor: Colors.blue[300],
        ),
        gerarTexto(
          texto: formatacaoMonetaria.format(produtoModel.valor),
          negrito: true,
          cor: Colors.blue[300],
          alinhamento: TextAlign.end,
        ),
        gerarTexto(
          texto: ' = ',
          negrito: true,
          cor: Colors.blue[300],
        ),
        gerarTexto(
          texto: formatacaoMonetaria
              .format(produtoSelecionadoStore.quantidade * produtoModel.valor),
          negrito: true,
          cor: Colors.indigo[900],
          alinhamento: TextAlign.end,
          tamanhoDaFonte: 30,
        ),
      ],
    );
  }

  _dadosDoProdutoSelecionado() {
    return Row(
      children: [
        _imagemDoProduto(),
        _nomeEDescricaoDoProduto(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _dadosDoProdutoSelecionado(),
          _valoresParaProdutoSelecionado(),
          BotoesWidgetParaListTileDeProdutosSelecionados(
            produtoSelecionadoStore: produtoSelecionadoStore,
          ),
        ],
      ),
    );
  }
}
