import 'package:postgres_conector/postgres_conector.dart';

String constructSqlQueryUpdate(
    {required String table,
    required Map<String, dynamic> data,
    required List<Where>? where,
    List<Attribute>? attributes}) {
  String columns = '';
  Iterable<String> keys = data.keys;
  Iterable<dynamic> values = data.values;
  // Columns && Values
  for (var i = 0; i < keys.length; i++) {
    if (i == keys.length - 1) {
      columns += "\"${keys.elementAt(i)}\" = '${values.elementAt(i)}'";
    } else {
      columns += "\"${keys.elementAt(i)}\" = '${values.elementAt(i)}',";
    }
  }
  // Where
  String whereResult = '';
  whereResult = parseWhere(table: table, where: where);
  // Attributes
  String attributesResult =
      parseAttribute(attributes: attributes, table: table);
  return 'UPDATE "$table" '
      'SET $columns '
      '$whereResult '
      'RETURNING $attributesResult;';
}
