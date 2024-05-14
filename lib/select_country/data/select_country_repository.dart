import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:map_study/domain/country_data.dart';

abstract class SelectCountryRepository {
  Future<List<CountryData>> getCountries();
  Future<void> pray(String country);
}

class SelectCountryRepositoryImp extends SelectCountryRepository {
  @override
  Future<List<CountryData>> getCountries() async {
    final firData = await FirebaseFirestore.instance.collection('country_pray').doc('first').get();
    final countriesData = firData.data()?["countries"] as List<dynamic>;
    final countries = countriesData
        .map(
          (country) => CountryData(
            nomeEn: country["nomeEn"],
            nomePt: country["nomePt"],
            linkBandeira: country["linkBandeira"],
            capital: country["capital"],
            continente: country["continente"],
            totalPopulacao: country["totalPopulacao"],
            cristaos: country["cristaos"],
            cristaosEvangelicos: country["cristaosEvangelicos"],
            maiorReligiao: country["maiorReligiao"],
            religiaoMaisCresce: country["religiaoMaisCresce"],
            maioresGruposEtnicos: country["maioresGruposEtnicos"],
            idiomaOficial: country["idiomaOficial"],
            totalIdiomas: country["totalIdiomas"],
            economia: country["economia"],
            politica: country["politica"],
            pedidosOracao: (country["pedidosOracao"] as String).split(";"),
            posicaoPerseguicao: country["posicaoPerseguicao"],
            fonte: country["fonte"],
          ),
        )
        .toList();
    return countries;
  }

  @override
  Future<void> pray(String country) async {
    FirebaseFirestore.instance.collection('country_pray').doc('first').update({
      "done_countries": FieldValue.arrayUnion([country]),
    });
  }
}
