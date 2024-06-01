import 'package:orar_pelos_paises/domain/country_data.dart';

abstract class SelectCountryState {}

class SelectCountryIntroState extends SelectCountryState {}

class SelectCountrySearchState extends SelectCountryState {}

class SelectCountryLoadingState extends SelectCountryState {
  final String message;

  SelectCountryLoadingState({required this.message});
}

class SelectCountryShowCountryState extends SelectCountryState {
  final CountryData country;

  SelectCountryShowCountryState({required this.country});
}

class SelectCountryCongratsState extends SelectCountryState {}
