import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/core/models/migrations.dart';
import 'package:inventory_stack/ui/components/divider.dart';
import 'package:inventory_stack/ui/components/icon_duotone.dart';
import 'package:inventory_stack/utils/icons.dart';

class MigrationListElement extends StatelessWidget {
  final bool title;
  final MigrationsData data;

  const MigrationListElement({Key? key, required this.data, this.title = true}) : super(key: key);
  
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
              child: Text(data.item?.name ?? data.uuid, style: CupertinoTheme.of(context).textTheme.actionTextStyle,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title) IconDuotone(icon: data.item?.type?.icon),
                  if (title)const SizedBox(width: 15,),
                  Column(children: [
                    Row(children: [Text(data.from?.name ?? data.fromUuid ,style: CupertinoTheme.of(context).textTheme.textStyle),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: MigrationIcons.right,
                    ),
                    Text(data.to?.name ?? data.toUuid, style: CupertinoTheme.of(context).textTheme.textStyle),],)
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