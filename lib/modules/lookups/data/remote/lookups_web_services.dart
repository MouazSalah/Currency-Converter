import 'package:contactcars_app_retail/db/api/failure.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency_response.dart';
import 'package:dartz/dartz.dart';

abstract class LookupsWebServices {
  Future<Either<Failure, CurrencyResponse>> fetchCurrencies();
}
