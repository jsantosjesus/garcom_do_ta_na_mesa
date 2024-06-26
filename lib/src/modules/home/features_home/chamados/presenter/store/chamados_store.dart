import 'package:flutter/foundation.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/model/chamado_model.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/repository/get_chamados_stream_repository.dart';

class ChamadosStore {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  final ValueNotifier<List<ChamadoModel>> success =
      ValueNotifier<List<ChamadoModel>>([]);

  final GetChamadosStreamRepository repository = GetChamadosStreamRepository();

  void listenToContacts() {
    print('comeca aqui');
    repository.getChamados().listen((contacts) {
      success.value = contacts;
      print(success.value[0].status);
      isLoading.value = false;
    });
  }
}
