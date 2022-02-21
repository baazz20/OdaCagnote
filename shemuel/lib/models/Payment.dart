class PaymentModel {
  final DateTime datepayment;
  final int montant;
  final String motif;

  const PaymentModel({
    required this.datepayment,
    required this.montant,
    required this.motif,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      datepayment: json['date'] as DateTime,
      montant: json['montant'] as int,
      motif: json['motif'] as String,
    );
  }
  @override
  String toString() {
    return 'Academicien{date: $datepayment, nom: $montant, motif: $motif}';
  }
}
