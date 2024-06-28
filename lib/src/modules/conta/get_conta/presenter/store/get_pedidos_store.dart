import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/conta/get_conta/models/pedido_model.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/conta/get_conta/repository/get_pedidos_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';

class GetPedidosStore {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  final ValueNotifier<List<PedidoModel>> success =
      ValueNotifier<List<PedidoModel>>([]);

  final ValueNotifier<double> totalConta = ValueNotifier<double>(0);

  final GetPedidosRepository repository = GetPedidosRepository();

  Future getPedidos({required String contaId}) async {
    try {
      final result = await repository.getPedidos(contaId: contaId);

      double total = 0;
      result.map((pedido) {
        // print('passando map');
        total = total + pedido.total;
        // print(total);
      }).toList();
      // print(total);

      totalConta.value = total;
      print(totalConta.value);

      success.value = result;
    } on DatasourceError catch (e) {
      error.value = e.message;
    } catch (e) {
      print(e);
      error.value = 'Erro ao bucar pedidos';
    }
    isLoading.value = false;
  }
}
