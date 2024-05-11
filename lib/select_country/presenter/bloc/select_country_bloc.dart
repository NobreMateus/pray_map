import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_study/select_country/data/select_country_repository.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_event.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_state.dart';

class SelectCountrBloc extends Bloc<SelectCountryEvent, SelectCountryState> {
  final SelectCountryRepository repository;

  SelectCountrBloc(this.repository) : super(SelectCountrySearchState()) {
    on<PerformSelectCountryEvent>(onPerformSelectCountryEvent);
    on<FinishLoadingEvent>(onFinishLoadingEvent);
    on<BackToStartEvent>(onBackToStartEvent);
  }

  onPerformSelectCountryEvent(
    PerformSelectCountryEvent event,
    Emitter<SelectCountryState> emit,
  ) async {
    emit(SelectCountryLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    final countries = await repository.getCountries();
    final selectedCountry = countries[Random().nextInt(countries.length - 1)];
    emit(SelectCountryShowCountryState(country: selectedCountry));
  }

  onFinishLoadingEvent(
    FinishLoadingEvent event,
    Emitter<SelectCountryState> emit,
  ) {}

  onBackToStartEvent(
    BackToStartEvent event,
    Emitter<SelectCountryState> emit,
  ) {
    emit(SelectCountrySearchState());
  }
}
