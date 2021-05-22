import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_app/presentation/pages/home/shared_preferences/orientacao_total_pedido_preferences.dart';
import 'package:mobx_app/presentation/pages/home/stores/home_page_store.dart';

class ClippyWidget extends StatelessWidget {
  final double _comprimentoCaixaDeMensagem = 200.0;
  final double _alturaCaixaDeMensagem = 120.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Message(
          triangleX1: 0.4 * _comprimentoCaixaDeMensagem,
          triangleX2: 0.5 * _comprimentoCaixaDeMensagem,
          triangleX3: 0.5 * _comprimentoCaixaDeMensagem,
          triangleY1: 0.2 * _alturaCaixaDeMensagem,
          clipShadows: [
            ClipShadow(
              color: Colors.black,
            )
          ],
          child: Container(
            color: Colors.pink,
            width: _comprimentoCaixaDeMensagem,
            height: _alturaCaixaDeMensagem,
            child: Padding(
              padding: EdgeInsets.only(
                top: _alturaCaixaDeMensagem * 0.05,
                bottom: _alturaCaixaDeMensagem * 0.1,
                left: 8,
                right: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Veja sempre o total do pedido no topo direito da tela.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Ok. Entendi!',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      await OrientacaoTotalPedidoPreferences
                          .registrarLeituraOrientacao();
                      GetIt.I.get<HomePageStore>().registrarLeituraOrientacao();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        SizedBox(
          width: 200.0,
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/home/clippy.png',
              width: 150,
            ),
          ),
        ),
      ],
    );
  }
}
