abstract class CurrencyConverterBlocEvent {
  const CurrencyConverterBlocEvent();
}

class GetCurrenciesEvent extends CurrencyConverterBlocEvent {}

class ConvertAmountEvent extends CurrencyConverterBlocEvent {}
