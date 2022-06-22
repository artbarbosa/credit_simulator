import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rispar_credit_simulator/src/core/shared/services/remote/http_client_service.dart';
import 'package:rispar_credit_simulator/src/core/user/model/user_model.dart';
import 'package:rispar_credit_simulator/src/modules/credit/models/credit_model.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/models/post_credit_model.dart';

class HttpClientServiceMock extends Mock implements IHttpClientService {}

final userModelMock = UserModel(fullName: 'Test', email: 'test');

Response responseMock =
    Response(data: creditMapMock, requestOptions: RequestOptions(path: ''));

final postCreditModelMock = PostCreditModel(
    user: userModelMock,
    ltv: 35,
    amount: 2000.0,
    term: 12,
    hasProtectedCollateral: true);

final creditModelMock = CreditModel(
    id: '4039bcf6-5a11-45ba-acb9-92be55a33043',
    fullname: 'Arthur Barbosa',
    email: 'arthur.bos@hotmail.com',
    ltv: 35,
    contractValue: 2615.860425,
    netValue: 2500,
    installmentValue: 38.803765,
    lastInstallmentValue: 2654.66419,
    iofFee: 50.463915,
    originationFee: 65.396511,
    term: 12,
    collateral: 4813040,
    collateralInBrl: 1,
    collateralUnitPrice: 1,
    firstDueDate: 'firstDueDate',
    lastDueDate: 'lastDueDate',
    interestRate: 1,
    monthlyRate: 1,
    annualRate: 1);

var creditMapMock = {
  "id": "4039bcf6-5a11-45ba-acb9-92be55a33043",
  "fullname": "Arthur Barbosa",
  "email": "arthur.bos@hotmail.com",
  "ltv": 35,
  "contract_value": 2615.860425,
  "net_value": 2500.0,
  "installment_value": 38.803765,
  "last_installment_value": 2654.66419,
  "iof_fee": 50.463915,
  "origination_fee": 65.396511,
  "term": 12,
  "collateral": 6971356,
  "collateral_in_brl": 7142.857143,
  "collateral_unit_price": 102460.069667,
  "first_due_date": "2022-07-10",
  "last_due_date": "2023-06-10",
  "interest_rate": 1.49,
  "monthly_rate": 1.925109,
  "annual_rate": 25.711274
};
