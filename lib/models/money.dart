
import 'package:hive/hive.dart';
part 'money.g.dart';
@HiveType(typeId: 0)
class Money{
  @HiveField(1)
  int id;
  @HiveField(2)
  String price;
  @HiveField(3)
  String titel;
  @HiveField(4)
  String date;
  @HiveField(5)
  bool isreceived ;

  Money(this.id, this.price, this.titel, this.date, this.isreceived);
}