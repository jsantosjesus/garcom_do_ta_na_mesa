import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/logout/presenter/logout_component.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/presenter/components/drawer.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/mesas/presenter/store/get_mesas_store.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/components_ui_global/snack.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';
import 'package:go_router/go_router.dart';

class MesasPage extends StatefulWidget {
  final String uid;
  const MesasPage({super.key, required this.uid});

  @override
  State<MesasPage> createState() => _MesasPageState();
}

class _MesasPageState extends State<MesasPage> {
  final GetMesasStore store = GetMesasStore();

  @override
  void initState() {
    super.initState();

    store.listenToMesas(garcomId: widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: textColor01),
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          'Mesas',
          style: TextStyle(color: textColor01, fontWeight: FontWeight.bold),
        ),
        actions: [
          LogoutComponent(uid: widget.uid),
        ],
      ),
      drawer: MyDrawer(uid: widget.uid),
      body: AnimatedBuilder(
        animation: Listenable.merge([store.isLoading, store.success]),
        builder: ((context, child) {
          if (store.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (store.success.value.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListView.builder(
                  itemCount: store.success.value.length,
                  itemBuilder: (_, id) {
                    final mesa = store.success.value[id];
                    return GestureDetector(
                      onTap: () {
                        if (mesa.contaId != null) {
                          final String contaId = mesa.contaId!;
                          context.push(
                              '/conta/$contaId/${mesa.numero}/${mesa.uid}');
                        } else {
                          showSnackBar(
                              context: context,
                              mesage: 'Mesa não tem conta ativa');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        height: 80,
                        decoration: BoxDecoration(
                            color: mesa.status == 'OCUPADA'
                                ? negativeColor
                                : positiveColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Mesa ${mesa.numero}',
                          style: const TextStyle(
                              color: textColor01,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
