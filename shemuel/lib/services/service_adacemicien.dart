import 'dart:convert';
import '../models/Academicien.dart';
import 'package:http/http.dart';

class ApiServiceAcademicien {
  final String apiUrl = "http://192.168.252.127:8000/api/v1/academicien";

  Future<List<AcademicienModel>> getAcademiciens() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<AcademicienModel> academiciens =
          body.map((dynamic item) => AcademicienModel.fromJson(item)).toList();
      return academiciens;
    } else {
      throw "Failed to load academicien list";
    }
  }

  Future<AcademicienModel> getAcademicienById(String id) async {
    final response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return AcademicienModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a academicien');
    }
  }

  Future<AcademicienModel> createAcademicien(
      AcademicienModel academicienModel) async {
    Map data = {
      'id': academicienModel.id,
      'matricule': academicienModel.matricule,
      'nom': academicienModel.nom,
      'prenoms': academicienModel.prenoms,
      'photo': academicienModel.photo,
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return AcademicienModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post academicien');
    }
  }

  Future<AcademicienModel> updateAcademicien(
      int id, AcademicienModel academicienModel) async {
    Map data = {
      'id': academicienModel.id,
      'matricule': academicienModel.matricule,
      'nom': academicienModel.nom,
      'prenoms': academicienModel.prenoms,
      'photo': academicienModel.photo,
    };

    final Response response = await put(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return AcademicienModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a academicien');
    }
  }

  Future<String> deleteacademicien(String id) async {
    Response res = await delete(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      return "academicien deleted";
    } else {
      throw "Failed to delete a academicien.";
    }
  }
}
