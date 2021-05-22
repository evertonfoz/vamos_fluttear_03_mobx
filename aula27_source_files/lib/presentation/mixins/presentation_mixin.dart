import 'package:flutter/material.dart';

mixin PresentationMixin {
  gerarTexto({
    @required dynamic texto,
    bool negrito = false,
    double tamanhoDaFonte = 20,
    Color cor = Colors.black,
    TextAlign alinhamento = TextAlign.start,
  }) {
    return Text(
      '$texto',
      textAlign: alinhamento,
      style: TextStyle(
        fontWeight: negrito ? FontWeight.bold : FontWeight.normal,
        fontSize: tamanhoDaFonte,
        color: cor,
      ),
    );
  }
}
