import 'package:flutter/cupertino.dart';

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