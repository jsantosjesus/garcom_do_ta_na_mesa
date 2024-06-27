class MesaModel {
  final String uid;
  final int numero;
  final String status;
  final String? contaId;

  MesaModel(
      {required this.uid,
      required this.numero,
      required this.status,
      this.contaId});

  factory MesaModel.fromMap(
      {required Map<String, dynamic> map, required String id}) {
    return MesaModel(
        uid: id,
        numero: map['numero'] as int,
        status: map['status'] as String,
        contaId:
            map['contaAtiva'] == null ? null : map['contaAtiva'] as String);
  }
}
