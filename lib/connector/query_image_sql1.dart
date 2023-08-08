import 'package:mysql1/mysql1.dart';

///imageQuery
List imgList = [];
Future<void> _queryImage() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '103.82.248.111',
      port: 3309,
      user: 'admin',
      db: 'demo',
      password: 'nimda')); //keeplearning

  var results = await conn.query('SELECT mnb_image1 FROM fomnbar WHERE mnb_trnc = "4000"');

  var x = results.map((e) => e['mnb_image1']);
  var z = results.toList();
  print(x.length);
  ///
  List list = [];
  for (Blob row in results.map((e) => e['mnb_image1'])) {
    final data = {
      'mnb_image1': row.toBytes(),
    };
    list.add(data);
  }
    imgList = list ;

  ///
  print('success');

  await conn.close();
}