import 'package:flutter/material.dart';
import 'package:fluttermysql/provider/transaction.dart';
import 'package:provider/provider.dart';

class TestController extends StatefulWidget {
  const TestController({Key? key,}) : super(key: key);
  //final String host1;

  @override
  State<TestController> createState() => _TestControllerState();
}

class _TestControllerState extends State<TestController> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Provider & Consumer"),
        ),
        body: Column(
          children: [
            Text(
              "widget.host1 + 55555555",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
