
import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/ui/items/items.dart';
import 'package:inventory_stack/ui/migration/migration.dart';
import 'package:inventory_stack/ui/places/places.dart';
import 'package:inventory_stack/ui/settings/settings.dart';
import 'package:inventory_stack/utils/icons.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Widget getBody(index){
    switch (index) {
      case 0:
        return MigrationsPage();
      case 1:
        return const ItemsPage();
      case 2:
        return PlacePage();
      case 3:
        return const SettingsPage();
      default:
        return MigrationsPage();
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
                  return getBody(index);
                },
              );
            },
          );
    }
}

