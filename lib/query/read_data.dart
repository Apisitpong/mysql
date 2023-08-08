import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:provider/provider.dart';

import '../connect_database.dart';
import '../provider/transaction.dart';


class ReadData extends StatefulWidget {
  const ReadData({Key? key,required this.host, required this.port, required this.user, required this.password, required this.dbname}) : super(key: key);
  final String host;
  final int port;
  final String user;
  final String password;
  final String dbname;

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  List<Map<String, String>> displayList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Mysql Read Data"),
      ),
      body: SingleChildScrollView(
        child:
        Column(children: displayList.map<Widget>((data) {
           return Card(
              child: ListTile(
                leading: Text(data['id']?? ""),
                title: Text(data['name']?? ""),
                trailing: TextButton(
                  child: const Text("update"),
                  onPressed: () {},
                ),
              )
          );
        }
        ).toList()
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _readAll,
        tooltip: 'ReadAll',
        label: const Text("Update data! "),
      ),
    );
  }
  //func readData
  Future<void> _readAll() async {
    print("Connecting to mysql server...");

    // create connection
    final conn = await MySQLConnection.createConnection(
      host: widget.host, //localhost "10.0.2.2"
      port: widget.port,
      userName: widget.user,//root
      password: widget.password,//keep1234
      databaseName: widget.dbname,//keeplearning
      // host: "easyfo.homeip.net", //server
      // port: 3306,
      // userName: "pos",
      // password: "pos",
      // databaseName: "backuptest",
      secure:  false,
    );

    await conn.connect();
    print("con is $conn");
    print("conn is ${conn.connected}");

    print("Connected");

    // make query
    var result = await conn.execute("SELECT * FROM users ");

    // print some result data
    //print(result.numOfColumns);
    //print(result.numOfRows);
    //print(result.lastInsertID);
    //print(result.affectedRows);


    // print query result
    List<Map<String, String>> list = [];
    for (final row in result.rows) {
      final data = {
        'id': row.colAt(0)!,
        'name': row.colAt(1)!,
      };
      list.add(data);
    }
    print('query success');

    setState(() {
      displayList = list;
    });

    // close all connections
    await conn.close();
  }
}

