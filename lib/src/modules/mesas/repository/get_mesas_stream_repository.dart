import 'package:garcom_do_ta_na_mesa/src/modules/mesas/datasource/get_mesas_snapshot_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/mesas/model/mesa_model.dart';

class GetMesasStreamRepository {
  final GetMesasSnapshotFirestore datasource = GetMesasSnapshotFirestore();

  Stream<List<MesaModel>> getMesas({required String garcomId}) {
    return datasource.listenToMesas(garcomId: garcomId).map((data) {
      return data
          .map((item) => MesaModel.fromMap(map: item.data, id: item.id))
          .toList();
    });
  }
}
