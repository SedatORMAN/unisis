class dbModel {
  final int id;
  final String ekran;
  final int renk;
  dbModel({this.id, this.ekran, this.renk});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ekran': ekran,
      'renk': renk,
    };
  }

  @override
  String toString() {
    return 'dbModel{id: $id, ekran: $ekran, renk: $renk}';
  }
}