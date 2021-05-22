// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_de_produtos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaDeProdutosStore on _ListaDeProdutosStore, Store {
  Computed<int> _$quantidadeSelecionadaComputed;

  @override
  int get quantidadeSelecionada => (_$quantidadeSelecionadaComputed ??=
          Computed<int>(() => super.quantidadeSelecionada,
              name: '_ListaDeProdutosStore.quantidadeSelecionada'))
      .value;

  final _$_quantidadeSelecionadaAtom =
      Atom(name: '_ListaDeProdutosStore._quantidadeSelecionada');

  @override
  int get _quantidadeSelecionada {
    _$_quantidadeSelecionadaAtom.reportRead();
    return super._quantidadeSelecionada;
  }

  @override
  set _quantidadeSelecionada(int value) {
    _$_quantidadeSelecionadaAtom
        .reportWrite(value, super._quantidadeSelecionada, () {
      super._quantidadeSelecionada = value;
    });
  }

  final _$_ListaDeProdutosStoreActionController =
      ActionController(name: '_ListaDeProdutosStore');

  @override
  dynamic atualizarQuantidadeSelecionada(int novaQuantidade) {
    final _$actionInfo = _$_ListaDeProdutosStoreActionController.startAction(
        name: '_ListaDeProdutosStore.atualizarQuantidadeSelecionada');
    try {
      return super.atualizarQuantidadeSelecionada(novaQuantidade);
    } finally {
      _$_ListaDeProdutosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic registrarProduto({ProdutoModel produto, int quantidade}) {
    final _$actionInfo = _$_ListaDeProdutosStoreActionController.startAction(
        name: '_ListaDeProdutosStore.registrarProduto');
    try {
      return super.registrarProduto(produto: produto, quantidade: quantidade);
    } finally {
      _$_ListaDeProdutosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantidadeSelecionada: ${quantidadeSelecionada}
    ''';
  }
}
