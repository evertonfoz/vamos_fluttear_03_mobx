import 'package:clippy_flutter/arrow.dart';
import 'package:flutter/material.dart';

class FlechaWidget extends StatelessWidget {
  final double esquerda;

  const FlechaWidget({@required this.esquerda});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            left: esquerda,
            child: Arrow(
              clipShadows: [ClipShadow(color: Colors.black)],
              triangleHeight: 20.0,
              rectangleClipHeight: 10.0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellowAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
