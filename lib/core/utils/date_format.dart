import 'package:intl/intl.dart';

class CustomDateFormat {
  //Get date from string date
  DateTime getDateFromString({
    required String stringDate,
  }) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(
      stringDate,
    );

    return tempDate;
  }

  //Get a full date to 20200202 format to be compared
  String reformatDateToSingleDate({
    required DateTime date,
  }) {
    String fullDate = DateFormat('yyyyMMdd').format(date);

    return fullDate;
  }

  //Display date : Tue, Jun 4
  String getReadleDateDisplay({
    required DateTime date,
    required String dateFormat,
  }) {
    String dateDisplay = DateFormat(dateFormat).format(date);

    return dateDisplay;
  }

  //////////////////////////////////////////////
  ///Date Process
  //////////////////////////////////////////////
  String processDateToReadable({
    required String rawStringDate,
  }) {
    //Get date from the string date: 2020-02-02
    DateTime tempDate = getDateFromString(
      stringDate: rawStringDate,
    );

    //Display date : Tue, Jun 4
    String dateDisplay = getReadleDateDisplay(
      date: tempDate,
      dateFormat: 'MMM d, yyyy',
    );

    return dateDisplay;
  }

  //////////////////////////////////////////////
  ///Date Process with time
  //////////////////////////////////////////////
  String processDateTimeToReadable({
    required String rawStringDate,
  }) {
    DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm").parse(
      rawStringDate,
    );

    String dateDisplay = DateFormat('MMM d, yyyy hh:mm').format(tempDate);

    return dateDisplay;
  }
}
