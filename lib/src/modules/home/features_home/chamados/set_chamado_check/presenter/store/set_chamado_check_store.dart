import 'package:flutter/foundation.dart';
import 'package:garcom_do_ta_na_mesa/src/errors/error_exception.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/set_chamado_check/repository/set_chamado_check_repository.dart';

class SetChamadoCheckStore {
  final ValueNotifier<bool> initialState = ValueNotifier<bool>(true);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  final ValueNotifier<bool> success = ValueNotifier<bool>(false);

  final ISetChamadoCheckRepository repossitory;

  SetChamadoCheckStore({required this.repossitory});

  Future setChamadoCheck({required String chamadoId}) async {
    initialState.value = false;
    isLoading.value = true;

    try {
      final result = await repossitory.setChamadoCheck(chamadoId: chamadoId);

      success.value = result;
    } on DatasourceError catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = 'Aconteceu um erro';
    }

    isLoading.value = false;
  }
}
