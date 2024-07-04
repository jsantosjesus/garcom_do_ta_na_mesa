import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class GetMessageFirebaseToken {
  FirebaseFirestore db = FirebaseFirestore.instance;

  getDeviceFirebaseToken(String uid) async {
    final token = await FirebaseMessaging.instance.getToken();

    if (token != null) {
      final data = {"tokenMessage": token};

      await db
          .collection("usuario")
          .doc(uid)
          .set(data, SetOptions(merge: true));
    } else {
      // print('Erro ao buscar o token');
    }
  }

  setNullTokenMessage(String uid) async {
    final data = {"tokenMessage": ""};

    await db.collection("usuario").doc(uid).set(data, SetOptions(merge: true));
  }
}
