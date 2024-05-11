abstract class SelectCountryRepository {
  Future<List<String>> getCountries();
  Future<void> pray(String country);
}

class SelectCountryRepositoryImp extends SelectCountryRepository {
  @override
  Future<List<String>> getCountries() async {
    return [
      'Afghanistan',
      'Angola',
      'Albania',
      'United Arab Emirates',
      'Argentina',
      'Armenia',
      'Antarctica',
      'French Southern and Antarctic Lands',
      'Australia',
      'Austria',
      'Azerbaijan',
      'Burundi',
      'Belgium',
      'Benin',
      'Burkina Faso',
      'Bangladesh',
      'Bulgaria',
      'The Bahamas',
      'Bosnia and Herzegovina',
      'Belarus',
      'Belize',
      'Bermuda',
      'Bolivia',
      'Brazil',
      'Brunei',
      'Bhutan',
      'Botswana',
      'Central African Republic',
      'Canada',
      'Switzerland',
    ];
  }

  @override
  Future<void> pray(String country) async {}
}
