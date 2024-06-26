import 'package:orar_pelos_paises/domain/use_cases/pray_for_country_use_case/pray_for_country_use_case.dart';
import 'package:orar_pelos_paises/select_country/data/select_country_repository.dart';

class PrayForCountryUseCaseImpl extends PrayForCountryUseCase {
  final SelectCountryRepository repository;

  PrayForCountryUseCaseImpl({required this.repository});

  @override
  Future<void> execute(String country) async {
    await repository.pray(country);
  }
}
