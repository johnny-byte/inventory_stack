import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/place/place_bloc.dart';
import 'package:inventory_stack/core/logic/theme/theme_cubit.dart';

class BlocWrapper extends StatelessWidget {
  const BlocWrapper({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: true, create: (_)=>ThemeCubit()),
        BlocProvider(lazy: true, create: (_)=>PlaceBloc()),
      ],
      child: child!,
    );
  }
}