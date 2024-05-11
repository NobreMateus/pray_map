abstract class SelectCountryState {}

class SelectCountrySearchState extends SelectCountryState {}

class SelectCountryLoadingState extends SelectCountryState {}

class SelectCountryShowCountryState extends SelectCountryState {
  final String country;

  SelectCountryShowCountryState({required this.country});
}
