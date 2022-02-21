import 'dart:convert';
import '../models/Payment.dart';
import 'package:http/http.dart';

class ApiServicePayment {
  final String apiUrl = "http://192.168.252.:3000/";

  Future<List<PaymentModel>> getPayments() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<PaymentModel> payments =
          body.map((dynamic item) => PaymentModel.fromJson(item)).toList();
      return payments;
    } else {
      throw "Failed to load payment list";
    }
  }

  Future<PaymentModel> getPaymentBydate(DateTime date) async {
    final response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return PaymentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load  payment by date filter');
    }
  }

/* Future<PaymentModel> getPaymentBydateAndId(DateTime date, int id) async {
    final response = await get('');

    if (response.statusCode == 200) {
      return PaymentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }*/

  /*Future<PaymentModel> createCase(PaymentModel payement) async {
    Map data = {
      'datePayment': payement.datepayment,
      'montant': payement.montant,
      'motif': payement.motif,
      
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return PaymentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post Payment');
    }
  }*/

  /*Future<PaymentModel> updateCases(String datepayment, int id) async {
    Map data = {
      'datepayment': payment.datepayment,
      'montant': payment.montant,
      'motif': payment.motif,
      
    };

    final Response response = await put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return PaymentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a payment');
    }
  }*/

/*
  Future<void> deleteCase(String datepayment, int id) async {
    Response res = await delete('$apiUrl/$id');

    if (res.statusCode == 200) {
      print("Payment deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }*/

}
