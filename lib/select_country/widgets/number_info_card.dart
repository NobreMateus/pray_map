import 'package:flutter/material.dart';
import 'package:orar_pelos_paises/select_country/widgets/definitios.dart';

class NumberInfoCard extends StatelessWidget {
  final String number;
  final String unity;
  final String info;

  const NumberInfoCard({
    super.key,
    required this.number,
    required this.unity,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffF0F0F0),
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
        child: Column(
          children: [
            SelectableText(
              info,
              style: commomTextStyle.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SelectableText(
              number,
              style: commomTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
