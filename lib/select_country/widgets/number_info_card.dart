import 'package:flutter/material.dart';
import 'package:map_study/select_country/widgets/definitios.dart';

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
          color: Colors.black12,
          width: 1,
        ),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              number,
              style: bigTitleStyle,
            ),
            Text(
              unity,
              style: smallTitleStyle,
            ),
            Text(
              info,
              style: commomTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
