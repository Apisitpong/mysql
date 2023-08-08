import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermysql/main.dart';
import 'package:mysql_client/mysql_client.dart';


class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Map<String, String>> displayList = [];

  Future<void> mysql() async {
    print("Connecting to mysql server...");

    // create connection
    final conn = await MySQLConnection.createConnection(
      host: "10.0.2.2",
      port: 3306,
      userName: "root",
      password: "keep1234",
      databaseName: "keeplearning", // optional
    );

    await conn.connect();

    print("Connected555");

    // // update some rows
    // var res = await conn.execute(
    //   "UPDATE book SET price = :price",
    //   {"price": 200},
    // );
    //
    // print(res.affectedRows);
    //
    // // insert some rows
    // res = await conn.execute(
    //   "INSERT INTO book (author_id, title, price, created_at) VALUES (:author, :title, :price, :created)",
    //   {
    //     "author": null,
    //     "title": "New title",
    //     "price": 200,
    //     "created": "2022-02-02",
    //   },
    // );
    //
    // print(res.affectedRows);

    // make query
    var result = await conn.execute("SELECT * FROM users");

    // print some result data
    print(result.numOfColumns);
    print(result.numOfRows);
    print(result.lastInsertID);
    print(result.affectedRows);

    // print query result
    for (final row in result.rows) {
      // print(row.colAt(0));
      // print(row.colByName("title"));

      // print all rows as Map<String, String>
      print(row.assoc());
    }
    // print query result
    List<Map<String, String>> list = [];
    for (final row in result.rows) {
      final data = {
        'id': row.colAt(0)!,
        'name': row.colAt(1)!,
        // 'selectedName': row.colAt(2)!,
        // 'selectedCountry': row.colAt(3)!
      };
      list.add(data);
    }

    print('je suis la');

    setState(() {
      displayList = list;
    });

    // close all connections
    await conn.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("hihihihih"),
      ),
      body: SingleChildScrollView(
        child:
        Column(children: displayList.map<Widget>((data) {
          return Card(
              child: ListTile(
                leading: Text(data['id']?? ""),
                title: Text(data['name']?? ""),
                // subtitle: Text(data['selectedCountry']?? ""),
                trailing: TextButton(
                  child: const Text("update"),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => UpdatePage(title: data['selectedId']?? "")),
                    // );
                  },
                ),
              )
          );
        }
        ).toList()
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: mysql,
        tooltip: 'ReadAll',
        label: const Text("read all"),
      ),
    );
  }
}

