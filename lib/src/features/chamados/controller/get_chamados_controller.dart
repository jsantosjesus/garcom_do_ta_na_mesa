import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/features/chamados/model/chamado_model.dart';
import 'package:garcom_do_ta_na_mesa/src/repository/home_repository.dart';

class GetChamadosController {
  final HomeRepository _homeRepository;

  GetChamadosController(this._homeRepository);

  ValueNotifier<List<ChamadoModel>> chamados =
      ValueNotifier<List<ChamadoModel>>([]);

  fetch() async {
    chamados.value = await _homeRepository.getList();
  }
}
