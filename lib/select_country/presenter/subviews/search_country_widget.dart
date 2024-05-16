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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              "Encontre um país para orar",
              style: titleStyle,
            ),
            const SizedBox(height: 16),
            const Text(
              "1) Sorteie um país para orar no ícone abaixo;",
              style: commomTextStyle,
            ),
            const SizedBox(height: 8),
            const Text(
              "2) Leia as informações e os pedidos de oração;",
              style: commomTextStyle,
            ),
            const SizedBox(height: 8),
            const Text(
              "3) Ore pelo país no lugar onde você estiver ou visite a nossa sala de oração;",
              style: commomTextStyle,
            ),
            const SizedBox(height: 8),
            const Text(
              "4) Conclua a oração, para que o país fique colorido no mapa!",
              style: commomTextStyle,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  bloc.add(PerformSelectCountryEvent());
                },
                child: const Text("SORTEAR UM PAÍS"),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
