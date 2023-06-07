import 'package:flutter/material.dart';
import 'package:money_management/UI/Helper/Colors.dart';
import 'package:money_management/ui/screens/transactions_screen.dart';

class MyTextFieldWidget extends StatelessWidget {
  const MyTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: width * 0.9 ,
          child: TextFormField(
            textAlign: TextAlign.right,
            validator: (value) {
              if (value == null || value.isEmpty ) {
                return '';
              }
              return null;
            },
            controller: TransactionsScreen.descriptionController ,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: BlueColor,

                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: BlueColor,
                  )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: BlueColor,
                ),
              ),

              hintText: 'توضیحات',
              hintStyle: const TextStyle(
                fontFamily: "IranianSans",
              ),

            ),
          ),
        ),

        SizedBox(height: height * .02,),

        SizedBox(
          width: width * 0.9 ,
          child: TextFormField(
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty ) {
                return '';
              }
              return null;
            },
            controller: TransactionsScreen.priceController ,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: BlueColor,

                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: BlueColor,
                  )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: BlueColor,
                ),
              ),

              hintText: 'مبلغ',
              hintStyle: const TextStyle(
                fontFamily: "IranianSans",

              ),

            ),
          ),
        ),
      ],
    );
  }
}
