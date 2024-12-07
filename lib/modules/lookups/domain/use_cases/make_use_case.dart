import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency_response.dart';

import '../entities/currency.dart';
import 'package:dartz/dartz.dart';
import 'package:contactcars_app_retail/db/api/failure.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/repositories/lookups_repository.dart';

class CurrencyUseCase {
  late LookupsRepository repository;

  CurrencyUseCase({required this.repository});

  Future<Either<Failure, CurrencyResponse>> getCurrencies() async {
    return await repository.getCurrencies();
  }
}
