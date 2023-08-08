import 'package:flutter/material.dart';
import 'package:fluttermysql/query/read_data.dart';
import 'package:mysql_client/mysql_client.dart';

class DeletePage extends StatefulWidget {
  const DeletePage(
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
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  var res = '';
  var targetId = '';

  Future<void> _delete() async {
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

    // update some rows
    var res = await conn.execute(
      "DELETE FROM users WHERE id = $targetId",
    );

    print(res.affectedRows);

    // close all connections
    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Mysql Delete Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  onChanged: (text) {
                    targetId = text;
                  },
                  decoration: const InputDecoration(
                      hintText: "please enter your id",
                      border: OutlineInputBorder()),
                )),
            const Text(
              'Push button to delete id ',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _delete();
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
          });
        },
        tooltip: 'delete',
        label: const Text("delete"),
      ),
    );
  }
}
