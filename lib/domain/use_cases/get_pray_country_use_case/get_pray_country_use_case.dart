import 'package:orar_pelos_paises/domain/country_data.dart';

abstract class GetPrayCountryUseCase {
  Future<CountryData> execute();
}
