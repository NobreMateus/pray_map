import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:map_study/domain/country_data.dart';

abstract class SelectCountryRepository {
  Future<List<CountryData>> getCountries();
  Future<void> pray(String country);
}

class SelectCountryRepositoryImp extends SelectCountryRepository {
  @override
  Future<List<CountryData>> getCountries() async {
    return [
      CountryData(
        nomeEn: "África do Sul",
        nomePt: "South Africa",
        capital: " Cidade do Cabo",
        continente: "continente",
        totalPopulacao: "totalPopulacao",
        cristaos: "cristaos",
        cristaosEvangelicos: "cristaosEvangelicos",
        maiorReligiao: "maiorReligiao",
        religiaoMaisCresce: "religiaoMaisCresce",
        maioresGruposEtnicos: "maioresGruposEtnicos",
        idiomaOficial: "idiomaOficial",
        totalIdiomas: "totalIdiomas",
        economia: "economia",
        politica: "politica",
        pedidosOracao: "pedidosOracao",
        posicaoPerseguicao: "posicaoPerseguicao",
        fonte: "fonte",
      ),
    ];
  }

  @override
  Future<void> pray(String country) async {
    FirebaseFirestore.instance.collection('country_pray').doc('first').update({
      "done_countries": FieldValue.arrayUnion([country]),
    });
  }
}
