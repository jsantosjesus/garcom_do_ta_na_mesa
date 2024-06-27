import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/response_models/response_model_firestore.dart';

class GetChamadosSnapshotFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<ResponseModelFiresore>> listenToChamados({required String uid}) {
    final docRef = db
        .collection("chamado")
        .where('garcom_id', isEqualTo: uid)
        .where('status', isEqualTo: 'ATIVO');

    return docRef.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) =>
              ResponseModelFiresore.fromMap(map: doc.data(), id: doc.id))
          .toList();
    });
  }
}
