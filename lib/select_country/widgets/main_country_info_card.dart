import 'package:flutter/material.dart';
import 'package:orar_pelos_paises/select_country/widgets/definitios.dart';
import 'package:orar_pelos_paises/select_country/widgets/icon_title_info.dart';

class MainCountryInfoCard extends StatelessWidget {
  final String country;
  final String capital;
  final String population;
  final String continent;

  const MainCountryInfoCard({
    required this.country,
    required this.capital,
    required this.population,
    required this.continent,
    super.key,
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
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              SelectableText(
                country,
                textAlign: TextAlign.center,
                style: countryTitleStyle,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth / 3,
                    child: IconTitleInfo(
                      icon: Icons.approval_outlined,
                      title: "Continente",
                      info: continent.replaceAll(".", ""),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: constraints.maxWidth / 3,
                    child: IconTitleInfo(
                      icon: Icons.place_outlined,
                      title: "Capital",
                      info: capital.replaceAll(".", ""),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: constraints.maxWidth / 3,
                    child: IconTitleInfo(
                      icon: Icons.people_outline,
                      title: "População",
                      info: population.replaceAll(".", ""),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
