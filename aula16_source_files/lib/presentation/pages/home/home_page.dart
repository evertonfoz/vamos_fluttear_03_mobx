import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx_app/presentation/mixins/presentation_mixin.dart';
import 'package:mobx_app/presentation/pages/home/stores/home_page_store.dart';
import 'package:mobx_app/presentation/pages/home/widgets/animacao_flecha_widget.dart';
import 'package:mobx_app/presentation/pages/home/widgets/clippy_widget.dart';
import 'package:mobx_app/presentation/pages/lista_de_produtos/lista_de_produtos_page.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with PresentationMixin, SingleTickerProviderStateMixin {
  Animation<double> _animacao;
  AnimationController _controladorAnimacao;

  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();
  final formatacaoMonetaria = NumberFormat.simpleCurrency(locale: 'pt_BR');
  final List<Widget> _paginas = [
    ListaDeProdutosPage(),
    ProdutosSelecionadosPage(),
  ];

  @override
  void initState() {
    super.initState();
    _controladorAnimacao =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animacao =
        Tween<double>(begin: -50, end: 300).animate(_controladorAnimacao)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controladorAnimacao.reset();
              _controladorAnimacao.forward();
            }
          });
    _controladorAnimacao.forward();
  }

  @override
  void dispose() {
    _controladorAnimacao.dispose();
    super.dispose();
  }

  _bottomNavigationBarItem(
      {@required IconData icone, @required String titulo}) {
    return BottomNavigationBarItem(
      icon: Icon(icone),
      label: titulo,
    );
  }

  _conteudAbaixoDaMensagemDoMascote() {
    if (_homePageStore.orientacaoJaLida) {
      return _paginas[_homePageStore.paginaAtual];
    }
    return AbsorbPointer(
      child: Opacity(
        opacity: 0.3,
        child: _paginas[_homePageStore.paginaAtual],
      ),
    );
  }

  _tituloAppBar() {
    return Observer(
      builder: (_) {
        if (_homePageStore.orientacaoJaLida) {
          return Text(_homePageStore.tituloHomePage);
        }

        return AnimacaoFlechaWidget(
          animacao: _animacao,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _tituloAppBar(),
        // Observer(
        //   builder: (_) {
        //     return FlechaWidget(esquerda: _animacao.value);
        //     // return Text(_homePageStore.tituloHomePage);
        //   },
        // ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total Pedido:'),
              Observer(
                builder: (_) {
                  return gerarTexto(
                    texto:
                        formatacaoMonetaria.format(_homePageStore.totalPedido),
                    cor: Colors.yellowAccent,
                  );
                },
              )
            ],
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              _conteudAbaixoDaMensagemDoMascote(),
              Visibility(
                visible: !_homePageStore.orientacaoJaLida,
                child: Positioned(
                  right: 0,
                  width: 250,
                  top: 10,
                  child: ClippyWidget(),
                ),
              ),
            ],
          );
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
