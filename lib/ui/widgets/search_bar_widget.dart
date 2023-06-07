import 'package:flutter/material.dart';
import 'package:money_management/UI/Helper/Colors.dart';
import 'package:money_management/providers/transactionsProvider.dart';
import 'package:provider/provider.dart';



class TextFieldSearchWidget extends StatefulWidget {
   const TextFieldSearchWidget({Key? key}) : super(key: key);

  @override
  State<TextFieldSearchWidget> createState() => _TextFieldSearchWidgetState();
}

class _TextFieldSearchWidgetState extends State<TextFieldSearchWidget> {
  late TransactionProvider transactionProvider;

  TextEditingController SearchController = TextEditingController();


  void updateList(String text){
    transactionProvider = Provider.of<TransactionProvider>(context, listen: false);
    transactionProvider.searchTransactions(text);

  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15 , left: 15),
            child: Container(
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Colors.white, Colors.transparent,Colors.white,
                    Colors.white

                  ],
                ),
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: BlueColor.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20 , left: 20),
            child: TextField(
              textAlign: TextAlign.right,
              onChanged: updateList,
              controller: SearchController,
              cursorColor:   Colors.white,
              style: const TextStyle(

                color: Colors.white
              ),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 15.0),
                hintText: '... پیدا کردن تزاکنش',
                hintStyle: TextStyle(
                 color: Colors.white.withOpacity(0.5)
                ),
                prefixIcon: const Icon(Icons.search , color: Colors.white,),
                filled: true,
                  fillColor: BlueColor,

                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: BlueColor
                    )
                ),
                enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: BlueColor
                    )
                )
              ),


            ),
          ),
        ],
      );

  }
}
