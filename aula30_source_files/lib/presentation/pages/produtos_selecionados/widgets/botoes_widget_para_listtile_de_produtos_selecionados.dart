import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/stores/produto_selecionado_store.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/stores/produtos_selecionados_store.dart';
import 'package:mobx_app/presentation/widgets/alert_dialog_widget.dart';

class BotoesWidgetParaListTileDeProdutosSelecionados extends StatelessWidget {
  final ProdutoSelecionadoStore produtoSelecionadoStore;

  const BotoesWidgetParaListTileDeProdutosSelecionados(
      {@required this.produtoSelecionadoStore});

  _gerarDialogParaRemover({@required BuildContext context}) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialogWidget(
            iconeDoTitulo: Icon(
              Icons.message,
              color: Colors.red,
            ),
            titulo: 'Quer remover?',
            mensagem: 'Confirma a retirada de '
                '${produtoSelecionadoStore.produtoModel.nome.toUpperCase()}',
            botoes: [
              TextButton(
                child: Text('Não'),
                onPressed: () => Navigator.pop(context, false),
              ),
              TextButton(
                child: Text('Sim'),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        });
  }

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
          onTap: () async {
            final _remover = await _gerarDialogParaRemover(context: context);
            if (_remover) {
              GetIt.I.get<ProdutosSelecionadosStore>().retirarProduto(
                    produtoSelecionadoStore: produtoSelecionadoStore,
                  );
            }
          },
        ),
      ],
    );
  }
}
