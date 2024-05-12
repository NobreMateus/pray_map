import 'package:flutter/material.dart';

class LoadingCountryWidget extends StatelessWidget {
  const LoadingCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(height: 24),
      Center(child: Text("Procurando país")),
      SizedBox(height: 24),
      CircularProgressIndicator(),
    ]);
  }
}
