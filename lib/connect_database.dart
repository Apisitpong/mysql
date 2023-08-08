import 'package:flutter/material.dart';
import 'package:fluttermysql/provider/transaction.dart';
import 'package:fluttermysql/query/read_data.dart';
import 'package:fluttermysql/test/testcontroller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mysql_client/exception.dart';
import 'package:mysql_client/mysql_client.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

class ConnectDB extends StatefulWidget {
  const ConnectDB({Key? key}) : super(key: key);

  @override
  State<ConnectDB> createState() => _ConnectDBState();
}

class _ConnectDBState extends State<ConnectDB> {
  var hostController = TextEditingController();
  var portController = TextEditingController();
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var dbnameController = TextEditingController();

  bool obscureText = true;

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  const Text(
                    "Please connect your database",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: hostController,
                      decoration: InputDecoration(
                          hintText: "host",
                          labelText: "host",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                hostController.clear();
                              },
                              icon: const Icon(Icons.clear))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: portController,
                      decoration: InputDecoration(
                          hintText: "port",
                          labelText: "port",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                portController.clear();
                              },
                              icon: const Icon(Icons.clear))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: userController,
                      decoration: InputDecoration(
                          hintText: "user",
                          labelText: "user",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                userController.clear();
                              },
                              icon: const Icon(Icons.clear))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                          hintText: "password",
                          labelText: "password",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                _toggle();
                              },
                              icon: const Icon(Icons.lock))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: dbnameController,
                      decoration: InputDecoration(
                          hintText: "DBname",
                          labelText: "DBname",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                dbnameController.clear();
                              },
                              icon: const Icon(Icons.clear))),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50.0,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            print("Connection...");
                            final conn = await MySQLConnection.createConnection(
                                host: hostController.text.toString(),
                                port: int.parse(portController.text.toString()),
                                userName: userController.text.toString(),
                                password: passwordController.text.toString(),
                                databaseName: dbnameController.text.toString(),
                                secure: false // optional
                                );
                            await conn.connect();
                            print(conn.connected);
                            setState(() {
                              showCustom(
                                  context, Colors.green, "Connections to database");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => HomePage(
                                            host: hostController.text.toString(),
                                            port: int.parse(portController
                                                .value.text
                                                .toString()),
                                            user: userController.text.toString(),
                                            password:
                                                passwordController.text.toString(),
                                            dbname:
                                                dbnameController.text.toString(),
                                          )));
                            });
                          } on Exception catch (_) {
                            setState(() {
                              showCustom(context, Colors.red,
                                  "Can't connect to database server");
                            });
                          }
                        },
                        child: const Text(
                          "Connect",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  )
                  //Text(testText)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showCustom(BuildContext context, Color color, String connText) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              connText,
              // Connections to database
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      // toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.BOTTOM,
    );
  }
}
