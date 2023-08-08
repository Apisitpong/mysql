import 'package:flutter/material.dart';
import 'package:fluttermysql/query/delete_page.dart';
import 'package:fluttermysql/query/insert_page.dart';
import 'package:fluttermysql/query/read_data.dart';

import 'connect_database.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key,
      required this.host,
      required this.port,
      required this.user,
      required this.password,
      required this.dbname})
      : super(key: key);
  final String host;
  final int port;
  final String user;
  final String password;
  final String dbname;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Flutter MySQL Sample'),centerTitle: true,),
          body: Center(
              child: Column(
              children: [
                const SizedBox(height: 200),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'Flutter MySQL Sample',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadData(
                            host: widget.host,
                            port: widget.port,
                            user: widget.user,
                            password: widget.password,
                            dbname: widget.dbname,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Read Data Page",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InsertPage(
                            host: widget.host,
                            port: widget.port,
                            user: widget.user,
                            password: widget.password,
                            dbname: widget.dbname,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Insert Page",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeletePage(
                            host: widget.host,
                            port: widget.port,
                            user: widget.user,
                            password: widget.password,
                            dbname: widget.dbname,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Delete Page",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.0,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const ConnectDB()),
                        );
                      },
                      child: const Text("SETTING"),
                    ),
                  ),
                )
              ],
            ))),
    );
  }
}
