import 'package:flutter/material.dart';

class LoadingCountryWidget extends StatelessWidget {
  const LoadingCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Center(child: Text("Loading Country Widget")),
      CircularProgressIndicator(),
    ]);
  }
}
