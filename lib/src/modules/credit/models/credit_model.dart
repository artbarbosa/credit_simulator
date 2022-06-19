class CreditModel {
  final double value;
  final double guarantee;
  final double interestRate;
  final int guaranteePercentage;
  final DateTime firstSalary;
  final double iof;
  final double platformFee;
  final double totalFinanced;
  final double monthlyCET;
  final double annualCET;
  final double quoteBCT;

  CreditModel({
    required this.value,
    required this.guarantee,
    required this.interestRate,
    required this.guaranteePercentage,
    required this.firstSalary,
    required this.iof,
    required this.platformFee,
    required this.totalFinanced,
    required this.monthlyCET,
    required this.annualCET,
    required this.quoteBCT,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'value': value});
    result.addAll({'guarantee': guarantee});
    result.addAll({'interestRate': interestRate});
    result.addAll({'guaranteePercentage': guaranteePercentage});
    result.addAll({'firstSalary': firstSalary.millisecondsSinceEpoch});
    result.addAll({'iof': iof});
    result.addAll({'platformFee': platformFee});
    result.addAll({'totalFinanced': totalFinanced});
    result.addAll({'monthlyCET': monthlyCET});
    result.addAll({'annualCET': annualCET});
    result.addAll({'quoteBCT': quoteBCT});

    return result;
  }

  factory CreditModel.fromMap(Map<String, dynamic> map) {
    return CreditModel(
      value: map['value']?.toDouble() ?? 0.0,
      guarantee: map['guarantee']?.toDouble() ?? 0.0,
      interestRate: map['interestRate']?.toDouble() ?? 0.0,
      guaranteePercentage: map['guaranteePercentage']?.toInt() ?? 0,
      firstSalary: DateTime.fromMillisecondsSinceEpoch(map['firstSalary']),
      iof: map['iof']?.toDouble() ?? 0.0,
      platformFee: map['platformFee']?.toDouble() ?? 0.0,
      totalFinanced: map['totalFinanced']?.toDouble() ?? 0.0,
      monthlyCET: map['monthlyCET']?.toDouble() ?? 0.0,
      annualCET: map['annualCET']?.toDouble() ?? 0.0,
      quoteBCT: map['quoteBCT']?.toDouble() ?? 0.0,
    );
  }
}
