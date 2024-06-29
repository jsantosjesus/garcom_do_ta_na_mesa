import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/response_models/response_model_firestore.dart';

class GetPedidosFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<ResponseModelFiresore>> getPedidos(
      {required String contaId}) async {
    final docRef =
        db.collection('pedido').where('conta_id', isEqualTo: contaId);

    return docRef.get().then((snapshot) {
      return snapshot.docs
          .map((doc) =>
              ResponseModelFiresore.fromMap(map: doc.data(), id: doc.id))
          .toList();
    }).onError((error, stackTrace) {
      throw DatasourceError(
          message: 'Erro ao fazer requisição: ${error.toString()}');
    });
  }
}
