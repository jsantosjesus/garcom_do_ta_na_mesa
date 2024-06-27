import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/response_models/response_model_firestore.dart';

class GetMesasSnapshotFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<ResponseModelFiresore>> listenToMesas(
      {required String garcomId}) {
    final docRef =
        db.collection("mesa").where('garcom_id', isEqualTo: garcomId);

    return docRef.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) =>
              ResponseModelFiresore.fromMap(map: doc.data(), id: doc.id))
          .toList();
    });
  }
}
