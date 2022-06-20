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
      contractValue: map['contract_value']?.toDouble() ?? 0.0,
      netValue: map['net_value']?.toInt() ?? 0,
      installmentValue: map['installment_value']?.toDouble() ?? 0.0,
      lastInstallmentValue: map['last_installment_value']?.toDouble() ?? 0.0,
      iofFee: map['iof_fee']?.toDouble() ?? 0.0,
      originationFee: map['origination_fee']?.toDouble() ?? 0.0,
      term: map['term']?.toInt() ?? 0,
      collateral: map['collateral']?.toInt() ?? 0,
      collateralInBrl: map['collateral_in_brl']?.toDouble() ?? 0.0,
      collateralUnitPrice: map['collateral_unit_price']?.toDouble() ?? 0.0,
      firstDueDate: map['first_due_date'] ?? '',
      lastDueDate: map['last_due_date'] ?? '',
      interestRate: map['interest_rate']?.toDouble() ?? 0.0,
      monthlyRate: map['monthly_rate']?.toDouble() ?? 0.0,
      annualRate: map['annual_rate']?.toDouble() ?? 0.0,
    );
  }
}
