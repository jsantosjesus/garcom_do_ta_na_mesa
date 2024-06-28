import 'package:garcom_do_ta_na_mesa/src/modules/conta/get_conta/models/produto_model.dart';

class PedidoModel {
  final List<ProdutoModel> produtos;
  final double total;

  PedidoModel({required this.produtos, required this.total});

  factory PedidoModel.fromMap(Map<String, dynamic> map) {
    final List<dynamic> produtosList = map['produtos'] as List<dynamic>;

    return PedidoModel(
      produtos:
          produtosList.map((produto) => ProdutoModel.fromMap(produto)).toList(),
      total: map['total'] * 1.0,
    );
  }
}
