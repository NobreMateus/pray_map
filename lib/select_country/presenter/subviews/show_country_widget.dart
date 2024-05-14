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
  final CountryData country = CountryData(
    nomeEn: "South Africa",
    nomePt: "África do Sul",
    linkBandeira: "https://flagcdn.com/w320/za.png",
    capital: "Cidade do Cabo",
    continente: "África",
    totalPopulacao: "50,5 milhões",
    cristaos: "38 milhões",
    cristaosEvangelicos: "10,6 milhões",
    maiorReligiao: "Cristã",
    religiaoMaisCresce: "Sem religião",
    maioresGruposEtnicos:
        "Nguni (46,4%), sotho-tswana (24,3%), brancos/caucasianos (8,9%), negros/mestiços (8,9%), asiáticos (2,8%).",
    idiomaOficial:
        "11 idiomas (todos os principais idiomas étnicos). O inglês e o africâner são os idiomas da educação superior.",
    totalIdiomas: "40",
    economia:
        "País mais rico e industrializado da África. Agricultura com base forte, grnades depósitos de ouro, platina e cromo. Desemprego alto, com enorme sepração entre ricos e pobres. A corrupção e o impacto da aids limitam o progresso. Muitos profissionais e camponeses brancos estão deixando o país.",
    politica:
        "União da África do Sul formada em 1910. República parlamentarista (minoria branca) criada em 1961. O apartheid limitou os direitos políticos e econômicos dos não brancos e trouxe grande dor e sofrimento à maioria. Em 1994 foram realizadas eleições nacionais democráticas. O governo de Nelson Mandela esforçou-se bastante por um governo livre e não racial, e deu inicio ao grande proceso de cura com algum sucesso. Os governos e os líderes depois de Mandela desapontaram a muitos.",
    pedidosOracao:
        "Ore pelas inúmeras agências cristãs que atuam no país; Ore por todos que estão no governo e na liderança; Ore pelos desafios do cristianismo; Ore pelos grupos étnicos e religiosos (mulçumanos, hindus e imigrantes do leste asiático) ;"
            .split(";"),
    posicaoPerseguicao: "-",
    fonte:
        "foMandryk, Jason; Molly Wall (org.). Ore pelas nações: um guia completo de missões e intercessão pelo mundo. 1° ed. São Paulo: Mundo Cristão, 2017. [Trad. de Emirson Justino]nte",
  );

  ShowCountryWidget({
    super.key,
    // required this.country,
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
            width: 500,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 450,
                          child: Image.network(
                            country.linkBandeira,
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
                              width: 236,
                              child: NumberInfoCard(
                                number: country.cristaos.split(" ")[0],
                                unity: country.cristaos.split(" ")[1],
                                info: "cristãos",
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 236,
                              child: NumberInfoCard(
                                number: country.cristaosEvangelicos.split(" ")[0],
                                unity: country.cristaosEvangelicos.split(" ")[1],
                                info: "cristãos evangélicos",
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
