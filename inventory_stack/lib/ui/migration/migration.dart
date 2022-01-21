import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_stack/core/logic/theme/theme_cubit.dart';
import 'package:inventory_stack/ui/components/search_box.dart';
import 'package:inventory_stack/utils/icons.dart';
import 'package:provider/src/provider.dart';

class MigrationsPage extends StatelessWidget {
   MigrationsPage({Key? key}) : super(key: key);

  final bool isLoad = false;
  final List<String> list = ["hello", "world"];
  final bool isHistory = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Миграции'),
          trailing: Tooltip(
            message: "Сменить тему",
            child: GestureDetector(onTap: () { 
              context.read<ThemeCubit>().swithTheme();
             },
            child: context.read<ThemeCubit>().repository.isDark ? MigrationIcons.darkTheme : MigrationIcons.lightTheme,),
          )
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(children: [
                  SearchBox(),
                   if (isLoad) const Expanded(child: Center(child: CupertinoActivityIndicator())),
                   if (!isLoad && !isHistory) Expanded(child: list.isEmpty ? const Center(child: Text("Ничего не найдено"),) : 
                   ListView.builder(
                     itemCount: list.length,
                     itemBuilder: (context, index)=>const MigrationListElement()) 
                   ),
                   if(isHistory) Expanded(child: MigrationHistory())
                ],)),
          ),
        ));
  }
}

class MigrationListElement extends StatelessWidget {
  final bool title;

  const MigrationListElement({Key? key, this.title = true}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: title ? 110 : 65,
        color: CupertinoTheme.of(context).barBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title) Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text("NAME", style: CupertinoTheme.of(context).textTheme.actionTextStyle,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title) const Text("whith title"),
                  if (title)const SizedBox(width: 15,),
                  Column(children: [
                    Row(children: [Text("from title" ,style: CupertinoTheme.of(context).textTheme.textStyle),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: MigrationIcons.right,
                    ),
                    Text("to tile", style: CupertinoTheme.of(context).textTheme.textStyle),],)
                  ],),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "data",
                        style: CupertinoTheme.of(context).textTheme.textStyle,
                      ),
                      Text("data 2",
                          style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            const CustomDivider(),
          ],
        ),
    );
  }
}


class MigrationHistory extends StatelessWidget {
  final List<String> migration = ["hello", "world"];

  MigrationHistory({Key? key,}) : super(key: key);
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
        migration.isEmpty
        ? const Expanded(
            child: Center(
              child: Text("Элементы не найдеты"),
            ),
          )
        : Expanded(
            child: ListView.builder(
                itemCount: migration.length,
                itemBuilder: (context, index) {
                  return const MigrationListElement(
                    
                  );
                }),
          ),
      ],
    ));
  }
}


class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
    );
  }
}