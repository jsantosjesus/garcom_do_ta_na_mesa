import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:garcom_do_ta_na_mesa/errors/error_exception.dart';
import 'package:garcom_do_ta_na_mesa/src/features/chamados/model/chamado_model.dart';

class GetChamadosFirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  // Future<Either<ErrorException, List<ChamadoModel>>>
  Future<Either<ErrorException, List<ChamadoModel>>> fetchChamados(
      String uid) async {
    try {
      final citiesRef = db.collection("chamado");

      final chamados = [] as List<ChamadoModel>;

      citiesRef.where("garcom_id", isEqualTo: uid).snapshots().listen((event) {
        for (var doc in event.docs) {
          ChamadoModel result = ChamadoModel.fromJson(doc.data());
          chamados.add(result);
        }
      });
      return Right(chamados);
    } catch (e) {
      return Left(ErrorException(message: 'Erro ao acessar o banco de dados'));
    }
  }
}
