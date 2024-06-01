import 'package:flutter/material.dart';
import 'package:orar_pelos_paises/select_country/widgets/definitios.dart';

class IconTitleInfo extends StatelessWidget {
  final String title;
  final String info;
  final IconData icon;

  const IconTitleInfo({
    super.key,
    required this.title,
    required this.info,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 36,
        ),
        SelectableText(
          title,
          style: smallTitleStyle,
          textAlign: TextAlign.center,
        ),
        SelectableText(
          info,
          style: commomTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
