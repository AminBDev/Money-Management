import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management/models/money.dart';
import '../Helper/Colors.dart';



class MyListMoney extends StatelessWidget {
  final int index;
  final Money mony;
  NumberFormat formatter = NumberFormat('#,###');

  MyListMoney(
      {Key? key,
        required this.height,
        required this.width,
        required this.index,
        required this.mony})
      : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    int numberPrice = int.parse(mony.price);
    return Padding(
      padding:
      const EdgeInsets.only(left: 18.0, top: 10, right: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "تومان ",
                style: TextStyle(
                    color: mony.isreceived ? GreenColor : RedColor,
                    fontFamily: 'Vazir',
                    fontSize: 14),
              ),
              Text(
                formatter.format(numberPrice).toString(),
                style: TextStyle(
                  color: mony.isreceived ? GreenColor : RedColor,
                  fontSize: 14,
                  fontFamily: 'Vazir',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    mony.titel,
                    style: const TextStyle(fontSize: 15, fontFamily: 'Vazir'),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    mony.date,
                    style: const TextStyle(color: Colors.grey, fontFamily: 'Vazir'),
                  )
                ],
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    color: mony.isreceived
                        ? GreenColor.withOpacity(0.8)
                        : RedColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(mony.isreceived ? Icons.add : Icons.remove,
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}