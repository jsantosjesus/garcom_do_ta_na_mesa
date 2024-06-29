import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';

class SetContaPagaFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<bool> setContaPaga(
      {required String contaId, required String mesaId}) async {
    final Timestamp now = Timestamp.now();
    final dataPaga = {"dataPaga": now};
    final statusMesa = {'status': 'LIVRE', 'contaAtiva': ""};

    try {
      await db
          .collection("conta")
          .doc(contaId)
          .set(dataPaga, SetOptions(merge: true));

      try {
        await db
            .collection("mesa")
            .doc(mesaId)
            .set(statusMesa, SetOptions(merge: true));

        return true;
      } catch (e) {
        throw DatasourceError(message: 'Erro ao mudar o status da mesa');
      }
    } catch (e) {
      throw DatasourceError(message: 'Erro ao mudar o status da conta');
    }
  }
}
