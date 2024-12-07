abstract class CurrencyConverterBlocState {
  const CurrencyConverterBlocState();
}

class CurrencyConverterInitialState extends CurrencyConverterBlocState {}

class CurrencyConverterLoadingState extends CurrencyConverterBlocState {}

class CurrencyConverterCurrenciesLoadedState
    extends CurrencyConverterBlocState {}

class CurrencyConverterAmountConvertedState
    extends CurrencyConverterBlocState {}
