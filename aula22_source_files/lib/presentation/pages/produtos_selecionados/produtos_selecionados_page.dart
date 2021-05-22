import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/stores/produtos_selecionados_store.dart';

class ProdutosSelecionadosPage extends StatelessWidget {
  final ProdutosSelecionadosStore _produtosSelecionadosStore =
      GetIt.I.get<ProdutosSelecionadosStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (_produtosSelecionadosStore.produtosSelecionados.length == 0) {
        return Center(
          child: Text('Nenhum produto ainda foi selecionado'),
        );
      }

      return ListView.builder(
        itemCount: _produtosSelecionadosStore.produtosSelecionados.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _produtosSelecionadosStore
                  .produtosSelecionados[index].produtoModel.nome,
            ),
            subtitle: Text(_produtosSelecionadosStore
                .produtosSelecionados[index].produtoModel.descricao),
          );
        },
      );
    });
  }
}
