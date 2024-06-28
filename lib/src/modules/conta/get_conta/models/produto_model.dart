class ProdutoModel {
  final double quantidade;
  final double preco;
  final double total;
  final String nomeProduto;

  ProdutoModel(
      {required this.quantidade,
      required this.preco,
      required this.total,
      required this.nomeProduto});

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      quantidade: map['quantidade'] * 1.0,
      preco: map['preco'] * 1.0,
      total: (map['preco'] * map['quantidade']) * 1.0,
      nomeProduto: map['nome'] as String,
    );
  }
}
