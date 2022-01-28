import 'package:intl/intl.dart';

String getDateString(DateTime date){
  final DateFormat formatter = DateFormat('dd.MM.yy');
  return formatter.format(date.toLocal());
}

String getTimeString(DateTime date){
  final DateFormat formatter = DateFormat('HH:mm');
  return formatter.format(date.toLocal());
}