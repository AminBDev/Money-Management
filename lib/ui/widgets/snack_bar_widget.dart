import 'package:flutter/material.dart';



class SnackBarWidget extends StatelessWidget {
   SnackBarWidget({Key? key , required this.backgroundColor , required this.iconColor}) : super(key: key);
  Color backgroundColor ;
  Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15)
      ),

      child: Padding(
        padding: const EdgeInsets.only(right: 13 , left: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('asset/images/sad.png' , color: iconColor,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  const [
                Text(' حواس پرتی',

                  style:TextStyle(
                      fontSize: 18
                  ) ,
                ),
                Text('! هنوز فیلد ها خالیه  پرشون کن'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
