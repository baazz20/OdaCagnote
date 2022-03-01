import 'package:dio/dio.dart';


class ApiMotif {
  final String postUrl = "http://192.168.252.127:8000/api/v1/motif/add/" ;
  final String getUrl = "http://192.168.252.127:8000/api/v1/motif?format=json";

  Future  postmotif(Map dated) async {
    var res = await Dio().post(postUrl,data: dated);
    if (res.statusCode == 200) {
      print(res.data["status"]);
      return res.data["status"];
    } else {
      var error= "Une erreur est survenue";
      return error;
    }
  }

  Future<List> getmotif() async {

    var res = await Dio().get(getUrl);
    if (res.statusCode == 200) {
      return res.data["data"];
    } else {
      throw "Impossible de se connecter à l'api";
    }
  }

  Future  putmotif(Map dated,ide) async {
    var res = await Dio().put("http://192.168.252.127:8000/api/v1/motif/update/${ide}",data: dated);
    if (res.statusCode == 200) {
      return res.data["status"];
    } else {
      var error= "Une erreur est survenue";
      return error;
    }
  }

  Future  delmotif(id) async {
    final String apiUrl = "http://192.168.252.127:8000/api/v1/motif/del/${id}" ;
    var res = await Dio().delete(apiUrl);
    if (res.statusCode == 200) {
      return res.data["status"];
    } else {
      var error= "Une erreur est survenue";
      return error;
    }
  }

}

class ApiAcad {
  final String postUrl = "http://192.168.252.127:8000/api/v1/academicien/add/" ;
  final String getUrl = "http://192.168.252.127:8000/api/v1/academicien?format=json";

  Future  postacad(Map dated) async {
    var res = await Dio().post(postUrl,data: dated);
    if (res.statusCode == 200) {
      return res.data["status"];
    } else {
      var error= "Une erreur est survenue";
      return error;
    }
  }

  Future<List> getacad() async {
    var res = await Dio().get(getUrl);
    if (res.statusCode == 200) {
      return res.data["data"];
    } else {
      throw "Impossible de se connecter à l'api";
    }
  }

  String apiURL(int ide) {
    return "http://192.168.252.127:8000/api/v1/academicien/update/${ide}";
  }
  Future  putacad(Map dated,ide) async {
    var res = await Dio().put(apiURL(ide),data: dated);
    if (res.statusCode == 200) {
      return res.data["status"];
    } else {
      var error= "Une erreur est survenue";
      return error;
    }
  }

  Future  delacad(id) async {
    final String apiUrl = "http://192.168.252.127:8000/api/v1/academicien/del/${id}?format=json" ;
    var res = await Dio().delete(apiUrl);
    if (res.statusCode == 200) {
      return res.data["status"];
    } else {
      var error= "Une erreur est survenue";
      return error;
    }
  }

}

///////////////////

