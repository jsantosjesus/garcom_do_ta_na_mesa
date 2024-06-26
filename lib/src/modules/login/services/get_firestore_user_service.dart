// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/model/user_model.dart';
// import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/states/login_state.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class GetFirestoreUserService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<UserModel?> getUserAuth(String uid) async {
    final docRef = db.collection("usuario").doc(uid);

    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        print('deu certo a requisição');
        // print(doc.data());
      }
      final data = doc.data() as Map<String, dynamic>;

      var user = UserModel.fromMap(id: uid, map: data);

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('user', jsonEncode(user.toMap()));

      return user;
    } catch (e) {
      return null;
    }
  }
}
