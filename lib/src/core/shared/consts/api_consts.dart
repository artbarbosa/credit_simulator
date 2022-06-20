class ApiConst {
  static String apiURL() => 'https://api.rispar.com.br/acquisition/simulation';

  static Map creditSimulatorPostData({
    required String fullname,
    required String email,
    required int ltv,
    required double amount,
    required int term,
    required bool hasProtectedCollateral,
  }) {
    return {
      "fullname": fullname,
      "email": email,
      "ltv": ltv,
      "amount": amount,
      "term": term,
      "has_protected_collateral": hasProtectedCollateral
    };
  }
}
