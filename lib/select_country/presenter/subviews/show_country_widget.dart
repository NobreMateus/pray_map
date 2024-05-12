import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_study/domain/country_data.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_event.dart';

class ShowCountryWidget extends StatelessWidget {
  final CountryData country;

  const ShowCountryWidget({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectCountrBloc>();
    return Column(
      children: [
        const SizedBox(height: 24),
        Center(
          child: Text(
            country.nomePt,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            bloc.add(PrayedEvent());
          },
          child: const Text("Já orei"),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            bloc.add(BackToStartEvent());
          },
          child: const Text("Voltar para início"),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
