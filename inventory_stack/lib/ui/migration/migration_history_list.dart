import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/core/models/migrations.dart';
import 'package:inventory_stack/ui/migration/migration_history_element.dart';

class MigrationHistory extends StatelessWidget {
  final List<MigrationsData> list; 

  const MigrationHistory({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: const [Text("Последние миграции: ")],
          ),
        ),
        list.isEmpty
        ? const Expanded(
            child: Center(
              child: Text("Элементы не найдеты"),
            ),
          )
        : Expanded(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return MigrationListElement(data: list[index],);
                }),
          ),
      ],
    ));
  }
}