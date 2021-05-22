import 'package:flutter/material.dart';

mixin PresentationMixin {
  gerarTexto({
    @required String texto,
    bool negrito = false,
    double tamanhoDaFonte = 20,
    Color cor = Colors.black,
  }) {
    return Text(
      texto,
      style: TextStyle(
        fontWeight: negrito ? FontWeight.bold : FontWeight.normal,
        fontSize: tamanhoDaFonte,
        color: cor,
      ),
    );
  }
}
