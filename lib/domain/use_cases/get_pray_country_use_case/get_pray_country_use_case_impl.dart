import 'dart:math';

import 'package:orar_pelos_paises/domain/country_data.dart';
import 'package:orar_pelos_paises/domain/use_cases/get_pray_country_use_case/get_pray_country_use_case.dart';
import 'package:orar_pelos_paises/select_country/data/select_country_repository.dart';

class GetPrayCountryUseCaseImpl extends GetPrayCountryUseCase {
  final SelectCountryRepository repository;

  GetPrayCountryUseCaseImpl({required this.repository});

  @override
  Future<CountryData> execute() async {
    final countries = await repository.getCountries();
    final doneCountries = await repository.getDoneCountries();
    final filteredCountries = countries
        .where((element) => !doneCountries.contains(element.nomeEn))
        .toList();
    final randomCountry =
        filteredCountries[Random().nextInt(filteredCountries.length)];
    return randomCountry;
  }
}
