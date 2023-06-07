import 'package:flutter/material.dart';
import 'package:money_management/ui/Helper/colors.dart';
import 'package:money_management/ui/widgets/chart_bar_widget.dart';
import 'package:money_management/ui/widgets/pie_chart_widget.dart';
import 'package:money_management/utils/statistics.dart';



class InfoScreen extends StatelessWidget {

  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var  height = MediaQuery.of(context).size.height;
     var width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
           body: SingleChildScrollView(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 12 , right: 12 , top: 15),
                   child: Container(
                     height: 300,
                     decoration: BoxDecoration(
                       color: Colors.grey.shade200,
                       borderRadius: BorderRadius.circular(15)
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [

                         const Expanded(
                             child: PieWidget()),
                         Padding(
                           padding: const EdgeInsets.only(right: 18.0 , top: 10),
                           child: Column(
                             children: [
                               TitelWidget(titel: 'دریافتی روز' , price: Statistics.Dday().toString() , color: Purple),
                               SizedBox(height: height* .02,),
                               TitelWidget(titel: 'پرداختی روز' , price: Statistics.Pday().toString() , color: Oreng),
                               SizedBox(height: height* .02,),
                               TitelWidget(titel: 'دریافتی ماه' , price: Statistics.Dmonth().toString() , color: Pink),
                               SizedBox(height: height* .02,),
                               TitelWidget(titel: 'پرداختی ماه' , price: Statistics.Pmonth().toString() , color: Red),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 12 , right: 12 , top: 15),
                   child: Container(
                     height: 300,
                     decoration: BoxDecoration(
                         color: Colors.grey.shade200,
                         borderRadius: BorderRadius.circular(15)
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: const [

                         Expanded(
                             child:  BarChartWidget()),

                       ],
                     ),
                   ),
                 ),

               ],
             ),
           )

      ),
    );
  }
}



class TitelWidget extends StatelessWidget {
  TitelWidget({super.key , required this.titel , required this.color , required this.price});
  String titel;
  Color color;
  String price;
  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(titel  , style: const TextStyle(

                  fontSize: 20
                ),),
              ),
              Container(
                   height: 10,
                   width: 10,
                   decoration: BoxDecoration(
                   color: color,
                   shape: BoxShape.circle,
        ),
      ),
            ],

          ),
            Padding(
                padding: const EdgeInsets.only(right: 17),
                child: Text(price , style: const TextStyle(
                  fontFamily: 'Vazir',
                  color: Colors.black54
                ),),
              ),
        ],
      );

  }
}