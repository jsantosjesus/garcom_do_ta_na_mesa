import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/conta/presenter/store/set_conta_paga_store.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/components_ui_global/snack.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';

class ButtonSetContaPaga extends StatefulWidget {
  final String mesaId;
  final String contaId;
  final Function sair;
  const ButtonSetContaPaga(
      {super.key,
      required this.mesaId,
      required this.contaId,
      required this.sair});

  @override
  State<ButtonSetContaPaga> createState() => _ButtonSetContaPagaState();
}

class _ButtonSetContaPagaState extends State<ButtonSetContaPaga> {
  final SetContaPagaStore store = SetContaPagaStore();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        store.initialState,
        store.confirm,
        store.isLoading,
        store.error,
        store.success,
      ]),
      builder: ((context, child) {
        if (store.initialState.value) {
          return ElevatedButton(
            onPressed: () {
              store.setConfirmationByTrue();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Marcar como paga',
              style: TextStyle(color: textColor01, fontWeight: FontWeight.bold),
            ),
          );
        } else if (store.confirm.value) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  store.setContaPaga(
                      contaId: widget.contaId, mesaId: widget.mesaId);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: positiveColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Confirmar',
                  style: TextStyle(
                      color: textColor01, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  store.setConfirmationByFalse();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                      color: negativeColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        } else if (store.error.value.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackBar(context: context, mesage: store.error.value);
          });
          store.initialState.value = true;
          store.confirm.value = false;
          return Container();
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackBar(
                context: context,
                mesage: 'Conta paga com sucesso!',
                isError: false);
            widget.sair();
          });
          return Container();
        }
      }),
    );
  }
}
