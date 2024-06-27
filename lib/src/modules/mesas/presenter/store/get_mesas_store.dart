import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/mesas/model/mesa_model.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/mesas/repository/get_mesas_stream_repository.dart';

class GetMesasStore {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  final ValueNotifier<List<MesaModel>> success =
      ValueNotifier<List<MesaModel>>([]);

  final GetMesasStreamRepository repository = GetMesasStreamRepository();

  void listenToMesas({required String garcomId}) {
    repository.getMesas(garcomId: garcomId).listen((mesas) {
      success.value = mesas;
      isLoading.value = false;
    });
  }
}
