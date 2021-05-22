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
  Computed<double> _$totalPedidoComputed;

  @override
  double get totalPedido =>
      (_$totalPedidoComputed ??= Computed<double>(() => super.totalPedido,
              name: '_HomePageStore.totalPedido'))
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

  final _$_totalPedidoAtom = Atom(name: '_HomePageStore._totalPedido');

  @override
  double get _totalPedido {
    _$_totalPedidoAtom.reportRead();
    return super._totalPedido;
  }

  @override
  set _totalPedido(double value) {
    _$_totalPedidoAtom.reportWrite(value, super._totalPedido, () {
      super._totalPedido = value;
    });
  }

  final _$orientacaoJaLidaAtom = Atom(name: '_HomePageStore.orientacaoJaLida');

  @override
  bool get orientacaoJaLida {
    _$orientacaoJaLidaAtom.reportRead();
    return super.orientacaoJaLida;
  }

  @override
  set orientacaoJaLida(bool value) {
    _$orientacaoJaLidaAtom.reportWrite(value, super.orientacaoJaLida, () {
      super.orientacaoJaLida = value;
    });
  }

  final _$operacaoRealizadaAtom =
      Atom(name: '_HomePageStore.operacaoRealizada');

  @override
  String get operacaoRealizada {
    _$operacaoRealizadaAtom.reportRead();
    return super.operacaoRealizada;
  }

  @override
  set operacaoRealizada(String value) {
    _$operacaoRealizadaAtom.reportWrite(value, super.operacaoRealizada, () {
      super.operacaoRealizada = value;
    });
  }

  final _$exibirBottonNavigationBarAtom =
      Atom(name: '_HomePageStore.exibirBottonNavigationBar');

  @override
  bool get exibirBottonNavigationBar {
    _$exibirBottonNavigationBarAtom.reportRead();
    return super.exibirBottonNavigationBar;
  }

  @override
  set exibirBottonNavigationBar(bool value) {
    _$exibirBottonNavigationBarAtom
        .reportWrite(value, super.exibirBottonNavigationBar, () {
      super.exibirBottonNavigationBar = value;
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
  dynamic somarAoTotalDoPedido(
      {@required double valor, @required String operacao}) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.somarAoTotalDoPedido');
    try {
      return super.somarAoTotalDoPedido(valor: valor, operacao: operacao);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic subtrairDoTotalDoPedido(
      {@required double valor, @required String operacao}) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.subtrairDoTotalDoPedido');
    try {
      return super.subtrairDoTotalDoPedido(valor: valor, operacao: operacao);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic registrarLeituraOrientacao() {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.registrarLeituraOrientacao');
    try {
      return super.registrarLeituraOrientacao();
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alternarExibirBottonNavigationBar() {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.alternarExibirBottonNavigationBar');
    try {
      return super.alternarExibirBottonNavigationBar();
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paginaAtual: ${paginaAtual},
orientacaoJaLida: ${orientacaoJaLida},
operacaoRealizada: ${operacaoRealizada},
exibirBottonNavigationBar: ${exibirBottonNavigationBar},
tituloHomePage: ${tituloHomePage},
totalPedido: ${totalPedido}
    ''';
  }
}
