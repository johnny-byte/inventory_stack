import 'package:flutter/cupertino.dart';
import 'package:inventory_stack/utils/icons.dart';

class NotFountElements extends StatelessWidget {
  const NotFountElements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(
          [
            Center(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: 600, minWidth: 300),
                  child: Column(
                    children: [
                      MigrationIcons.search,
                      Text("Ничего не найдено",
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .tabLabelTextStyle)
                    ],
                  )),
            )
          ],
        ),
      );
  }
}