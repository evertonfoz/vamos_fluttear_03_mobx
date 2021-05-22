import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';

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
                bottom: _alturaCaixaDeMensagem * 0.2,
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
            child:Image.asset('assets/images/home/clippy.png', width: 150,),
          ),
        ),
      ],
    );
  }
}
