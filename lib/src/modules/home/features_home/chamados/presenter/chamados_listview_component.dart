import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/presenter/store/chamados_store.dart';

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
                  return ListTile(
                    title: Text(chamado.tipo),
                  );
                });
          } else {
            return Container();
          }
        }));
  }
}
