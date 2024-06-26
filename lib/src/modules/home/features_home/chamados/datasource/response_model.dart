class ResponseModel {
  final String id;
  final Map<String, dynamic> data;

  ResponseModel({required this.id, required this.data});

  factory ResponseModel.fromMap(
      {required Map<String, dynamic> map, required String id}) {
    return ResponseModel(
      id: id,
      data: map,
    );
  }
}
