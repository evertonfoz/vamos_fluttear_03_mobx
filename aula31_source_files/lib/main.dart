import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_app/presentation/initialization/splash_screen.dart';
import 'package:mobx_app/presentation/pages/home/shared_preferences/orientacao_total_pedido_preferences.dart';
import 'package:mobx_app/presentation/pages/home/stores/home_page_store.dart';
import 'package:mobx_app/presentation/pages/lista_de_produtos/stores/lista_de_produtos_store.dart';
import 'package:mobx_app/presentation/pages/login/login_page.dart';
import 'package:mobx_app/presentation/pages/produtos_selecionados/stores/produtos_selecionados_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HomePageStore _homePageStore = HomePageStore();
  OrientacaoTotalPedidoPreferences.verificarSeJaLeuOrientacao().then((value) {
    if (value) {
      _homePageStore.registrarLeituraOrientacao();
    }
  });

  GetIt.I.registerSingleton<HomePageStore>(_homePageStore);
  GetIt.I.registerSingleton<ListaDeProdutosStore>(ListaDeProdutosStore());
  GetIt.I.registerSingleton<ProdutosSelecionadosStore>(
    ProdutosSelecionadosStore(),
  );

  Timer(Duration(seconds: 1), () => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 3),
        ),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: SplashScreenPage(),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MobX App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: LoginPage(),
            );
          }
        });
  }
}
