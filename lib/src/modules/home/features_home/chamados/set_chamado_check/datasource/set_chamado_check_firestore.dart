import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';

class SetChamadoCheckFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<bool> setChamadoCheck({required String chamadoId}) async {
    final data = {"status": 'ATENDIDO'};

    try {
      await db
          .collection("chamado")
          .doc(chamadoId)
          .set(data, SetOptions(merge: true));

      return true;
    } catch (e) {
      throw DatasourceError(message: 'Erro inesperado com a conexão');
    }
  }
}
