import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_study/domain/country_data.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_event.dart';
import 'package:map_study/select_country/widgets/general_info_card.dart';
import 'package:map_study/select_country/widgets/main_country_info_card.dart';
import 'package:map_study/select_country/widgets/number_info_card.dart';
import 'package:map_study/select_country/widgets/praying_card.dart';

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
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    const SizedBox(height: 24),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 450,
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
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          MainCountryInfoCard(
                            capital: country.capital,
                            country: country.nomePt,
                            population: country.totalPopulacao,
                            continent: country.continente,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: (constraints.maxWidth / 2) - 8,
                                child: NumberInfoCard(
                                  number: country.cristaos,
                                  unity: "",
                                  info: "Cristãos",
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: (constraints.maxWidth / 2) - 8,
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
                      child: ElevatedButton(
                        onPressed: () {
                          bloc.add(PrayedEvent());
                        },
                        child: const Text("Já orei"),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          bloc.add(BackToStartEvent());
                        },
                        child: const Text("Voltar para início"),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
