import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/ui/items/items.dart';
import 'package:inventory_stack/ui/migration/migration.dart';
import 'package:inventory_stack/ui/places/places.dart';
import 'package:inventory_stack/ui/settings/settings.dart';
import 'package:inventory_stack/utils/icons.dart';
import 'package:provider/src/provider.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Key migrationPageKey =  GlobalKey();
  final Key itemsPageKey =  GlobalKey();
  final Key placePageKey =  GlobalKey();
  final Key settingsPageKey =  GlobalKey();

  Widget getBody(int index, BuildContext context){
    switch (index) {
      case 0:
        return MigrationsPage(key: migrationPageKey,);
      case 1:
        return ItemsPage(key: itemsPageKey,);
      case 2:
        return PlacePage(key: placePageKey,);
      case 3:
        return SettingsPage(key: settingsPageKey,);
      default:
        return MigrationsPage(key: migrationPageKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: MigrationIcons.migrationInActive,
                    activeIcon: MigrationIcons.migrationActive,
                    label: "Миграции",
                    ),
                BottomNavigationBarItem(
                   icon: MigrationIcons.itemsInActive,
                    activeIcon: MigrationIcons.itemsActive, 
                    label: "Элементы"),
                BottomNavigationBarItem(
                    icon: MigrationIcons.placesInActive,
                    activeIcon: MigrationIcons.placesActive,
                     label: "Места"),
                BottomNavigationBarItem(
                  icon: MigrationIcons.settingsInActive,
                    activeIcon: MigrationIcons.settingsActive,
                  label: "Настройки",
                ),
              ],
            ),
            tabBuilder: (BuildContext context, int index) {
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return getBody(index, context);
                },
              );
            },
          );
    }
}

