import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_app/presentation/pages/home/stores/home_page_store.dart';
import 'package:mobx_app/presentation/pages/lista_de_produtos/lista_de_produtos_page.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

class HomePage extends StatelessWidget {
  final HomePageStore _homePageStore = HomePageStore();
  final List<Widget> _paginas = [
    ListaDeProdutosPage(),
    ProdutosSelecionadosPage(),
  ];

  _bottomNavigationBarItem(
      {@required IconData icone, @required String titulo}) {
    return BottomNavigationBarItem(
      icon: Icon(icone),
      label: titulo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(_homePageStore.tituloHomePage);
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          return _paginas[_homePageStore.paginaAtual];
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            iconSize: 48,
            currentIndex: _homePageStore.paginaAtual,
            onTap: (index) => _homePageStore.alternarPagina(index),
            items: [
              _bottomNavigationBarItem(
                icone: Icons.menu,
                titulo: 'Produtos',
              ),
              _bottomNavigationBarItem(
                icone: Icons.add_shopping_cart,
                titulo: 'Pedido',
              )
            ],
          );
        },
      ),
    );
  }
}
