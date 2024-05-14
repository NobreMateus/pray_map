import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_event.dart';
import 'package:map_study/select_country/widgets/definitios.dart';

class SearchCountryWidget extends StatelessWidget {
  const SearchCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectCountrBloc>();
    return Center(
        child: Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width > 500 ? 500 : double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const Spacer(),
          const Text(
            "Encontre um país para orar",
            style: titleStyle,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                bloc.add(PerformSelectCountryEvent());
              },
              child: const Text("Encontrar"),
            ),
          ),
          const Spacer(),
        ]),
      ),
    ));
  }
}
