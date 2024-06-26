import 'package:cloud_firestore/cloud_firestore.dart';

class ChamadoModel {
  final String uid;
  final DateTime hora;
  final int numeroMesa;
  final String tipo;
  final String status;

  ChamadoModel(
      {required this.uid,
      required this.hora,
      required this.numeroMesa,
      required this.tipo,
      required this.status});

  factory ChamadoModel.fromMap(
      {required Map<String, dynamic> map, required String id}) {
    final Timestamp timestampHora = map['hora'];
    final Map<String, dynamic> mesa = map['mesa'];
    return ChamadoModel(
      uid: id,
      hora: timestampHora.toDate(),
      numeroMesa: mesa['numero'] as int,
      tipo: map['tipo'] as String,
      status: map['status'] as String,
    );
  }
}
