import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:map_study/domain/country_data.dart';

abstract class SelectCountryRepository {
  Future<List<CountryData>> getCountries();
  Future<List<String>> getDoneCountries();
  Future<void> pray(String country);
}

class SelectCountryRepositoryImp extends SelectCountryRepository {
  @override
  Future<List<CountryData>> getCountries() async {
    final rawData = await rootBundle.loadString("assets/countries.csv");
    List<List<dynamic>> fields = const CsvToListConverter().convert(rawData);

    final countries = fields
        .map(
          (country) => CountryData(
            nomeEn: country[16],
            nomePt: country[0],
            linkBandeira: country[17],
            capital: country[1],
            continente: country[2],
            totalPopulacao: country[3],
            cristaos: country[4],
            cristaosEvangelicos: country[5],
            maiorReligiao: country[6],
            religiaoMaisCresce: country[7],
            maioresGruposEtnicos: country[8],
            idiomaOficial: country[9],
            totalIdiomas: country[10],
            economia: country[11],
            politica: country[12],
            pedidosOracao: country[13].split(";"),
            posicaoPerseguicao: country[14],
            fonte: country[15],
          ),
        )
        .toList();
    return countries;
  }

  @override
  Future<List<String>> getDoneCountries() async {
    final firData = await FirebaseFirestore.instance.collection('country_pray').doc('first').get();
    final firList = firData.data()?['done_countries'] as List<dynamic>;
    return firList.map((e) => e.toString()).toList();
  }

  @override
  Future<void> pray(String country) async {
    FirebaseFirestore.instance.collection('country_pray').doc('first').update({
      "done_countries": FieldValue.arrayUnion([country]),
    });
  }
}
