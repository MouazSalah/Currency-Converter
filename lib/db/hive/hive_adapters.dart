import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency.dart';
import 'package:hive/hive.dart';

void registerHiveAdapters() async {
  Hive.registerAdapter(CurrencyAdapter());
  // Hive.registerAdapter(CurrencyResponseAdapter());
}
