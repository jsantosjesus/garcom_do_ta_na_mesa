import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/errors/error_exception.dart';
import 'package:garcom_do_ta_na_mesa/src/response_models/response_model_firestore.dart';

class GetUserFirestore {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<ResponseModelFiresore> getUser({required String uid}) async {
    final docRef = db.collection("usuario").doc(uid);

    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        return ResponseModelFiresore.fromMap(
            map: doc.data() as Map<String, dynamic>, id: doc.id);
      } else {
        throw DatasourceError(message: 'Usuário não existe');
      }
    } catch (e) {
      print(e.toString());
      throw DatasourceError(message: 'Erro ao fazer requisição');
    }
  }
}
