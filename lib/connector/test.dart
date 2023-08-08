
import 'package:flutter/cupertino.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:ui';

List minibarList = [];
Future<void> main()  async {
  print("queryDirty Connecting to mysql server...");
  // create connection
  final conn = await MySQLConnection.createConnection(
    host: '103.82.248.111', //localhost "10.0.2.2"
    port: 3309,
    userName: 'admin', //root
    password: 'nimda', //keep1234
    databaseName: 'demo', //keeplearning
    secure: false,
  );
  await conn.connect();

  var result = await conn.execute("SELECT * FROM fofol WHERE fol_intno = 1737");

  print('connect');
  ///list
  List<Map<String, dynamic>> list = [];
  List listAmt = [];
  List listTrn = [];
  List listRm = [];
  for (final row in result.rows) {
    final data = {
      'fol_id': row.colAt(0)?? '',
      'fol_intno': row.colAt(2)?? '',
      'fol_amt1': row.colAt(12)?? '',
      'fol_amt2': row.colAt(13)?? '',
      'fol_amt3': row.colAt(14)?? '',
      'fol_amt4': row.colAt(15)?? '',
      'fol_amt5': row.colAt(16)?? '',
      'fol_amt6': row.colAt(17)?? '',
      'fol_amt7': row.colAt(18)?? '',
      'fol_amt8': row.colAt(19)?? '',
      'fol_amt9': row.colAt(20)?? '',
      'fol_trn1': row.colAt(21)?? '',
      'fol_trn2': row.colAt(22)?? '',
      'fol_trn3': row.colAt(23)?? '',
      'fol_trn4': row.colAt(24)?? '',
      'fol_trn5': row.colAt(25)?? '',
      'fol_trn6': row.colAt(26)?? '',
      'fol_trn7': row.colAt(27)?? '',
      'fol_trn8': row.colAt(28)?? '',
      'fol_trn9': row.colAt(29)?? '',
      'fol_rm1': row.colAt(57)?? '',
      'fol_rm2': row.colAt(58)?? '',
      'fol_rm3': row.colAt(59)?? '',
      'fol_rm4': row.colAt(60)?? '',
      'fol_rm5': row.colAt(61)?? '',
      'fol_rm6': row.colAt(62)?? '',
      'fol_rm7': row.colAt(63)?? '',
      'fol_rm8': row.colAt(64)?? '',
      'fol_rm9': row.colAt(65)?? '',
    };
    final amt = {
      'fol_amt1': row.colAt(12)?? '',
      'fol_amt2': row.colAt(13)?? '',
      'fol_amt3': row.colAt(14)?? '',
      'fol_amt4': row.colAt(15)?? '',
      'fol_amt5': row.colAt(16)?? '',
      'fol_amt6': row.colAt(17)?? '',
      'fol_amt7': row.colAt(18)?? '',
      'fol_amt8': row.colAt(19)?? '',
      'fol_amt9': row.colAt(20)?? '',
    };
    final trn = {
      'fol_trn1': row.colAt(21)?? '',
      'fol_trn2': row.colAt(22)?? '',
      'fol_trn3': row.colAt(23)?? '',
      'fol_trn4': row.colAt(24)?? '',
      'fol_trn5': row.colAt(25)?? '',
      'fol_trn6': row.colAt(26)?? '',
      'fol_trn7': row.colAt(27)?? '',
      'fol_trn8': row.colAt(28)?? '',
      'fol_trn9': row.colAt(29)?? '',
    };
    final rm = {
      'fol_rm1': row.colAt(57),
      'fol_rm2': row.colAt(58),
      'fol_rm3': row.colAt(59),
      'fol_rm4': row.colAt(60),
      'fol_rm5': row.colAt(61),
      'fol_rm6': row.colAt(62),
      'fol_rm7': row.colAt(63),
      'fol_rm8': row.colAt(64),
      'fol_rm9': row.colAt(65),
    };
    list.add(data);
    listAmt.add(amt);
    listTrn.add(trn);
    listRm.add(rm);
    //print('data => ${data}');
    //print('amt => ${listAmt}');
    //print('trn => ${listTrn}');
    //print('rm => ${listRm}');
  }
  ///
  var t = result.rows;
  var t1 = t.first.colAt(21)?? '';
  var t2 = t.first.colAt(22)?? '';
  var t3 = t.first.colAt(23)?? '';
  var t4 = t.first.colAt(24)?? '';
  var t5 = t.first.colAt(25)?? '';
  var t6 = t.first.colAt(26)?? '';
  var t7 = t.first.colAt(27)?? '';
  var t8 = t.first.colAt(28)?? '';
  var t9 = t.first.colAt(29)?? '';
  //
  var r1 = t.first.colAt(57)?? '';
  var r2 = t.first.colAt(58)?? '';
  var r3 = t.first.colAt(59)?? '';
  var r4 = t.first.colAt(60)?? '';
  var r5 = t.first.colAt(61)?? '';
  var r6 = t.first.colAt(62)?? '';
  var r7 = t.first.colAt(63)?? '';
  var r8 = t.first.colAt(64)?? '';
  var r9 = t.first.colAt(65)?? '';

  Future<void> checkRm() async {
    if(r1.isEmpty){
      if(r2.isEmpty){
        if(r3.isEmpty){
          if(r4.isEmpty){
            if(r5.isEmpty){
              if(r6.isEmpty){
                if(r7.isEmpty){
                  if(r8.isEmpty){
                    if(r9.isEmpty){
                      await conn.execute("UPDATE fofol SET fol_amt1 = '2345.9' WHERE fol_intno = 1737");
                    }else{
                      print(r9);
                    }
                  }else{
                    print(r8);
                  }
                }else{
                  print(r7);
                }
              }else{
                print(r6);
              }
            }
            else{
              print(r5);
            }
          }
          else{
            print(r4);
          }
        }
        else{
          print(r3);
        }
      }
      else{
        print(r2);
      }
    }
    else{
      print(r1);
    }
    await conn.close();
  }
  Future<void> checkTrn() async {
    if(t1.isEmpty){
      if(t2.isEmpty){
        if(t3.isEmpty){
          if(t4.isEmpty){
            if(t5.isEmpty){
              if(t6.isEmpty){
                if(t7.isEmpty){
                  if(t8.isEmpty){
                    if(t9.isEmpty){
                      checkRm();
                    }else{
                      print(t9);
                    }
                  }else{
                    print(t8);
                  }
                }else{
                  print(t7);
                }
              }else{
                print(t6);
              }
            }
            else{
              if(r5.isEmpty){
                await conn.execute("UPDATE fofol SET fol_amt5 = '2345.9' WHERE fol_intno = 1737");
              } else {
                //await conn.execute("SELECT * FROM fofol WHERE fol_intno = $r5");
                print(r5);
              }
              //print(t5);
            }
          }
          else{
            print(t4);
          }
        }
        else{
          print(t3);
        }
      }
      else{
        print(t2);
      }
    }
    else{
      print(t1);
    }
  }

  Future<void> newRm2() async {
    if(r1.isNotEmpty){
      print(r1);
      return;
    }
    if(r2.isNotEmpty){
      print(r2);
      return;
    }
    if(r3.isNotEmpty){
      print(r3);
      return;
    }
    if(r4.isNotEmpty){
      print(r4);
      return;
    }
    if(r5.isNotEmpty){
      print(r5);
      return;
    }
    if(r6.isNotEmpty){
      print(r6);
      return;
    }
    if(r7.isNotEmpty){
      print(r7);
      return;
    }
    if(r8.isNotEmpty){
      print(r8);
      return;
    }
    if(r9.isNotEmpty){
      print(r9);
      return;
    }
    ///ถ้าได้หมดทำอันนี้
    await conn.execute("UPDATE fofol SET fol_amt1 = '2345.9' WHERE fol_intno = 1737");
  }
  Future<void> newTrn2() async {
    if(t1.isNotEmpty){
      print(t1);
      return;
    }
    if(t2.isNotEmpty){
      print(t2);
      return;
    }
    if(t3.isNotEmpty){
      print(t3);
      return;
    }
    if(t4.isNotEmpty){
      print(t4);
      return;
    }
    if(t5.isNotEmpty){
      print(r5);
      return;
    }
    if(t6.isNotEmpty){
      print(t6);
      return;
    }
    if(t7.isNotEmpty){
      print(t7);
      return;
    }
    if(t8.isNotEmpty){
      print(t8);
      return;
    }
    if(t9.isNotEmpty){
      print(t9);
      return;
    }
    ///ถ้าได้หมดทำอันนี้
    newRm2();
  }

  Future<void> query(intNo) async {
    final newConn = await MySQLConnection.createConnection(
      host: '103.82.248.111', //localhost "10.0.2.2"
      port: 3309,
      userName: 'admin', //root
      password: 'nimda', //keep1234
      databaseName: 'demo', //keeplearning
      secure: false,
    );
    await newConn.connect();
    var res =  await newConn.execute("SELECT * FROM fofol WHERE fol_intno = $intNo");
    var tx = res.rows;
    var t1x = tx.first.colAt(21)?? '';
    var t2x = tx.first.colAt(22)?? '';
    var t3x = tx.first.colAt(23)?? '';
    var t4x = tx.first.colAt(24)?? '';
    var t5x = tx.first.colAt(25)?? '';
    var t6x = tx.first.colAt(26)?? '';
    var t7x = tx.first.colAt(27)?? '';
    var t8x = tx.first.colAt(28)?? '';
    var t9x = tx.first.colAt(29)?? '';
    //
    var r1x = tx.first.colAt(57)?? '';
    var r2x = tx.first.colAt(58)?? '';
    var r3x = tx.first.colAt(59)?? '';
    var r4x = tx.first.colAt(60)?? '';
    var r5x = tx.first.colAt(61)?? '';
    var r6x = tx.first.colAt(62)?? '';
    var r7x = tx.first.colAt(63)?? '';
    var r8x = tx.first.colAt(64)?? '';
    var r9x = tx.first.colAt(65)?? '';

    if(t1x.isNotEmpty){
      print(t1x);
      return;
    }
    if(t2x.isNotEmpty){
      print(t2x);
      return;
    }
    if(t3x.isNotEmpty){
      print(t3x);
      return;
    }
    if(t4x.isNotEmpty){
      print(t4x);
      return;
    }
    if(t5x.isNotEmpty){
      print(t5x);
      return;
    }
    if(t6x.isNotEmpty){
      print(t6x);
      return;
    }
    if(t7x.isNotEmpty){
      print(t7x);
      return;
    }
    if(t8x.isNotEmpty){
      print(t8x);
      return;
    }
    if(t9x.isNotEmpty){
      print(t9x);
      return;
    }
    ///ถ้าได้หมดทำอันนี้
    if(r1x.isNotEmpty){
      print(r1x);
      return;
    }
    if(r2x.isNotEmpty){
      print(r2x);
      return;
    }
    if(r3x.isNotEmpty){
      print(r3x);
      return;
    }
    if(r4x.isNotEmpty){
      print(r4x);
      return;
    }
    if(r5x.isNotEmpty){
      print(r5x);
      return;
    }
    if(r6x.isNotEmpty){
      print(r6x);
      return;
    }
    if(r7x.isNotEmpty){
      print(r7x);
      return;
    }
    if(r8x.isNotEmpty){
      print(r8x);
      return;
    }
    if(r9x.isNotEmpty){
      print(r9x);
      return;
    }
    ///ถ้าได้หมดทำอันนี้
    await conn.execute("UPDATE fofol SET fol_amt5 = '3015.3' WHERE fol_intno = $intNo");
  }
  Future<void> newRm() async {
    if(r1.isNotEmpty){
      print(r1);
      return;
    }
    if(r2.isNotEmpty){
      print(r2);
      return;
    }
    if(r3.isNotEmpty){
      print(r3);
      return;
    }
    if(r4.isNotEmpty){
      print(r4);
      return;
    }
    if(r5.isNotEmpty){
      print(r5);
      return;
    }
    if(r6.isNotEmpty){
      print(r6);
      return;
    }
    if(r7.isNotEmpty){
      print(r7);
      return;
    }
    if(r8.isNotEmpty){
      print(r8);
      return;
    }
    if(r9.isNotEmpty){
      print(r9);
      return;
    }
    ///ถ้าได้หมดทำอันนี้
    await conn.execute("UPDATE fofol SET fol_amt1 = '2345.9' WHERE fol_intno = 1737");
  }
  Future<void> newTrn() async {
    if(t1.isNotEmpty){
      print(t1);
      return;
    }
    if(t2.isNotEmpty){
      print(t2);
      return;
    }
    if(t3.isNotEmpty){
      print(t3);
      return;
    }
    if(t4.isNotEmpty){
      print(t4);
      return;
    }
    if(t5.isNotEmpty){
      if(r5.isNotEmpty){
        query(r5);
        print(r5);
        print('r5 = not empty');
        return;
      }
      print('r5 = empty');
      return;
    }
    if(t6.isNotEmpty){
      print(t6);
      return;
    }
    if(t7.isNotEmpty){
      print(t7);
      return;
    }
    if(t8.isNotEmpty){
      print(t8);
      return;
    }
    if(t9.isNotEmpty){
      print(t9);
      return;
    }
    ///ถ้าได้หมดทำอันนี้
    newRm();
  }
  newTrn();
  print('success');
  //checkRm();

  //close all connections
  //await conn.close();

}

