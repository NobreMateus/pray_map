import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orar_pelos_paises/domain/use_cases/get_pray_country_use_case/get_pray_country_use_case.dart';
import 'package:orar_pelos_paises/domain/use_cases/pray_for_country_use_case/pray_for_country_use_case.dart';
import 'package:orar_pelos_paises/select_country/presenter/bloc/select_country_event.dart';
import 'package:orar_pelos_paises/select_country/presenter/bloc/select_country_state.dart';

class SelectCountrBloc extends Bloc<SelectCountryEvent, SelectCountryState> {
  final GetPrayCountryUseCase getPrayCountryUseCase;
  final PrayForCountryUseCase prayForCountryUseCase;

  SelectCountrBloc({
    required this.getPrayCountryUseCase,
    required this.prayForCountryUseCase,
  }) : super(SelectCountryIntroState()) {
    on<PerformIntroStart>(onPerformIntroStart);
    on<PerformSelectCountryEvent>(onPerformSelectCountryEvent);
    on<FinishLoadingEvent>(onFinishLoadingEvent);
    on<BackToStartEvent>(onBackToStartEvent);
    on<PrayedEvent>(onPrayedEvent);
  }

  onPerformIntroStart(
    PerformIntroStart event,
    Emitter<SelectCountryState> emit,
  ) {
    emit(SelectCountrySearchState());
  }

  onPerformSelectCountryEvent(
    PerformSelectCountryEvent event,
    Emitter<SelectCountryState> emit,
  ) async {
    emit(SelectCountryLoadingState(message: "Procurando Países..."));
    await Future.delayed(const Duration(seconds: 3));
    final selectedCountry = await getPrayCountryUseCase.execute();
    emit(SelectCountryShowCountryState(country: selectedCountry));
    await FirebaseAnalytics.instance.logEvent(
      name: 'country_sorted',
      parameters: {"country": selectedCountry.nomePt},
    );
  }

  onFinishLoadingEvent(
    FinishLoadingEvent event,
    Emitter<SelectCountryState> emit,
  ) {}

  onBackToStartEvent(
    BackToStartEvent event,
    Emitter<SelectCountryState> emit,
  ) {
    emit(SelectCountryIntroState());
  }

  onPrayedEvent(
    PrayedEvent event,
    Emitter<SelectCountryState> emit,
  ) async {
    final country = (state as SelectCountryShowCountryState).country;
    await FirebaseAnalytics.instance.logEvent(
      name: 'country_prayed',
      parameters: {"country": country.nomePt},
    );
    emit(SelectCountryLoadingState(
        message: "Salvando oração por ${country.nomePt}..."));
    await Future.wait(
      [
        prayForCountryUseCase.execute(country.nomeEn),
        Future.delayed(const Duration(seconds: 0)),
      ],
    );
    emit(SelectCountryCongratsState());
  }
}
