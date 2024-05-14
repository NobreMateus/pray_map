import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:map_study/select_country/widgets/definitios.dart';

class LoadingCountryWidget extends StatelessWidget {
  const LoadingCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(children: [
        const Spacer(),
        const Center(
          child: Text(
            "Procurando país...",
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
