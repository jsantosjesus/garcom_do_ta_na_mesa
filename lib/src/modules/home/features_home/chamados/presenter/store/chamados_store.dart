import 'package:flutter/foundation.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/model/chamado_model.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/repository/get_chamados_stream_repository.dart';

class ChamadosStore {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  final ValueNotifier<List<ChamadoModel>> success =
      ValueNotifier<List<ChamadoModel>>([]);

  final GetChamadosStreamRepository repository = GetChamadosStreamRepository();

  void listenToChamados({required String uid}) {
    repository.getChamados(uid: uid).listen((chamados) {
      success.value = chamados;
      isLoading.value = false;
    });
  }
}
