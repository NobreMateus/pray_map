abstract class SelectCountryEvent {}

class PerformSelectCountryEvent extends SelectCountryEvent {}

class FinishLoadingEvent extends SelectCountryEvent {}

class BackToStartEvent extends SelectCountryEvent {}
