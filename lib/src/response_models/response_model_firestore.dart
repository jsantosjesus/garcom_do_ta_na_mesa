class ResponseModelFiresore {
  final String id;
  final Map<String, dynamic> data;

  ResponseModelFiresore({required this.id, required this.data});

  factory ResponseModelFiresore.fromMap(
      {required Map<String, dynamic> map, required String id}) {
    return ResponseModelFiresore(
      id: id,
      data: map,
    );
  }
}
