import 'dart:convert';

// import 'package:flutter/services.dart';
import 'package:garcom_do_ta_na_mesa/src/features/chamados/model/chamado_model.dart';
import 'package:garcom_do_ta_na_mesa/src/repository/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  Future<List<ChamadoModel>> getList() async {
    await Future.delayed(const Duration(seconds: 1));
    var value = [
      {
        "estabelecimento_id": "PmIVhGksG6fmoKBj8QdD",
        "hora": "25 de março de 2024 às 21:01:36 UTC-3",
        "mesa_id": "xagzf33C8KoWqGul4Tec",
        "mesa_numero": "4",
        "status": "CANCELADO",
        "tipo": "duvida"
      }
    ];

    List chamadoJson = jsonDecode(jsonEncode(value));

    return chamadoJson.map((e) => ChamadoModel.fromJson(e)).toList();
  }
}
