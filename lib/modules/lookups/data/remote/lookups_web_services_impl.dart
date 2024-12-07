import 'package:contactcars_app_retail/db/api/url_provider.dart';
import 'package:contactcars_app_retail/modules/lookups/data/remote/lookups_endpoints.dart';
import 'package:contactcars_app_retail/modules/lookups/data/remote/lookups_web_services.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency_response.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency.dart';
import 'package:dartz/dartz.dart';
import 'package:contactcars_app_retail/db/api/failure.dart';
import 'package:contactcars_app_retail/db/api/dio_provider.dart';

class LookupsWebServicesImpl implements LookupsWebServices {
  @override
  Future<Either<Failure, CurrencyResponse>> fetchCurrencies() async {
    print("Mou3az_Tags api api is called");
    try {
      final response = await getApi(LookupsEndPoints.getCurrencies,
          queryParameters: {"apiKey": UrlProvider.config.apiKey});
      return response.fold(
        (failure) {
          print("Mou3az_Tags api failure ${failure.errorMessage}");
          return Left(failure);
        },
        (data) {

          final currencyResponse = CurrencyResponse.fromJson(data);

          // print("Mou3az_Tags api success ${data.length}");
          // List<Currency> items = (data as List<dynamic>)
          //     .map((item) => Currency.fromJson(item))
          //     .toList();
          return right(currencyResponse);
        },
      );
    } catch (error) {
      return Left(ApiFailure('$error'));
    }
  }
}
