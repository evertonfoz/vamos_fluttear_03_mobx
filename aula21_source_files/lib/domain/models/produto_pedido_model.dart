import 'package:flutter/foundation.dart';
import 'package:mobx_app/domain/models/produto_model.dart';

class ProdutoPedidoModel {
  final ProdutoModel produtoModel;
  final int quantidade;

  ProdutoPedidoModel({@required this.produtoModel, @required this.quantidade});
}
