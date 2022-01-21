import 'package:flutter/cupertino.dart';

class MigrationsPage extends StatelessWidget {
  const MigrationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('MigrationsPage'),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: const Center(
                  child: Text("MigrationsPage"),
                )),
          ),
        ));
  }
}