import 'package:mobx_app/domain/models/produto_model.dart';

List<ProdutoModel> _listaDeProdutos = [
  ProdutoModel(
    produtoId: 1,
    nome: 'Suco de Laranja',
    descricao: 'Suco natural (300ml)',
    valor: 4,
    urlImagem: 'assets/images/produtos/sucodelaranja.jpg',
  ),
  ProdutoModel(
    produtoId: 2,
    nome: 'Suco de Uva',
    descricao: 'Poupa da fruta (300ml)',
    valor: 4,
    urlImagem: 'assets/images/produtos/sucodeuva.jpg',
  ),
  ProdutoModel(
    produtoId: 3,
    nome: 'Frango a passarinho',
    descricao: 'Suco natural (300ml)',
    valor: 15,
    urlImagem: 'assets/images/produtos/frangoapassarinho.jpg',
  ),
  ProdutoModel(
    produtoId: 4,
    nome: 'Tábua de frios',
    descricao:
        '800g distribuídos em queijo, salame, ovo de codorna, tomate e azeitona',
    valor: 20,
    urlImagem: 'assets/images/produtos/tabuadefrios.jpeg',
  ),
  ProdutoModel(
    produtoId: 5,
    nome: 'Cheese Salad',
    descricao:
        'Sanduíche com pão baguete, hamburger de 150g, queijo, alface, tomate, 50g de fritas',
    valor: 10,
    urlImagem: 'assets/images/produtos/cheeseburguer.jpg',
  ),
];

List<ProdutoModel> listaDeProdutos() {
  _listaDeProdutos
      .sort((a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
  return List.unmodifiable(_listaDeProdutos);
}
