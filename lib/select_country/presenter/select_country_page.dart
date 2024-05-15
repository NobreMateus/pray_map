import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_study/domain/use_cases/get_pray_country_use_case/get_pray_country_use_case_impl.dart';
import 'package:map_study/domain/use_cases/pray_for_country_use_case/pray_for_country_use_case_impl.dart';
import 'package:map_study/select_country/data/select_country_repository.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_bloc.dart';
import 'package:map_study/select_country/presenter/bloc/select_country_state.dart';
import 'package:map_study/select_country/presenter/subviews/loading_country_widget.dart';
import 'package:map_study/select_country/presenter/subviews/show_country_widget.dart';
import 'package:map_study/select_country/presenter/subviews/search_country_widget.dart';

class SelectCountryPage extends StatefulWidget {
  const SelectCountryPage({super.key});

  @override
  State<SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  final _repository = SelectCountryRepositoryImp();
  late final _bloc = SelectCountrBloc(
    getPrayCountryUseCase: GetPrayCountryUseCaseImpl(
      repository: _repository,
    ),
    prayForCountryUseCase: PrayForCountryUseCaseImpl(
      repository: _repository,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: BlocProvider(
        create: (_) => _bloc,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width > 500 ? 500 : double.infinity,
            child: BlocBuilder<SelectCountrBloc, SelectCountryState>(builder: (context, state) {
              if (state is SelectCountrySearchState) {
                return const SearchCountryWidget();
              }
              if (state is SelectCountryLoadingState) {
                return LoadingCountryWidget(
                  text: state.message,
                );
              }
              if (state is SelectCountryShowCountryState) {
                return ShowCountryWidget(
                  country: state.country,
                );
              }
              return const SizedBox();
            }),
          ),
        ),
      ),
    );
  }
}
