import 'package:postgres_conector/postgres_conector.dart';

String constructSqlQueryInsert(
    {required String table,
    required Map<String, dynamic> data,
    List<Attribute>? attributes}) {
  String columns = '';
  String valuesResult = '';
  Iterable<String> keys = data.keys;
  Iterable<dynamic> values = data.values;
  // Columns && Values
  for (var i = 0; i < keys.length; i++) {
    if (i == keys.length - 1) {
      columns += '"${keys.elementAt(i)}"';
      valuesResult += '\'${values.elementAt(i)}\'';
    } else {
      columns += '"${keys.elementAt(i)}",';
      valuesResult += '\'${values.elementAt(i)}\',';
    }
  }
  // Attributes
  String attributesResult =
      parseAttribute(attributes: attributes, table: table);
  return 'INSERT INTO "$table"'
      '($columns)'
      'VALUES ($valuesResult)'
      'RETURNING $attributesResult;';
}
