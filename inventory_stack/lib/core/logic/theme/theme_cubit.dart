import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_stack/core/logic/theme/theme_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeRepository repository;

  ThemeCubit() : repository = ThemeRepository(), super(DarkTheme());

  void swithTheme(){
    repository.swithTheme();
    emit(repository.isDark? DarkTheme() : LightTheme());
  }
}