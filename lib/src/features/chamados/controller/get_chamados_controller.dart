import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:garcom_do_ta_na_mesa/errors/error_exception.dart';
import 'package:garcom_do_ta_na_mesa/src/features/chamados/model/chamado_model.dart';
import 'package:garcom_do_ta_na_mesa/src/features/chamados/service/get_chamados_firebase_service.dart';

class GetChamadosController {
  final GetChamadosFirebaseService _chamadosFirebaseService =
      GetChamadosFirebaseService();

  // Future<Either<ErrorException, List<ChamadoModel>>> getChamados(uid) async {
  //   final result = await _chamadosFirebaseService.fetchChamados(uid);

  //   return result;
  // }

  Stream<Either<ErrorException, List<ChamadoModel>>> transformStream(
      Stream<QuerySnapshot> stream, String uid) {
    return stream.asyncMap((querySnapshot) async {
      try {
        // Aqui você processaria o QuerySnapshot para obter a lista de ChamadoModel
        Either<ErrorException, List<ChamadoModel>> chamados =
            await _chamadosFirebaseService.fetchChamados(uid);

        // Retorne um Right com a lista de ChamadoModel se a operação for bem-sucedida
        return chamados;
      } catch (e) {
        // Se ocorrer um erro, retorne um Left com o erro encapsulado
        return Left(ErrorException(message: 'erro ao consultar o banco'));
      }
    });
  }
}
