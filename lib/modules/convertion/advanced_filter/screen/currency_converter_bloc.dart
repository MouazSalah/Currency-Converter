import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:contactcars_app_retail/di/lookups_locator.dart';
import 'package:contactcars_app_retail/modules/convertion/advanced_filter/screen/currency_converter_bloc_event.dart';
import 'package:contactcars_app_retail/modules/convertion/advanced_filter/screen/currency_converter_bloc_state.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/use_cases/make_use_case.dart';
import 'package:flutter/material.dart';

class CurrencyConverterBloc
    extends Bloc<CurrencyConverterBlocEvent, CurrencyConverterBlocState> {
  List<Currency> currenciesList = [];

  Currency? currencyFrom;
  Currency? currencyTo;

  TextEditingController priceAmountController = TextEditingController();

  CurrencyConverterBloc() : super(CurrencyConverterInitialState()) {
    on<GetCurrenciesEvent>(onAdvancedFilterInit);
    on<ConvertAmountEvent>(convertAmount);
  }

  FutureOr<void> onAdvancedFilterInit(GetCurrenciesEvent event,
      Emitter<CurrencyConverterBlocState> emit) async {
    emit(CurrencyConverterLoadingState());
    CurrencyUseCase currencyUseCase = locator<CurrencyUseCase>();

    final curenciesResult = await currencyUseCase.getCurrencies();

    curenciesResult.fold(
      (failure) {},
      (data) {
       // currenciesList = data.results;
        emit(CurrencyConverterCurrenciesLoadedState());
      },
    );
  }

  FutureOr<void> convertAmount(ConvertAmountEvent event,
      Emitter<CurrencyConverterBlocState> emit) async {
    emit(CurrencyConverterLoadingState());
    CurrencyUseCase currencyUseCase = locator<CurrencyUseCase>();

    final curenciesResult = await currencyUseCase.getCurrencies();

    curenciesResult.fold(
      (failure) {},
      (data) {
        //currenciesList = data;
        emit(CurrencyConverterCurrenciesLoadedState());
      },
    );
  }
}
