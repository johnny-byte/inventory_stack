import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inventory_stack/config/bloc_wrapper.dart';
import 'package:inventory_stack/config/get_it_congfig.dart';
import 'package:inventory_stack/config/hive_config.dart';
import 'package:inventory_stack/core/api/api.dart';
import 'package:inventory_stack/core/logic/theme/theme_cubit.dart';

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
        ThemeData? themeData;
        if (state is DarkTheme){
          themeData = state.data;
        }
        if (state is LightTheme){
          themeData = state.data;
        }
        
        return MaterialApp(
            title: 'Flutter Demo',
            theme: themeData,
            home: App(),
          );
      }),
    );
  }
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final ApiClient apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(dotenv.get('SERVER')),
          ElevatedButton(
              onPressed: () async {
                context.read<ThemeCubit>().swithTheme();
              },
              child: const Text("swith theme")),
          ElevatedButton(
              onPressed: () async {
                var items = await apiClient.items();
                debugPrint(items.length.toString());
                items
                    .where((element) =>
                        element.type.name.toLowerCase().contains("теле"))
                    .forEach((element) {
                  debugPrint(element.name);
                });
              },
              child: const Text("get all items")),
          ElevatedButton(
              onPressed: () async {
                var items = await apiClient.places();
                debugPrint(items.length.toString());
              },
              child: const Text("get all places")),
          ElevatedButton(
              onPressed: () async {
                var items = await apiClient.typesAll();
                debugPrint(items.length.toString());
              },
              child: const Text("get all types")),
          ElevatedButton(
              onPressed: () async {
                var items = await apiClient.migrations();
                debugPrint(items.length.toString());
              },
              child: const Text("get all migrations")),
        ],
      ),
    );
  }
}
