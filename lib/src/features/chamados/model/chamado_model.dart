import 'package:cloud_firestore/cloud_firestore.dart';

class ChamadoModel {
  final String uid;
  final String estabelecimentoId;
  final DateTime hora;
  final String mesaId;
  final String mesaNumero;
  final String status;
  final String tipo;

  ChamadoModel({
    required this.uid,
    required this.estabelecimentoId,
    required this.hora,
    required this.mesaId,
    required this.mesaNumero,
    required this.status,
    required this.tipo,
  });

  factory ChamadoModel.fromJson(Map json, String id) {
    final Timestamp timestampHora = json['hora'];
    return ChamadoModel(
        uid: id,
        estabelecimentoId: json['estabelecimentoId'] as String,
        hora: timestampHora.toDate(),
        mesaId: json['mesa.id'] as String,
        mesaNumero: json['mesa.numero'] as String,
        status: json['status'] as String,
        tipo: json['tipo'] as String);
  }
}
