import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  @observable
  int paginaAtual = 0;

  @computed
  String get tituloHomePage =>
      paginaAtual == 0 ? 'Produtos disponíveis' : 'Produtos selecionados';

  @action
  alternarPagina(int novaPagina) {
    paginaAtual = novaPagina;
  }
}
