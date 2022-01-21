import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Migration App", style: CupertinoTheme.of(context).textTheme.actionTextStyle),
                    const Padding(padding:  EdgeInsets.all(15.0), child: CupertinoActivityIndicator())
                ],),
              ));
  }
}