import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  @observable
  int paginaAtual = 0;

  @observable
  double _totalPedido = 0;

  @observable
  bool orientacaoJaLida = false;

  @observable
  String operacaoRealizada;

  @computed
  String get tituloHomePage =>
      paginaAtual == 0 ? 'Produtos disponíveis' : 'Produtos selecionados';

  @computed
  double get totalPedido => _totalPedido;

  @action
  alternarPagina(int novaPagina) {
    paginaAtual = novaPagina;
  }

  @action
  somarAoTotalDoPedido({@required double valor}) {
    _totalPedido += valor;
    operacaoRealizada = "Teste";
  }

  @action
  registrarLeituraOrientacao() {
    orientacaoJaLida = true;
  }
}
