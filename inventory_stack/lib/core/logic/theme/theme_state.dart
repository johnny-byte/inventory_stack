part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}


class LightTheme extends ThemeState{
  final ThemeData data =ThemeRepository.light;

  LightTheme();
}

class DarkTheme extends ThemeState{
  final ThemeData data = ThemeRepository.dark;

  DarkTheme();
}