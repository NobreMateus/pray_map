import 'package:flutter/material.dart';

class MapModel {
  MapModel(this.state, this.stateCode, this.ptState, this.color);

  String state;
  String stateCode;
  String ptState;
  Color color;
}

final countries = [
  MapModel('Afghanistan', 'AFE', 'Afeganistão', Colors.amber),
];
