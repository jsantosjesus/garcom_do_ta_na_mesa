import 'package:flutter/foundation.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/conta/repository/set_conta_paga_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';

class SetContaPagaStore {
  final ValueNotifier<bool> initialState = ValueNotifier<bool>(true);

  final ValueNotifier<bool> confirm = ValueNotifier<bool>(false);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  final ValueNotifier<bool> success = ValueNotifier<bool>(false);

  final SetContaPagaRepository repository = SetContaPagaRepository();

  void setConfirmationByTrue() {
    initialState.value = false;
    confirm.value = true;
  }

  void setConfirmationByFalse() {
    initialState.value = true;
    confirm.value = false;
  }

  Future setContaPaga({required String contaId, required String mesaId}) async {
    confirm.value = false;

    try {
      final result =
          await repository.setContaPaga(contaId: contaId, mesaId: mesaId);

      success.value = result;
    } on DatasourceError catch (e) {
      error.value = e.message;
    } catch (e) {
      print(e);
      error.value = 'Ops, Aconteceu um erro';
    }
  }
}
