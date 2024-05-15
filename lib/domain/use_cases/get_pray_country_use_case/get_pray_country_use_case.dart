import 'package:map_study/domain/country_data.dart';

abstract class GetPrayCountryUseCase {
  Future<CountryData> execute();
}
