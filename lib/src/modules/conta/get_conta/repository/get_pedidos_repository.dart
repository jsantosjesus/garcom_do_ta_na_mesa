import 'package:garcom_do_ta_na_mesa/src/modules/conta/get_conta/datasource/get_pedidos_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/conta/get_conta/models/pedido_model.dart';

class GetPedidosRepository {
  final GetPedidosFirestore datasource = GetPedidosFirestore();

  Future<List<PedidoModel>> getPedidos({required String contaId}) async {
    final result = await datasource.getPedidos(contaId: contaId);

    final List<PedidoModel> pedidosList = [];

    result.map((pedido) {
      pedidosList.add(PedidoModel.fromMap(pedido.data));
    }).toList();

    return pedidosList;
  }
}
