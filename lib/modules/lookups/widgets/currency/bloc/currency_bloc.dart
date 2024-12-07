import 'package:contactcars_app_retail/di/lookups_locator.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/use_cases/make_use_case.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/bloc/currency_bloc_event.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/bloc/currency_bloc_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyBloc extends Bloc<CurrencyBlocEvent, CurrencyBlocState> {
  TextEditingController searchQueryController = TextEditingController();
  List<Currency> bodyShapes = [];

  CurrencyBloc() : super(CurrenciesInitialState(updateCounter: 1)) {
    on<GetCurrenciesEvent>(getBodyShapes);

    add(GetCurrenciesEvent());
  }

  void getBodyShapes(
      GetCurrenciesEvent event, Emitter<CurrencyBlocState> emit) async {
    CurrencyUseCase currencyUseCase = locator<CurrencyUseCase>();
    final result = await currencyUseCase.getCurrencies();
    return result.fold(
      (failure) {
        print("Mou3az_Tags bloc failure ${failure.errorMessage}");
      },
      (data) async {
        //print("Mou3az_Tags bloc success ${data.length}");
       // bodyShapes = data;
        emit(CurrenciesLoadedState(updateCounter: state.updateCounter + 1));
      },
    );
  }
}
