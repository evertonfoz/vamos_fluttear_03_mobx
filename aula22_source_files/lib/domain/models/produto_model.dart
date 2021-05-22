import 'package:flutter/foundation.dart';

class ProdutoModel {
  final int produtoId;
  final String nome;
  final String descricao;
  final double valor;
  final String urlImagem;

  ProdutoModel({
    @required this.produtoId,
    @required this.nome,
    @required this.descricao,
    @required this.valor,
    @required this.urlImagem,
  });
}
