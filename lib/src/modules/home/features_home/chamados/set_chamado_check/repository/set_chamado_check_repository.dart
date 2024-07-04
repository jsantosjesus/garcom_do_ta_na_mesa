import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/set_chamado_check/datasource/set_chamado_check_firestore.dart';

abstract class ISetChamadoCheckRepository {
  Future<bool> setChamadoCheck(
      {required String chamadoId,
      required String mesaId,
      required String tipo});
}

class SetChamadoCheckRepository implements ISetChamadoCheckRepository {
  final SetChamadoCheckFirestore datasource = SetChamadoCheckFirestore();

  @override
  Future<bool> setChamadoCheck(
      {required String chamadoId,
      required String mesaId,
      required String tipo}) async {
    final result = await datasource.setChamadoCheck(
        chamadoId: chamadoId, mesaId: mesaId, tipo: tipo);

    return result;
  }
}
