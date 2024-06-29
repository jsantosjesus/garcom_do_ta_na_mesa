import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';

class SetChamadoCheckFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<bool> setChamadoCheck(
      {required String chamadoId, required String mesaId}) async {
    final statusChamado = {"status": 'ATENDIDO'};
    final chamadoMesa = {'chamandoGarcom': ""};

    try {
      await db
          .collection("chamado")
          .doc(chamadoId)
          .set(statusChamado, SetOptions(merge: true));

      try {
        await db
            .collection('mesa')
            .doc(mesaId)
            .set(chamadoMesa, SetOptions(merge: true));

        return true;
      } catch (e) {
        throw DatasourceError(message: 'Erro ao mudar status de mesa');
      }
    } catch (e) {
      throw DatasourceError(message: 'Erro inesperado com a conexão');
    }
  }
}
