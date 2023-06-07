import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management/UI/Helper/Colors.dart';
import 'package:money_management/ui/widgets/my_text_field_widget.dart';
import 'package:money_management/models/money.dart';
import 'package:money_management/ui/screens/home_screen.dart';
import 'package:money_management/ui/widgets/snack_bar_widget.dart';
import  'package:persian_datetime_picker/persian_datetime_picker.dart';

//
String year = Jalali.now().year.toString();
String month = Jalali.now().month.toString().length  == 1 ? '0${Jalali.now().month.toString()}' :  Jalali.now().month.toString();
String day = Jalali.now().day.toString().length  == 1 ? '0${Jalali.now().day.toString()}' :  Jalali.now().day.toString();
var defultDate = '$year/$month/$day';
//
//
//
class TransactionsScreen extends StatefulWidget {

  const TransactionsScreen({Key? key }) : super(key: key);

  static  int groupId = 0;
  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController priceController = TextEditingController();
  static bool isEditing = false;
  static int index = 0;
  static String  date = defultDate;

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {

  Box<Money> hiveBox = Hive.box<Money>("MoneyBox");
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {



    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
     String hintText;
    return  Scaffold(
      body: Center(
        child:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  TransactionsScreen.isEditing ? "ویرایش تراکنش" : "ثبت تراکنش"
                  , style: const TextStyle(
                  fontSize: 30,
                  fontFamily: "Vazir",
                ),
                ),

                SizedBox(height: height * 0.03,),
                //! TextField Description
                 Form(
                   key: _formKey,
                   child: const MyTextFieldWidget(),
                 ),

                SizedBox(height: height * 0.03,),
                //! TextField Amount


                SizedBox(height: height * 0.03,),


                      Padding(
                        padding: const EdgeInsets.only(left:30 , right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            //! Radio Bottom
                            Radio(
                              activeColor: BlueColor,
                           value: 1,
                           groupValue:  TransactionsScreen.groupId,
                           onChanged: (value){
                             setState(() {
                               TransactionsScreen.groupId = value!;
                             });
                           }

                   ),
                            const Text('پرداخت کردم',

                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize: 15

                              ),

                            ),

                            //! Radio Bottom
                            Radio(
                                activeColor: BlueColor,
                                value: 2,
                                groupValue: TransactionsScreen.groupId,
                                onChanged: (value){
                                  setState(() {
                                    TransactionsScreen.groupId = value!;



                                  });
                                }
                            ),
                            const Text('دریافت کردم' , style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 15

                            ),
                            ),




                          ]
                        ),
                      ),

                SizedBox(height: height * 0.03,),

                SizedBox(
                  width: width * 0.9,
                  height:60,
                  child: OutlinedButton(

                    style: OutlinedButton.styleFrom(
                      foregroundColor: BlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),

                      )
                    ),
                      //! set date
                      onPressed: () async {
                      var pikeDate = await showPersianDatePicker(
                          context: context,
                          initialDate: Jalali.now(),
                          firstDate: Jalali(1402),
                          lastDate: Jalali(1403),
                      );
                      setState(() {
                       String year  =   pikeDate!.year.toString();
                       String month =   pikeDate.month.toString().length == 1 ? '0${pikeDate.month.toString()}' :  pikeDate.month.toString();
                       String day   =   pikeDate.day.toString().length == 1 ? '0${pikeDate.day.toString()}' :  pikeDate.day.toString();
                       TransactionsScreen.date = '$year/$month/$day';
                      });
                      },

                      child: Text(
                          TransactionsScreen.date,
                        style: const TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 15,
                          color: BlueColor

                        ),
                      )),
                ),
                SizedBox(height: height * 0.03,),


                //! Bottom Add & Bottom Editing
                SizedBox(
                  width: width * 0.9,
                  height:60,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: BlueColor,

                      shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15)
                      )

                    ),

                      onPressed: (){

                          Money item = Money(
                            Random().nextInt(9999),
                            TransactionsScreen.priceController.text,
                            TransactionsScreen.descriptionController.text,
                            TransactionsScreen.date,
                            TransactionsScreen.groupId == 1 ? false : true,
                          );





                          if (_formKey.currentState!.validate()) {


                            // TODO submit
                            if(TransactionsScreen.isEditing){

                              hiveBox.putAt(TransactionsScreen.index, item);
                              // HomePage.moneys[TransactionsScreen.index] = item;


                            }else{
                              HomePage.moneys.add(item);

                              hiveBox.add(item);

                            }


                            Navigator.pop(context);
                          }

                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: SnackBarWidget(iconColor: const Color(0xff8f1021), backgroundColor: const Color(0xffc72c41)),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            );
                          }
                      },
                      child: Text(
                        TransactionsScreen.isEditing ? "ویرایش کردن" : "اضافه کردن"
                        , style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Vazir",
                      ),
                      ),
                  ),
                )







              ],
            ),
        ),

      ),
    );
  }
}

