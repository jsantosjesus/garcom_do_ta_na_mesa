import 'package:garcom_do_ta_na_mesa/src/modules/home/datasource/get_user_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/model/user_model.dart';

abstract class IGetUserRepository {
  Future<UserModel> getUser({required String uid});
}

class GetUserRepositoryImpl implements IGetUserRepository {
  final GetUserFirestore datasource = GetUserFirestore();

  @override
  Future<UserModel> getUser({required String uid}) async {
    final result = await datasource.getUser(uid: uid);

    return UserModel.fromMap(map: result.data, id: result.id);
  }
}
