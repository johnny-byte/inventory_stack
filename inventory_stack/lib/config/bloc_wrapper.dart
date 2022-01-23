import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/item/item_bloc.dart';
import 'package:inventory_stack/core/logic/item/item_repository.dart';
import 'package:inventory_stack/core/logic/place/place_bloc.dart';
import 'package:inventory_stack/core/logic/place/place_repository.dart';
import 'package:inventory_stack/core/logic/theme/theme_cubit.dart';

class BlocWrapper extends StatelessWidget {
  BlocWrapper({Key? key, this.child}) : super(key: key);

  final Widget? child;

  final PlaceRepository placeRepository = PlaceRepository();
  final ItemRepository itemRepository = ItemRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: true, create: (_)=>ThemeCubit()),
        BlocProvider(lazy: true, create: (_)=>PlaceBloc(placeRepository, itemRepository)),
        BlocProvider(lazy: true, create: (_)=>ItemBloc(itemRepository)),
      ],
      child: child!,
    );
  }
}