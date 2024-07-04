import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';

class SetChamadoCheckFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<bool> setChamadoCheck(
      {required String chamadoId,
      required String mesaId,
      required String tipo}) async {
    final statusChamado = {"status": 'ATENDIDO'};
    final chamadoMesa = {'chamandoGarcom': ""};

    try {
      await db
          .collection("chamado")
          .doc(chamadoId)
          .set(statusChamado, SetOptions(merge: true));

      if (tipo == 'conta' || tipo == 'duvida') {
        try {
          await db
              .collection('mesa')
              .doc(mesaId)
              .set(chamadoMesa, SetOptions(merge: true));

          return true;
        } catch (e) {
          throw DatasourceError(message: 'Erro ao mudar status de mesa');
        }
      } else {
        return true;
      }
    } catch (e) {
      throw DatasourceError(message: 'Erro inesperado com a conexão');
    }
  }
}
