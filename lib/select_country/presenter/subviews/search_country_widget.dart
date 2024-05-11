import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_event.dart';

class SearchCountryWidget extends StatelessWidget {
  const SearchCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectCountrBloc>();
    return Center(
        child: Column(children: [
      const Text("Search Country"),
      ElevatedButton(
        onPressed: () {
          bloc.add(PerformSelectCountryEvent());
        },
        child: const Text("Clique para pegar um país para orar"),
      ),
    ]));
  }
}
