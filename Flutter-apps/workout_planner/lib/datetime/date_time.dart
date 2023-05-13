//returns todays date as yymmdd
String todaysDateYYYYMMDD() {
  var dateTimeObject = DateTime.now();

  String year = dateTimeObject.year.toString();
  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  String day = dateTimeObject.day.toString();

  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

//converts string yymmdd to datetimeobject

DateTime createDateTimeObject(String yyyymmdd) {
  //takes the string and converts to int
  var year = int.parse(yyyymmdd.substring(0, 4));
  var month = int.parse(yyyymmdd.substring(4, 6));
  var day = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTimeObject = DateTime(year, month, day);
  return dateTimeObject;
}

// converts datetimeobject to string yymmdd

String dateTimeString(DateTime dateTimeObject) {
  var year = dateTimeObject.year.toString();
  var month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }
  var day = dateTimeObject.day.toString();

  return year + month + day;
}
