import 'package:flutter/material.dart';
import 'package:money_management/ui/widgets/bottom_nav_widget.dart';
import 'package:money_management/ui/screens/home_screen.dart';
import 'package:money_management/ui/screens/info_screen.dart';
import 'package:money_management/ui/screens/transactions_screen.dart';
import 'package:money_management/providers/transactionsProvider.dart';
import 'package:provider/provider.dart';

import '../ui/Helper/colors.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {

  final PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavWidget(controller: _myPage),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: BlueColor,
        elevation: 0,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TransactionsScreen()))
              .then((value) {

            Provider.of<TransactionProvider>(context, listen: false).getTransactions();

          });

          TransactionsScreen.descriptionController.text = "";
          TransactionsScreen.priceController.text = "";
          TransactionsScreen.groupId = 0;
          TransactionsScreen.isEditing = false;
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: const Icon(
          Icons.add,
        ),
      ),

      body: PageView(
        controller: _myPage,
        children: const [
          HomePage(),
          InfoScreen()
        ]
        ,
      ),
    );
  }
}
