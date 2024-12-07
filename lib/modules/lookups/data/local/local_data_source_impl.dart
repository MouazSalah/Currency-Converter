import 'package:contactcars_app_retail/db/hive/hive_tables.dart';
import 'package:contactcars_app_retail/modules/lookups/data/local/local_data_source.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency_response.dart';
import 'package:hive/hive.dart';

class LookupsLocalDataSourceImpl implements LookupsLocalDataSource {
  @override
  Future<void> cashCurrencies(CurrencyResponse currencies) async {
    Box<CurrencyResponse> currenciesBox;

    if (Hive.isBoxOpen(HiveTables.currenciesTable)) {
      currenciesBox = Hive.box<CurrencyResponse>(HiveTables.currenciesTable);
    } else {
      currenciesBox =
          await Hive.openBox<CurrencyResponse>(HiveTables.currenciesTable);
    }

    if (currenciesBox.isEmpty) {
      currenciesBox.add(currencies);
    } else {
      await currenciesBox.clear();
      currenciesBox.add(currencies);
    }
  }

  @override
  Future<CurrencyResponse> fetchCurrencies() async {
    Box<CurrencyResponse> currenciesBox;
    if (Hive.isBoxOpen(HiveTables.currenciesTable)) {
      currenciesBox = Hive.box<CurrencyResponse>(HiveTables.currenciesTable);
    } else {
      currenciesBox =
          await Hive.openBox<CurrencyResponse>(HiveTables.currenciesTable);
    }
    CurrencyResponse currencies = currenciesBox.values as CurrencyResponse;
    return currencies.isResultsEmpty
        ? CurrencyResponse(results: Map())
        : currencies;
  }
}
