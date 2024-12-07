
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency_response.dart';

abstract class LookupsLocalDataSource {

  Future<void> cashCurrencies(CurrencyResponse currencies);
  Future<CurrencyResponse> fetchCurrencies();

}