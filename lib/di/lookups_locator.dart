import 'package:contactcars_app_retail/modules/lookups/data/local/local_data_source.dart';
import 'package:contactcars_app_retail/modules/lookups/data/local/local_data_source_impl.dart';
import 'package:contactcars_app_retail/modules/lookups/data/remote/lookups_web_services.dart';
import 'package:contactcars_app_retail/modules/lookups/data/remote/lookups_web_services_impl.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/repositories/lookups_repository.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/repositories/lookups_repository_impl.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/use_cases/make_use_case.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initLookupsDI() {
  locator.registerLazySingleton<LookupsWebServices>(
      () => LookupsWebServicesImpl());

  locator.registerLazySingleton<LookupsLocalDataSource>(
      () => LookupsLocalDataSourceImpl());

  locator.registerLazySingleton<LookupsRepository>(() => LookupsRepositoryImpl(
      localDataSource: locator<LookupsLocalDataSource>(),
      remoteDataSource: locator<LookupsWebServices>()));

  locator.registerLazySingleton<CurrencyUseCase>(
      () => CurrencyUseCase(repository: locator<LookupsRepository>()));

}
