class ChamadoModel {
  final String estabelecimentoId;
  final DateTime hora;
  final String mesaId;
  final String mesaNumero;
  final String status;
  final String tipo;

  ChamadoModel(
    this.estabelecimentoId,
    this.hora,
    this.mesaId,
    this.mesaNumero,
    this.status,
    this.tipo,
  );

  factory ChamadoModel.fromJson(Map json) {
    return ChamadoModel(json['estabelecimentoId'], json['hora'],
        json['mesa.id'], json['mesa.numero'], json['status'], json['tipo']);
  }
}
