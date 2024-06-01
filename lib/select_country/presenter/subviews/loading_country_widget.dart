import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orar_pelos_paises/select_country/widgets/definitios.dart';

class LoadingCountryWidget extends StatelessWidget {
  final String text;

  const LoadingCountryWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(children: [
        const Spacer(),
        Center(
          child: SelectableText(
            text,
            style: titleStyle,
          ),
        ),
        const SizedBox(height: 24),
        Lottie.asset('assets/countries_anim.json'),
        const Spacer(),
      ]),
    );
  }
}
