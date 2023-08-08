import 'package:flutter/material.dart';
import 'package:fluttermysql/connector/mysql.dart';
import 'package:fluttermysql/account/register.dart';
import 'package:fluttermysql/provider/transaction.dart';
import 'package:fluttermysql/query/delete_page.dart';
import 'package:fluttermysql/test/testcontroller.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:provider/provider.dart';

import 'account/home_login.dart';
import 'connect_database.dart';
import 'home_page.dart';
import 'query/insert_page.dart';
import 'account/login.dart';

void main() {
  runApp(const MyApp());
}
// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (_) => TransactionProvider(),
//       )
//     ],
//     child: const MyApp(),
//   ));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login()
    );
  }
}



