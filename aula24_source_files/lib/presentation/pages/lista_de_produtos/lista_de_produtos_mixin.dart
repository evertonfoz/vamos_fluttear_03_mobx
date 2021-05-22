import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_app/presentation/pages/lista_de_produtos/stores/lista_de_produtos_store.dart';
import 'package:numberpicker/numberpicker.dart';

mixin ListaDeProdutosMixin {
  exibirSelecaoDeQuantidade(
      {@required BuildContext context, @required String item}) async {
    final ListaDeProdutosStore _listaDeProdutosStore =
        GetIt.instance<ListaDeProdutosStore>();

    return await showDialog<int>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quantidade para \n${item.toUpperCase()}'),
          content: Observer(builder: (_) {
            return NumberPicker(
              value: _listaDeProdutosStore.quantidadeSelecionada,
              minValue: 1,
              maxValue: 10,
              onChanged: (value) =>
                  _listaDeProdutosStore.atualizarQuantidadeSelecionada(value),
            );
          }),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text('Confirmar'),
              onPressed: () => Navigator.pop(
                  context, _listaDeProdutosStore.quantidadeSelecionada),
            ),
          ],
        );
      },
    );
  }
}
