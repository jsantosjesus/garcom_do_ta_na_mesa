import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/model/chamado_model.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/utils/building_title.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/set_chamado_check/presenter/store/set_chamado_check_store.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/set_chamado_check/repository/set_chamado_check_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/components_ui_global/snack.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

class ChamadoModal extends StatefulWidget {
  final ChamadoModel chamado;
  const ChamadoModal({super.key, required this.chamado});

  @override
  State<ChamadoModal> createState() => _ChamadoModalState();
}

class _ChamadoModalState extends State<ChamadoModal> {
  final SetChamadoCheckStore store =
      SetChamadoCheckStore(repository: SetChamadoCheckRepository());

  @override
  Widget build(BuildContext context) {
    final String chamadoTitle =
        buildTitle(tipo: widget.chamado.tipo, mesa: widget.chamado.numeroMesa);
    return Container(
      decoration: const BoxDecoration(
        color: textColor01,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      height: 300,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              chamadoTitle,
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  fontFamily: fontGlobal),
            ),
            const SizedBox(
              height: 30.0,
            ),
            AnimatedBuilder(
              animation: Listenable.merge([
                store.initialState,
                store.isLoading,
                store.error,
                store.success,
              ]),
              builder: ((context, child) {
                if (store.initialState.value) {
                  return ElevatedButton(
                    onPressed: () {
                      store.setChamadoCheck(
                          chamadoId: widget.chamado.uid,
                          mesaId: widget.chamado.mesaId);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Chamado atendido',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: textColor01,
                          fontFamily: fontGlobal),
                    ),
                  );
                } else if (store.isLoading.value) {
                  return const CircularProgressIndicator(
                    color: primaryColor,
                  );
                } else if (store.error.value.isNotEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showSnackBar(
                      context: context,
                      mesage: store.error.value,
                      isError: true,
                    );
                    // store.error.value = '';
                    // store.initialState.value = true;
                    context.pop();
                  });

                  return Container();
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.pop();
                  });
                  return Container();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
