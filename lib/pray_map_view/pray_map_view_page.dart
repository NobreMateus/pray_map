import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_study/countries.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  List<MapModel> _mapData = <MapModel>[];
  List<MapModel> _allCountries = <MapModel>[];

  final List<Color> _colors = const [
    Color(0xff9e0142),
    Color(0xffd53e4f),
    Color(0xfff46d43),
    Color(0xfffdae61),
    Color(0xffd53e4f),
    Color(0xfffee08b),
    Color(0xffe6f598),
    Color(0xffabdda4),
    Color(0xff66c2a5),
    Color(0xff3288bd),
    Color(0xff5e4fa2),
  ];

  @override
  void initState() {
    _updateState();
    _mapData = [MapModel("Turkmenistan", "", 'Turcomenistão', Colors.black38)];
    super.initState();
  }

  _updateState() async {
    await _readJson();
    await _fetchCountry();
  }

  _readJson() async {
    final String response =
        await rootBundle.loadString('assets/countries_geo.json');
    final data = await jsonDecode(response);

    final features = data["features"];

    final List<MapModel> countriesList = features.map<MapModel>((item) {
      return MapModel(
        item['properties']['name'],
        item['id'],
        item['properties']['name'],
        _colors[Random().nextInt(9)],
      );
    }).toList();
    setState(() {
      _allCountries = countriesList;
    });
  }

  _fetchCountry() async {
    FirebaseFirestore.instance
        .collection('country_pray')
        .doc('first')
        .snapshots()
        .listen((querySnapshot) {
      Map<String, dynamic>? result = querySnapshot.data();
      List<dynamic> countries = result?['done_countries'];

      final filteredCountriesModel = countries
          .where((country) =>
              _allCountries.map((e) => e.state).contains(country.toString()))
          .toList();

      final countriesModel = filteredCountriesModel.map((countryStr) {
        final ctr = countryStr.toString();
        final country = _allCountries.firstWhere((item) => item.state == ctr);
        return country;
      }).toList();

      print(filteredCountriesModel);
      setState(() {
        _mapData = countriesModel;
      });
    });
  }

  MapShapeSource _generateSource() {
    return MapShapeSource.asset(
      'assets/countries_geo.json',
      shapeDataField: 'name',
      dataCount: _mapData.length,
      primaryValueMapper: (int index) => _mapData[index].state,
      shapeColorValueMapper: (int index) => _mapData[index].color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfMaps(
          layers: [
            MapShapeLayer(
              source: _generateSource(),
            ),
          ],
        ),
      ),
    );
  }
}
