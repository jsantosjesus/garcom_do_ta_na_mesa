import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/datasource/get_chamados_snapshot_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/model/chamado_model.dart';

class GetChamadosStreamRepository {
  final GetChamadosSnapshotFirestore datasource =
      GetChamadosSnapshotFirestore();

  Stream<List<ChamadoModel>> getChamados() {
    return datasource.listenToChamados().map((data) {
      return data
          .map((item) => ChamadoModel.fromMap(map: item.data, id: item.id))
          .toList();
    });
  }
}
