import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orar_pelos_paises/select_country/presenter/bloc/select_country_bloc.dart';
import 'package:orar_pelos_paises/select_country/presenter/bloc/select_country_event.dart';
import 'package:orar_pelos_paises/select_country/widgets/definitios.dart';

class CongratsWidget extends StatelessWidget {
  const CongratsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectCountrBloc>();
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const SizedBox(height: 24),
          const SelectableText(
            "Obrigado por orar conosco!",
            style: titleStyle,
          ),
          const SizedBox(height: 12),
          const SelectableText(
            "O país pelo qual você orou já está colorido no nosso mapa.",
            style: commomTextStyle,
          ),
          const SizedBox(height: 12),
          const SelectableText(
            "Seja um mobilizador hoje e convide outras pessoas a se unirem a esse propósito!",
            style: commomTextStyle,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: () {
                bloc.add(BackToStartEvent());
              },
              child: const Text("VOLTAR PARA INÍCIO"),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              child: const Text("VER MAPA"),
            ),
          ),
        ]),
      ),
    );
  }
}
