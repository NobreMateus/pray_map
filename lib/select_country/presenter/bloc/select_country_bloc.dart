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
    on<PrayedEvent>(onPrayedEvent);
  }

  onPerformSelectCountryEvent(
    PerformSelectCountryEvent event,
    Emitter<SelectCountryState> emit,
  ) async {
    emit(SelectCountryLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    final countries = await repository.getCountries();
    final selectedCountry = countries[0];
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

  onPrayedEvent(
    PrayedEvent event,
    Emitter<SelectCountryState> emit,
  ) async {
    final country = (state as SelectCountryShowCountryState).country;
    emit(SelectCountryLoadingState());
    await Future.wait(
      [
        repository.pray(country.nomeEn),
        Future.delayed(const Duration(seconds: 3)),
      ],
    );
    emit(SelectCountrySearchState());
  }
}
