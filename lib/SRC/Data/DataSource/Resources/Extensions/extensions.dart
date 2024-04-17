

import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/strings.dart';

extension CustomSizedBoxExt on num {
  SizedBox get x => SizedBox(width: toDouble());

  SizedBox get y => SizedBox(height: toDouble());
}
extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, file, unknown }

// extension OfficeTimingsExtension on String {
//   List<String> getOfficeTimings(String season) {
//     // "Office Timing: Summer  (10:00am  08:00pm), Winter  (10:00am  07:00pm)"
//     final seasonSplit = season.split("Office Timing:");
//
//     final seasonSplit2 = seasonSplit[1].split(",");
//
//     final summer = seasonSplit2[0].split("Summer")[1];
//
//     final winter = seasonSplit2[1].split("Winter")[1];
//
//     return [summer, winter];
//   }
// }
//
// extension date on DateTime {
//   ///Example:
//   ///Convert 2023-5-9 21:12:23:000Z to 9,May 2023
//
//   String get toPkDate {
//     int day = this.day;
//     var monthNames = [
//       " ",
//       "Jan",
//       "Feb",
//       "Mar",
//       "Apr",
//       "May",
//       "Jun",
//       "Jul",
//       "Aug",
//       "Sep",
//       "Oct",
//       "Nov",
//       "Dec"
//     ];
//     return "${day} ${monthNames[this.month]}, ${this.year}";
//   }
//
//   ///Example:
//   ///Convert 2023-5-9 21:12:23:000Z to 9:12:23 PM
//   String get toPkTime {
//     int hour = this.hour;
//     int minute = this.minute;
//     int sec = this.second;
//
//     String formattedTime = DateFormat('h:mm a').format(this);
//
//     return formattedTime;
//   }
//
//   ///Example:
//   ///Convert 2023-5-9 21:12:23:000Z to 9:12 PM
//   String get toHourAndMinutes {
//     int hour = this.hour;
//     int minute = this.minute;
//
//     String formattedTime =
//         DateFormat('h:mm a').format(DateTime(2022, 1, 1, hour, minute));
//
//     List<String> parts = formattedTime.split(' ');
//     String timePart = parts[0]; // Contains the time part (hour:minute)
//     String ampmPart = parts[1]; // Contains the AM/PM part
//
//     // Split the time part into hour and minute
//     List<String> timeParts = timePart.split(':');
//     int formattedHour = int.parse(timeParts[0]);
//     int formattedMinute = int.parse(timeParts[1]);
//
//     // Apply formatting logic
//     String finalHour =
//         formattedHour < 10 ? '0$formattedHour' : '$formattedHour';
//     String finalMinute =
//         formattedMinute < 10 ? '0$formattedMinute' : '$formattedMinute';
//
//     return "$finalHour:$finalMinute $ampmPart";
//   }
//
//   String timeAgo({bool numericDates = true}) {
//     final now = DateTime.now();
//     final difference = now.difference(this);
//
//     if (difference.inDays >= 365) {
//       final years = (difference.inDays / 365).floor();
//       return '$years year${years > 1 ? 's' : ''} ago';
//     } else if (difference.inDays >= 30) {
//       final months = (difference.inDays / 30).floor();
//       return '$months month${months > 1 ? 's' : ''} ago';
//     } else if (difference.inDays >= 1) {
//       return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
//     } else if (difference.inHours >= 1) {
//       return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
//     } else if (difference.inMinutes >= 2) {
//       return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
//     } else {
//       return 'Just now';
//     }
//   }
//
//   String get humanReadableDate {
//     //print("object");
//     return intl.DateFormat('yyyy-MM-dd').format(this);
//   }
//
//   String get weekName {
//     return DateFormat('EEEE').format(this);
//   }
//
//   DateTime get nowTypeFormatData {
//     DateFormat outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
//
//     String formattedDate = outputFormat.format(this);
//
//     return DateTime.parse(formattedDate);
//   }
// }
//
// extension str on String {
//   String get readableTime {
//     DateTime dateTime = DateTime.parse(this);
//     String timeString = DateFormat.Hm().format(dateTime);
//     return timeString;
//   }
// }

