import 'package:flutter/cupertino.dart';
import 'package:mobx_app/presentation/pages/home/widgets/flecha_widget.dart';

class AnimacaoFlechaWidget extends AnimatedWidget {
  AnimacaoFlechaWidget({@required Animation<double> animacao})
      : super(listenable: animacao);

  @override
  Widget build(BuildContext context) {
    final animacao = listenable as Animation<double>;
    return FlechaWidget(esquerda: animacao.value);
  }
}
