abstract class SelectCountryEvent {}

class PerformIntroStart extends SelectCountryEvent {}

class PerformSelectCountryEvent extends SelectCountryEvent {}

class FinishLoadingEvent extends SelectCountryEvent {}

class BackToStartEvent extends SelectCountryEvent {}

class PrayedEvent extends SelectCountryEvent {}
