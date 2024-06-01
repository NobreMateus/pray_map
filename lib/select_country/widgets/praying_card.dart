import 'package:flutter/material.dart';
import 'package:orar_pelos_paises/select_country/widgets/definitios.dart';

class PrayingCard extends StatelessWidget {
  final List<String> pedidosOracao;

  const PrayingCard({
    super.key,
    required this.pedidosOracao,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SelectableText(
              "Pedidos de Oração",
              style: titleStyle,
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < pedidosOracao.length; i++)
              Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SelectableText(
                          pedidosOracao[i],
                          style: commomTextStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (i != pedidosOracao.length - 1)
                    const Divider(
                      color: Colors.black12,
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
