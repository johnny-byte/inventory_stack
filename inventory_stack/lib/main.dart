import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inventory_stack/config/bloc_wrapper.dart';
import 'package:inventory_stack/config/get_it_congfig.dart';
import 'package:inventory_stack/config/hive_config.dart';
import 'package:inventory_stack/core/logic/theme/theme_cubit.dart';
import 'package:inventory_stack/ui/app.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await HiveConfig.init();
  await getItSetup();
  runApp(const AppRunner());
}

class AppRunner extends StatelessWidget {
  const AppRunner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocWrapper(
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        CupertinoThemeData? themeData;
        if (state is DarkTheme){
          themeData = state.data;
        }
        if (state is LightTheme){
          themeData = state.data;
        }

        return CupertinoApp(
            title: 'Flutter Demo',
            theme: themeData,
            home: const App(),
          );
      }),
    );
  }
}
