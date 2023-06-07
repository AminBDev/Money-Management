import 'package:flutter/material.dart';
import 'package:money_management/UI/Helper/colors.dart';


class BottomNavWidget extends StatefulWidget {

  PageController controller;


  

  BottomNavWidget({ Key? key , required this.controller}) : super(key: key);

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  bool isButtonPressed1 = true;
  bool isButtonPressed2 = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return  BottomAppBar(
       child: SizedBox(
           height: height * 0.1,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(

                  width: MediaQuery.of(context).size.width /2 - 20,
                  child: IconButton(
                    onPressed: (){
                      widget.controller.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);

                      setState(() {
                        isButtonPressed1 = true;
                        isButtonPressed2 = false;
                      });
                    },
                      icon: Image.asset('asset/icons/home.png' ,
                        color: isButtonPressed1 ? BlueColor : Colors.grey,
                        height: 30,

                      ),
                  )
                ),
                SizedBox(

                  width: MediaQuery.of(context).size.width /2 - 20,
                  child: IconButton(
                    onPressed: (){
                      widget.controller.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                      setState(() {
                        isButtonPressed1 = false;
                        isButtonPressed2 = true;
                      });

                    },
                    icon: Image.asset('asset/icons/barchart.png' ,
                      color: isButtonPressed2 ? BlueColor : Colors.grey,
                      height: 35,

                    ),
                  )



                ),
              ],
           )
       ),
    );
  }
}
