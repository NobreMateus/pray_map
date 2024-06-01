import 'package:flutter/material.dart';
import 'package:orar_pelos_paises/select_country/widgets/definitios.dart';

class GeneralInfoCard extends StatelessWidget {
  final String title;
  final String content;

  const GeneralInfoCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffF0F0F0),
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              title,
              style: titleStyle,
            ),
            SelectableText(
              content,
              style: commomTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
