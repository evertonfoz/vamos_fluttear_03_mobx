import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final Icon iconeDoTitulo;
  final String titulo;
  final String mensagem;
  final List<Widget> botoes;

  const AlertDialogWidget({
    @required this.iconeDoTitulo,
    @required this.titulo,
    @required this.mensagem,
    @required this.botoes,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          this.iconeDoTitulo,
          SizedBox(
            width: 5,
          ),
          Text(this.titulo),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(this.mensagem),
        ],
      ),
      actions: this.botoes,
    );
  }
}
