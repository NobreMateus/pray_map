import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orar_pelos_paises/domain/country_data.dart';
import 'package:orar_pelos_paises/select_country/presenter/bloc/select_country_bloc.dart';
import 'package:orar_pelos_paises/select_country/presenter/bloc/select_country_event.dart';
import 'package:orar_pelos_paises/select_country/widgets/general_info_card.dart';
import 'package:orar_pelos_paises/select_country/widgets/main_country_info_card.dart';
import 'package:orar_pelos_paises/select_country/widgets/number_info_card.dart';
import 'package:orar_pelos_paises/select_country/widgets/praying_card.dart';

class ShowCountryWidget extends StatelessWidget {
  final CountryData country;

  const ShowCountryWidget({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectCountrBloc>();
    return Container(
      color: Colors.black26,
      child: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            color: const Color(0xffF5F5F5),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38)),
                          child: Image.network(
                            country.linkBandeira,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) {
                                return child;
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        MainCountryInfoCard(
                          capital: country.capital,
                          country: country.nomePt,
                          population: country.totalPopulacao,
                          continent: country.continente,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: NumberInfoCard(
                                number: country.cristaos,
                                unity: "",
                                info: "Cristãos",
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: NumberInfoCard(
                                number: country.cristaosEvangelicos,
                                unity: "",
                                info: "Cristãos Evangélicos",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        GeneralInfoCard(
                          title: "Maior Religião",
                          content: country.maiorReligiao,
                        ),
                        const SizedBox(height: 16),
                        GeneralInfoCard(
                          title: "Religião que mais cresce",
                          content: country.religiaoMaisCresce,
                        ),
                        const SizedBox(height: 16),
                        GeneralInfoCard(
                          title: "Maiores grupos étnicos",
                          content: country.maioresGruposEtnicos,
                        ),
                        const SizedBox(height: 16),
                        GeneralInfoCard(
                          title: "Idioma oficial",
                          content: country.idiomaOficial,
                        ),
                        const SizedBox(height: 16),
                        GeneralInfoCard(
                          title: "Idiomas totais",
                          content: country.totalIdiomas,
                        ),
                        const SizedBox(height: 16),
                        GeneralInfoCard(
                          title: "Posição perseguição 2024",
                          content: country.posicaoPerseguicao,
                        ),
                        const SizedBox(height: 16),
                        GeneralInfoCard(
                          title: "Economia",
                          content: country.economia,
                        ),
                        const SizedBox(height: 16),
                        GeneralInfoCard(
                          title: "Política",
                          content: country.politica,
                        ),
                        const SizedBox(height: 16),
                        PrayingCard(
                          pedidosOracao: country.pedidosOracao,
                        ),
                        const SizedBox(height: 16),
                        GeneralInfoCard(
                          title: "Fonte",
                          content: country.fonte,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        bloc.add(BackToStartEvent());
                      },
                      child: const Text("Voltar para início"),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        bloc.add(PrayedEvent());
                      },
                      child: const Text("Já orei"),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
