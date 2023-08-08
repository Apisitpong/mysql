import 'package:flutter/material.dart';
import 'package:fluttermysql/query/read_data.dart';
import 'package:mysql_client/mysql_client.dart';

class InsertPage extends StatefulWidget {
  const InsertPage(
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
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  var id = '';
  var newName = '';

  Future<void> _insert() async {
    print("Connecting to mysql server...");

    // create connection
    final conn = await MySQLConnection.createConnection(
      host: widget.host, //localhost "10.0.2.2"
      port: widget.port,
      userName: widget.user, //root
      password: widget.password, //keep1234
      databaseName: widget.dbname, //keeplearning
      // host: "easyfo.homeip.net",
      // port: 3306,
      // userName: "pos",
      // password: "pos",
      // databaseName: "backuptest",
      secure: false,
    );

    await conn.connect();

    print("Connected");

    // insert some rows
    var res = await conn.execute(
      "INSERT INTO users (id, name) VALUES (:id, :name)",
      {
        "id": id, //if you set it auto increment
        "name": newName,
      },
    );

    print(res.affectedRows);

    // close all connections
    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Mysql Insert Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                child: TextFormField(
                  onChanged: (text) {
                    id = text;
                  },
                  decoration: const InputDecoration(
                      hintText: "please enter your id",
                      border: OutlineInputBorder()),
                )),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  onChanged: (text) {
                    newName = text;
                  },
                  decoration: const InputDecoration(
                      hintText: "please enter your name",
                      border: OutlineInputBorder()),
                )),
            const Text(
              'Push button to insert ',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _insert();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ReadData(
                      host: widget.host,
                      port: widget.port,
                      user: widget.user,
                      password: widget.password,
                      dbname: widget.dbname,
                    )),
          );
        },
        tooltip: 'insert',
        label: const Text("insert"),
      ),
    );
  }
}
