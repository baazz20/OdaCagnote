class AcademicienModel {
  final int id;
  final String? matricule;
  final String nom;
  final String? prenoms;
  final String? photo;

  const AcademicienModel({
    required this.id,
    required this.matricule,
    required this.nom,
    required this.prenoms,
    required this.photo,
  });

  factory AcademicienModel.fromJson(Map<String, dynamic> json) {
    return AcademicienModel(
        id: json['id'] as int,
        matricule: json['Matricule'] as Null,
        nom: json['nom'] as String,
        prenoms: json['prenoms'] as String,
        photo: json['photo'] as Null);
  }
  @override
  String toString() {
    return 'AcademicienModel{id: $id, matricule: $matricule, nom: $nom, prenoms: $prenoms, photo: $photo,}';
  }
}
