import 'package:flutter/cupertino.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('PlacePage'),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: const Center(
                  child: Text("PlacePage"),
                )),
          ),
        ));
  }
}
