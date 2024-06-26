import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/datasource/response_model.dart';

class GetChamadosSnapshotFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<ResponseModel>> listenToChamados() {
    final docRef = db
        .collection("chamado")
        .where('mesa.id', isEqualTo: 'xagzf33C8KoWqGul4Tec');

    return docRef.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => ResponseModel.fromMap(map: doc.data(), id: doc.id))
          .toList();
    });
  }
}
