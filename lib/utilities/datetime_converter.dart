import 'package:intl/intl.dart';

class DateTimeConverter {
  String convertDateTimeToString(String date) {
    DateTime dateDateTime = DateTime.parse(date).add(Duration(hours: 1));
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm').format(dateDateTime);
    String formattedDate = formatter.format(dateDateTime);
    
    return formattedTime + "   " + formattedDate;
  }
}
