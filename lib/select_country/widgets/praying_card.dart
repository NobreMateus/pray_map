import 'package:flutter/material.dart';
import 'package:map_study/select_country/widgets/definitios.dart';

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
          color: Colors.black12,
          width: 1,
        ),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pedidos de Oração",
              style: titleStyle,
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < pedidosOracao.length; i++)
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24,
                        child: Text((i + 1).toString()),
                      ),
                      SizedBox(
                        width: 400,
                        child: Text(
                          pedidosOracao[i],
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              )
          ],
        ),
      ),
    );
  }
}
