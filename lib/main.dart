import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/utils/main_wrapper.dart';
import 'package:money_management/models/money.dart';
import 'package:money_management/providers/transactionsProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MoneyAdapter());
  await Hive.openBox<Money>("MoneyBox");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TransactionProvider()),
  ], child: const MoneyManagement()));
}

class MoneyManagement extends StatelessWidget {
  const MoneyManagement({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}
