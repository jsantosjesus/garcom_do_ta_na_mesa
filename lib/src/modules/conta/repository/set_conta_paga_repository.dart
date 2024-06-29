import 'package:garcom_do_ta_na_mesa/src/modules/conta/datasource/set_conta_paga_firestore.dart';

class SetContaPagaRepository {
  final SetContaPagaFirestore datasource = SetContaPagaFirestore();

  Future<bool> setContaPaga(
      {required String contaId, required String mesaId}) async {
    final result =
        await datasource.setContaPaga(contaId: contaId, mesaId: mesaId);

    return result;
  }
}
