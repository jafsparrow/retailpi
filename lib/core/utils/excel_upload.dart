import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

Future<List<Map<String, dynamic>>> readExcelFile(String filePath) async {
  final file = File(filePath);
  final bytes = file.readAsBytesSync();
  final excel = Excel.decodeBytes(bytes);

  List<Map<String, dynamic>> data = [];
  for (var table in excel.tables.keys) {
    print(table); //sheet Name
    print(excel.tables[table]?.maxColumns);
    print(excel.tables[table]?.maxRows);
    for (var row in excel.tables[table]!.rows) {
      if (row.isNotEmpty) {
        print(row[0]);

        data.add({
          'name': row[0]?.value.toString() ?? '',
          'code': row[1]?.value.toString() ?? '',
          'cost': num.parse(row[2]?.value.toString() ?? '0'),
          'price': num.parse(row[3]?.value.toString() ?? '0'),
        });
      }
    }
  }
  return data;
}
