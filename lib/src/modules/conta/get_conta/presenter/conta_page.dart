import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/conta/get_conta/presenter/store/get_pedidos_store.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';

class ContaPage extends StatefulWidget {
  final String contaId;
  final String mesaNumero;
  final String mesaId;
  const ContaPage(
      {super.key,
      required this.contaId,
      required this.mesaNumero,
      required this.mesaId});

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  final GetPedidosStore store = GetPedidosStore();

  @override
  void initState() {
    super.initState();

    store.getPedidos(contaId: widget.contaId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conta da mesa ${widget.mesaNumero}'),
      ),
      body: AnimatedBuilder(
        animation:
            Listenable.merge([store.isLoading, store.error, store.success]),
        builder: ((context, child) {
          if (store.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (store.error.value.isNotEmpty) {
            return Center(
              child: Text(store.error.value),
            );
          } else {
            return ListView.builder(
              itemCount: store.success.value.length,
              itemBuilder: (context, id) {
                final pedido = store.success.value[id];
                // totalConta = totalConta + pedido.total;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pedido.produtos.length,
                  itemBuilder: (context, produtoId) {
                    final produto = pedido.produtos[produtoId];
                    return ListTile(
                      leading: Text(produto.quantidade
                          .toStringAsFixed(0)
                          .padLeft(2, '0')),
                      title: Text(produto.nomeProduto),
                      trailing: Text(
                          'R\$${produto.preco.toStringAsFixed(2).replaceAll('.', ',')} = R\$${produto.total.toStringAsFixed(2).replaceAll('.', ',')}'),
                    );
                  },
                );
              },
            );
          }
        }),
      ),
      bottomSheet: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(16)),
            color: Colors.white,
            // border: Border.all(color: primaryColor)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total da conta:',
                    style: TextStyle(
                        // color: textColor01,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  AnimatedBuilder(
                    animation: store.totalConta,
                    builder: ((context, child) {
                      return Text(
                        'R\$ ${store.totalConta.value.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: const TextStyle(
                            // color: textColor01,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      );
                    }),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Marcar como paga',
                  style: TextStyle(
                      color: textColor01, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}
