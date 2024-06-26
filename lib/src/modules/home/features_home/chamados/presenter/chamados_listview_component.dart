import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/config_ui_global/config_ui_global.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/presenter/store/chamados_store.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/presenter/utils/building_title.dart';

class ChamadosListviewComponent extends StatefulWidget {
  const ChamadosListviewComponent({super.key});

  @override
  State<ChamadosListviewComponent> createState() =>
      _ChamadosListviewComponentState();
}

class _ChamadosListviewComponentState extends State<ChamadosListviewComponent> {
  final ChamadosStore store = ChamadosStore();

  @override
  void initState() {
    super.initState();

    store.listenToContacts();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([store.isLoading, store.success]),
        builder: ((context, child) {
          if (store.isLoading.value) {
            return const CircularProgressIndicator();
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
