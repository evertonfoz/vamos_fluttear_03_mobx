// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageStore on _HomePageStore, Store {
  Computed<String> _$tituloHomePageComputed;

  @override
  String get tituloHomePage =>
      (_$tituloHomePageComputed ??= Computed<String>(() => super.tituloHomePage,
              name: '_HomePageStore.tituloHomePage'))
          .value;

  final _$paginaAtualAtom = Atom(name: '_HomePageStore.paginaAtual');

  @override
  int get paginaAtual {
    _$paginaAtualAtom.reportRead();
    return super.paginaAtual;
  }

  @override
  set paginaAtual(int value) {
    _$paginaAtualAtom.reportWrite(value, super.paginaAtual, () {
      super.paginaAtual = value;
    });
  }

  final _$_HomePageStoreActionController =
      ActionController(name: '_HomePageStore');

  @override
  dynamic alternarPagina(int novaPagina) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.alternarPagina');
    try {
      return super.alternarPagina(novaPagina);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paginaAtual: ${paginaAtual},
tituloHomePage: ${tituloHomePage}
    ''';
  }
}
