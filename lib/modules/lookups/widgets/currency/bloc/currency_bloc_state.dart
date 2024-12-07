sealed class CurrencyBlocState {
  final int updateCounter;
  CurrencyBlocState({required this.updateCounter});
}

class CurrenciesInitialState extends CurrencyBlocState {
  CurrenciesInitialState({required super.updateCounter});
}

class CurrenciesLoadedState extends CurrencyBlocState {
  CurrenciesLoadedState({required super.updateCounter});
}
