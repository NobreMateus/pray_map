import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_event.dart';

class ShowCountryWidget extends StatelessWidget {
  final String country;

  const ShowCountryWidget({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectCountrBloc>();
    return Column(
      children: [
        Center(child: Text(country)),
        ElevatedButton(
          onPressed: () {
            bloc.add(BackToStartEvent());
          },
          child: const Text("Voltar para início"),
        ),
      ],
    );
  }
}
