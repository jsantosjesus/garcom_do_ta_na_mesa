class UserModel {
  final String uid;
  final String nome;

  UserModel({
    required this.uid,
    required this.nome,
  });

  factory UserModel.fromMap(
      {required Map<String, dynamic> map, required String id}) {
    return UserModel(
      uid: id,
      nome: map['nome'] as String,
    );
  }
}
