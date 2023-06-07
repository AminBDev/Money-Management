import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:money_management/ui/Helper/colors.dart';
import 'package:money_management/ui/screens/transactions_screen.dart';
import 'package:money_management/models/money.dart';
import 'package:money_management/models/response_model.dart';
import 'package:money_management/providers/transactionsProvider.dart';
import 'package:money_management/ui/widgets/isempy_widget.dart';
import 'package:money_management/ui/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';
import '../widgets/my_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static List<Money> moneys = [];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TransactionProvider transactionProvider;

  @override
  void initState() {


    transactionProvider = Provider.of<TransactionProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_){

      transactionProvider.getTransactions();

    });
    super.initState();
  }
  



  void onch(int index) {
    transactionProvider.removeItem(index);
  }

  Box<Money> hiveBox = Hive.box<Money>("MoneyBox");
  final TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                height: height,
                width: double.infinity,
                color: BlueColor.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * .02,
                    ),
                    const Text(
                      'تــــراکنش ها',
                      style: TextStyle(fontSize: 30, color: Colors.black54),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    const TextFieldSearchWidget(),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 165),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                    )),
                child: Consumer<TransactionProvider>(
                  builder: (context, searchprovider, child) {
                    switch (searchprovider.state.status) {
                      case Status.LOADING:
                        return const Text('data');
                      case Status.COMPLETED:
                        if (transactionProvider.moneys != null) {
                          List<Money> moneys = searchprovider.moneys;
                          return  moneys.isEmpty
                                ? IsEmpyWidget(height: height)
                                : ListView.builder(
                                    itemCount: moneys.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          //! Edit
                                          onTap: () {
                                            Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const TransactionsScreen()))
                                                .then((value) {
                                              Provider.of<TransactionProvider>(
                                                      context,
                                                      listen: false)
                                                  .getTransactions();
                                            });
                                            TransactionsScreen
                                                .descriptionController
                                                .text = moneys[index].titel;
                                            TransactionsScreen.priceController
                                                .text = moneys[index].price;
                                            TransactionsScreen.isEditing = true;
                                            TransactionsScreen.index = index;
                                          },

                                          //! Rimove
                                          onLongPress: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    Dialog(
                                                      backgroundColor: Colors.transparent,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey.shade200,
                                                          borderRadius: BorderRadius.circular(15),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Image.asset('asset/images/warning.png'),
                                                            const  Text('اخطار' , style: TextStyle(
                                                                fontSize: 26,
                                                                color: Colors.red,
                                                                fontFamily: 'Vazir'
                                                            ),),
                                                            const Text('در صورت حذف تراکنش\n امکان بازگشت تراکنش وجود ندارد' , style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.black,

                                                            ),
                                                              textAlign: TextAlign.center,

                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(right: 5 , left: 10 , top:  15 , bottom: 10),

                                                                    child: SizedBox(
                                                                        height: 55,
                                                                        child: OutlinedButton(

                                                                          onPressed: (){
                                                                            Navigator.pop(context);
                                                                          },
                                                                          style: OutlinedButton.styleFrom(
                                                                              side: const BorderSide(
                                                                                  color: Colors.red
                                                                              ),
                                                                              shape: RoundedRectangleBorder(

                                                                                  borderRadius: BorderRadius.circular(14)
                                                                              )
                                                                          ),
                                                                          child: const Text('خیر' , style: TextStyle(
                                                                            color: Colors.red,
                                                                            fontSize: 17,
                                                                          ),),
                                                                        )
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(right: 10 , left: 5 , top:  15 , bottom: 10),

                                                                    child: SizedBox(
                                                                      height: 55,
                                                                      child: ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(
                                                                              backgroundColor: Colors.lightGreen,
                                                                              shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(14)
                                                                              )
                                                                          ),
                                                                          onPressed: (){

                                                                            transactionProvider.removeItem(index);

                                                                            Navigator.pop(context);
                                                                          },
                                                                          child: const Text('بلی',
                                                                            style: TextStyle(
                                                                              fontSize: 17,
                                                                            ),
                                                                          )

                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),

                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                            );
                                          },
                                          child: Slidable(
                                              endActionPane: ActionPane(
                                                  motion: const ScrollMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      onPressed: (context) =>
                                                          onch(index),
                                                      backgroundColor:
                                                          const Color(0xFFFE4A49),
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.delete,
                                                      label: 'Delete',
                                                    ),
                                                  ]),
                                              child: MyListMoney(
                                                height: height,
                                                width: width,
                                                index: index,
                                                mony: moneys[index],
                                              )));
                                    },
                                  );

                        } else {
                          return const Center();
                        }

                      case Status.ERROR:
                        return const Text("Errorff");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Searchbar Widget

}


