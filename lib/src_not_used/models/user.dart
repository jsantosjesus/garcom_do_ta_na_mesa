import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String nome;
  String estabelecimentoId;
  String cargo;

  UserModel({
    required this.uid,
    required this.nome,
    required this.estabelecimentoId,
    required this.cargo,
  });

  UserModel.fromMap({required String id, required Map<String, dynamic> map})
      : uid = id,
        nome = map["nome"],
        estabelecimentoId = map["estabelecimento_id"],
        cargo = map["cargo"];

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "nome": nome,
      "estabelecimento_id": estabelecimentoId,
      "cargo": cargo
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot, String uid) {
    // Acessando os dados do DocumentSnapshot como um Map<String, dynamic>
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    // Verificando se os campos existem e, se não, fornecendo valores padrão
    String nome = data['nome'];
    String estabelecimentoId = data['estabelecimento_id'];
    String cargo = data['cargo'];

    // Retornando uma instância de UserModel com os dados extraídos
    return UserModel(
        uid: uid,
        nome: nome,
        estabelecimentoId: estabelecimentoId,
        cargo: cargo);
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'uid': uid,
  //     'nome': nome,
  //     'estabelcimento_id': estabelecimentoId,
  //     'cargo': cargo
  //   };
  // }

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //       uid: json['uid'],
  //       nome: json['nome'],
  //       estabelecimentoId: json['estabelecimento_id'],
  //       cargo: json['cargo']);
  // }
}
