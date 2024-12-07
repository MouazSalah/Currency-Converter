import 'package:contactcars_app_retail/db/api/failure.dart';
import 'package:contactcars_app_retail/modules/lookups/data/local/local_data_source.dart';
import 'package:contactcars_app_retail/modules/lookups/data/remote/lookups_web_services.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency_response.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/repositories/lookups_repository.dart';
import 'package:dartz/dartz.dart';

class LookupsRepositoryImpl implements LookupsRepository {
  final LookupsLocalDataSource localDataSource;
  final LookupsWebServices remoteDataSource;

  LookupsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, CurrencyResponse>> getCurrencies() async {
    final response = await localDataSource.fetchCurrencies();
    if (response.isResultsEmpty) {
      final response = await remoteDataSource.fetchCurrencies();
      return response.fold(
        (failure) => left(failure),
        (data) async {
          await localDataSource.cashCurrencies(data);
          return right(data);
        },
      );
    } else {
      return right(response);
    }
  }
}
