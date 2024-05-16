import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_event.dart';
import 'package:map_study/select_country/widgets/definitios.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectCountrBloc>();
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const SizedBox(height: 24),
          const Text(
            "Depois destas coisas, vi, e eis grande multidão que ninguém podia contar, de todas as nações, tribos, povos e línguas, em pé diante do trono e diante do Cordeiro, vestidos de vestes brancas, com ramos de palmeira nas mãos. (Ap. 7:9)",
            style: commomTextStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "O Senhor escolheu para si povos de todas as nações. Por isso, o mundo precisa ouvir sobre Jesus. Devemos obedecer a ordem de orar por trabalhadores. Os campos estão prontos! Que os nossos corações estejam dispostos a orar, ofertar e ir!",
            style: commomTextStyle,
          ),
          const SizedBox(height: 12),
          const Text(
            "Ajude-nos a cobrir de oração todos os países espalhados pela Terra, até que o mapa se encha de cores. Visite a nossa sala de oração!",
            style: commomTextStyle,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                bloc.add(PerformIntroStart());
              },
              child: const Text("COMECE AQUI"),
            ),
          ),
        ]),
      ),
    );
  }
}
