// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_selecionado_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoSelecionadoStore on _ProdutoSelecionadoStore, Store {
  final _$quantidadeAtom = Atom(name: '_ProdutoSelecionadoStore.quantidade');

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  @override
  String toString() {
    return '''
quantidade: ${quantidade}
    ''';
  }
}
