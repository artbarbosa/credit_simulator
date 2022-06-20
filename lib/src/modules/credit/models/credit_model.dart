class CreditModel {
  final String id;
  final String fullname;
  final String email;
  final int ltv;
  final double contractValue;
  final int netValue;
  final double installmentValue;
  final double lastInstallmentValue;
  final double iofFee;
  final double originationFee;
  final int term;
  final int collateral;
  final double collateralInBrl;
  final double collateralUnitPrice;
  final String firstDueDate;
  final String lastDueDate;
  final double interestRate;
  final double monthlyRate;
  final double annualRate;

  CreditModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.ltv,
    required this.contractValue,
    required this.netValue,
    required this.installmentValue,
    required this.lastInstallmentValue,
    required this.iofFee,
    required this.originationFee,
    required this.term,
    required this.collateral,
    required this.collateralInBrl,
    required this.collateralUnitPrice,
    required this.firstDueDate,
    required this.lastDueDate,
    required this.interestRate,
    required this.monthlyRate,
    required this.annualRate,
  });

  factory CreditModel.fromMap(Map<String, dynamic> map) {
    return CreditModel(
      id: map['id'] ?? '',
      fullname: map['fullname'] ?? '',
      email: map['email'] ?? '',
      ltv: map['ltv']?.toInt() ?? 0,
      contractValue: map['contractValue']?.toDouble() ?? 0.0,
      netValue: map['netValue']?.toInt() ?? 0,
      installmentValue: map['installmentValue']?.toDouble() ?? 0.0,
      lastInstallmentValue: map['lastInstallmentValue']?.toDouble() ?? 0.0,
      iofFee: map['iofFee']?.toDouble() ?? 0.0,
      originationFee: map['originationFee']?.toDouble() ?? 0.0,
      term: map['term']?.toInt() ?? 0,
      collateral: map['collateral']?.toInt() ?? 0,
      collateralInBrl: map['collateralInBrl']?.toDouble() ?? 0.0,
      collateralUnitPrice: map['collateralUnitPrice']?.toDouble() ?? 0.0,
      firstDueDate: map['firstDueDate'] ?? '',
      lastDueDate: map['lastDueDate'] ?? '',
      interestRate: map['interestRate']?.toDouble() ?? 0.0,
      monthlyRate: map['monthlyRate']?.toDouble() ?? 0.0,
      annualRate: map['annualRate']?.toDouble() ?? 0.0,
    );
  }
}