extension StringExt2 on int {
  // String getMonthName(bool isJalali){
  //   if(isJalali)
  //     return this.jalaliMonthName;
  //   else
  //     return this.gregorianMonthName;
  // }

  String get jalaliMonthName {
    switch (this) {
      case 1:
        return "فروردین";
        break;
      case 2:
        return "اردیبهشت";
        break;
      case 3:
        return "خرداد";
        break;
      case 4:
        return "تیر";
        break;
      case 5:
        return "مرداد";
        break;
      case 6:
        return "شهریور";
        break;
      case 7:
        return "مهر";
        break;
      case 8:
        return "آبان";
        break;
      case 9:
        return "آذر";
        break;
      case 10:
        return "دی";
        break;
      case 11:
        return "بهمن";
        break;
      case 12:
        return "اسفند";
        break;
      default:
        return '$this';
        break;
    }
  }

  String get englishName {
    switch (this) {
      case 1:
        return "Jan";
        break;
      case 2:
        return "Feb";
        break;
      case 3:
        return "March";
        break;
      case 4:
        return "April";
        break;
      case 5:
        return "May";
        break;
      case 6:
        return "June";
        break;
      case 7:
        return "July";
        break;
      case 8:
        return "Aug";
        break;
      case 9:
        return "Sep";
        break;
      case 10:
        return "Oct";
        break;
      case 11:
        return "Nov";
        break;
      case 12:
        return "Dec";
        break;
      default:
        return '$this';
        break;
    }
  }
}
extension PaddingExtension on Widget {
  Widget pad(EdgeInsets padding) => Padding(padding: padding, child: this);
  Widget padAll(double value) => pad(EdgeInsets.all(value));
  Widget padHorizontal(double value) => pad(EdgeInsets.symmetric(horizontal: value));
  Widget padVertical(double value) => pad(EdgeInsets.symmetric(vertical: value));
}
extension GestureExtension on Widget {

  Widget  onTapped({required void Function() onTap})=>GestureDetector(onTap: onTap,child: this,);

  // Double tap gesture
  Widget onDoubleTapped({required void Function() onDoubleTap}) =>
      GestureDetector(
        onDoubleTap: onDoubleTap,
        child: this,
      );

  // Long press gesture
  Widget onLongPress({required void Function() onLongPress}) =>
      GestureDetector(
        onLongPress: onLongPress,
        child: this,
      );

  // Drag gesture
  Widget onDrag({required void Function(DragStartDetails details) onDrag}) =>
      GestureDetector(
        onPanStart: onDrag,
        child: this,
      );

  // Drag update gesture (for tracking drag movement)
  Widget onDragUpdate(
      {required void Function(DragUpdateDetails details) onDragUpdate}) =>
      GestureDetector(
        onPanUpdate: onDragUpdate,
        child: this,
      );

  // Drag end gesture
  Widget onDragEnd({required void Function(DragEndDetails details) onDragEnd}) =>
      GestureDetector(
        onPanEnd: onDragEnd,
        child: this,
      );


}
extension MarginExtension on Widget {
  Widget withMargin(EdgeInsets margin) => Container(
    margin: margin,
    child: this,
  );
  Widget marginAll(double value) => withMargin(EdgeInsets.all(value));
  Widget marginHorizontal(double value) => withMargin(EdgeInsets.symmetric(horizontal: value));
  Widget marginVertical(double value) => withMargin(EdgeInsets.symmetric(vertical: value));
}
extension TextExtension on String {
  AppText toText({TextStyle? style,BuildContext? context}) => AppText(this, style: style??Styles.circularStdRegular(context!));
}
extension ContainerSizeExtension on num {
 // Container get cH => sized(height: toDouble());
  //Container get cW => sized(width: toDouble());

  Container cH({
    double? width,
    double? height,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Border? border,
    Decoration? decoration,
    Widget? child,
  
  
  }
 
  
  ) {
    return Container(
      width: width ?? toDouble(),
      height: height ?? toDouble(),
      color: color,
      margin: margin,
      padding: padding,
      decoration: decoration,
      child: child,
    );
  }
}


class testingextensions extends StatelessWidget {
  const testingextensions({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [

      AppStrings.welcome.toText(context: context).marginAll(30).onTapped(onTap: (){

      }),
      


    ],);
  }
}





