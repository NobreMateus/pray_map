import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_study/domain/use_cases/get_pray_country_use_case/get_pray_country_use_case.dart';
import 'package:map_study/domain/use_cases/pray_for_country_use_case/pray_for_country_use_case.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_event.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_state.dart';

class SelectCountrBloc extends Bloc<SelectCountryEvent, SelectCountryState> {
  final GetPrayCountryUseCase getPrayCountryUseCase;
  final PrayForCountryUseCase prayForCountryUseCase;

  SelectCountrBloc({
    required this.getPrayCountryUseCase,
    required this.prayForCountryUseCase,
  }) : super(SelectCountrySearchState()) {
    on<PerformSelectCountryEvent>(onPerformSelectCountryEvent);
    on<FinishLoadingEvent>(onFinishLoadingEvent);
    on<BackToStartEvent>(onBackToStartEvent);
    on<PrayedEvent>(onPrayedEvent);
  }

  onPerformSelectCountryEvent(
    PerformSelectCountryEvent event,
    Emitter<SelectCountryState> emit,
  ) async {
    emit(SelectCountryLoadingState(message: "Procurando Países..."));
    await Future.delayed(const Duration(seconds: 3));
    final selectedCountry = await getPrayCountryUseCase.execute();
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
    emit(SelectCountryLoadingState(message: "Salvando oração por ${country.nomePt}..."));
    await Future.wait(
      [
        prayForCountryUseCase.execute(country.nomeEn),
        Future.delayed(const Duration(seconds: 3)),
      ],
    );
    emit(SelectCountrySearchState());
  }
}
