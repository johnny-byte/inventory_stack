part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}


class LightTheme extends ThemeState{
  final CupertinoThemeData data =ThemeRepository.light;

  LightTheme();
}

class DarkTheme extends ThemeState{
  final CupertinoThemeData data = ThemeRepository.dark;

  DarkTheme();
}