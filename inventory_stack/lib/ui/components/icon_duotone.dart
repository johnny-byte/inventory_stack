import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconDuotone extends StatelessWidget {
  late final int primary;
  late final int secondary;
  IconDuotone({ Key? key, required String? icon }) : super(key: key){
    List<String> icons = icon?.split("|") ?? ["0xf059", "0x10f059"];
    primary = int.parse(icons[0]);
    secondary = int.parse(icons[1]);
  }

  @override
  Widget build(BuildContext context) {
    return FaDuotoneIcon(IconDataDuotone(primary, secondary: IconDataDuotone(secondary,)), primaryColor: CupertinoColors.systemOrange.withOpacity(0.4),
    secondaryColor: CupertinoColors.systemOrange);
  }
}