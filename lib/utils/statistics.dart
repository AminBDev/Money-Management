
import 'package:hive/hive.dart';
import 'package:money_management/models/money.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

Box<Money> hiveBox = Hive.box<Money>("MoneyBox");



String year = Jalali.now().year.toString();
String month = Jalali.now().month.toString().length  == 1 ? '0${Jalali.now().month.toString()}' :  Jalali.now().month.toString();
String day = Jalali.now().day.toString().length  == 1 ? '0${Jalali.now().day.toString()}' :  Jalali.now().day.toString();


class Statistics{

  static String today(){
    return '$year/$month/$day';
  }



  static double Pday(){
    double result = 0;
    for(var value in hiveBox.values){
      if(value.date == today() && value.isreceived == false){
        result += double.parse(value.price);
      }
    }

    return result;

  }
  static double Dday(){
    double result = 0;
    for(var value in hiveBox.values){
      if(value.date == today() && value.isreceived == true){
        result += double.parse(value.price);
      }
    }

    return result;

  }





  static double Pmonth(){
    double result = 0;
    for(var value in hiveBox.values){
      if(value.date.substring(5 , 7) == month && value.isreceived == false){
        result += double.parse(value.price);
      }
    }

    return result;

  }

  static double Dmonth(){
    Box<Money> hiveBox = Hive.box<Money>("MoneyBox");
    double result = 0;
    for(var value in hiveBox.values){
      if(value.date.substring(5 , 7) == month && value.isreceived == true){
        result += double.parse(value.price);
      }
    }

    return result;

  }






  static double Pyear(){
    double result = 0;
    for(var value in hiveBox.values){
      if(value.date.substring(0 , 3) == year && value.isreceived == false){
        result += double.parse(value.price);
      }
    }

    return result;

  }
  static double Dyear(){
    double result = 0;
    for(var value in hiveBox.values){
      if(value.date.substring(0 , 3) == year && value.isreceived == true){
        result += double.parse(value.price);
      }
    }

    return result;

  }



}