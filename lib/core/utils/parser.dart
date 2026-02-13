abstract class Parser {
  static String formatDateDDMMAA(DateTime date) {
    final day = date.day.toString();
    final month = date.month;
    var shortMonthLiteral = "";
    switch (month) {
      case 1:
        shortMonthLiteral = "Ene";
        break;
      case 2:
        shortMonthLiteral = "Feb";
        break;
      case 3:
        shortMonthLiteral = "Mar";
        break;
      case 4:
        shortMonthLiteral = "Abr";
        break;
      case 5:
        shortMonthLiteral = "May";
        break;
      case 6:
        shortMonthLiteral = "Jun";
        break;
      case 7:
        shortMonthLiteral = "Jul";
        break;
      case 8:
        shortMonthLiteral = "Ago";
        break;
      case 9:
        shortMonthLiteral = "Sep";
        break;
      case 10:
        shortMonthLiteral = "Oct";
        break;
      case 11:
        shortMonthLiteral = "Nov";
        break;
      case 12:
        shortMonthLiteral = "Dic";
        break;
      default:
        shortMonthLiteral = "";
        break;
    }
    return "$day $shortMonthLiteral. ${date.year}";
  }
}
