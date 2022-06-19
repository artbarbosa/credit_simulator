class ApiConst {
  static String apiURL() => 'https://api.rispar.com.br/acquisition/simulation';

  static String creditSimulatorPostData({
    required String name,
    required String email,
    required List<int> ltv,
    required double amount,
    required List<int> term,
    required bool hasProtectedCollateral,
  }) =>
      '''
  {
	  "fullname": "asd asd asd",
	  "email": "asdf@gmail.com",
	  "ltv": [20, 35, 50],
	  "amount": 5.0,
	  "term": [3, 6, 9, 12],
	  "has_protected_collateral": false
  }''';
}
