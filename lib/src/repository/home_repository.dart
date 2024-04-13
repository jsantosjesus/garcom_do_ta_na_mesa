import 'package:garcom_do_ta_na_mesa/src/features/chamados/model/chamado_model.dart';

abstract class HomeRepository {
  Future<List<ChamadoModel>> getList();
}
