import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/config_ui_global/config_ui_global.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/get_chamados/presenter/store/chamados_store.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/utils/building_title.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/set_chamado_check/presenter/chamado_modal.dart';

class ChamadosListviewComponent extends StatefulWidget {
  final String uid;
  const ChamadosListviewComponent({super.key, required this.uid});

  @override
  State<ChamadosListviewComponent> createState() =>
      _ChamadosListviewComponentState();
}

class _ChamadosListviewComponentState extends State<ChamadosListviewComponent> {
  final ChamadosStore store = ChamadosStore();

  @override
  void initState() {
    super.initState();

    store.listenToChamados(uid: widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([store.isLoading, store.success]),
        builder: ((context, child) {
          if (store.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (store.success.value.isNotEmpty) {
            return ListView.builder(
                itemCount: store.success.value.length,
                itemBuilder: (_, id) {
                  final chamado = store.success.value[id];
                  final String titleChamado =
                      buildTitle(tipo: chamado.tipo, mesa: chamado.numeroMesa);
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: Icon(
                              chamado.tipo == 'pedidoPronto'
                                  ? Icons.restaurant
                                  : Icons.notifications,
                              color: textColor01,
                            ),
                          ),
                          title: Text(titleChamado),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ChamadoModal(
                                  chamado: chamado,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                        height: 2,
                      )
                    ],
                  );
                });
          } else {
            return Container();
          }
        }));
  }
}
