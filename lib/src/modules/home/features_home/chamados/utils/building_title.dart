String buildTitle({required String tipo, required int mesa}) {
  if (tipo == 'duvida') {
    return 'Mesa $mesa precisa de ajuda';
  } else if (tipo == 'pedidoPronto') {
    return 'O pedido da mesa $mesa está pronto';
  } else {
    return '';
  }
}
