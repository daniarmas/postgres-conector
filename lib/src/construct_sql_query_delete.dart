import 'package:postgres_conector/postgres_conector.dart';

String constructSqlQueryDelete({
  required String table,
  List<Where>? where,
}) {
  // Where
  String whereResult = '';
  whereResult = parseWhere(table: table, where: where);
  return 'DELETE '
      'FROM "$table" '
      '$whereResult'
      'RETURNING "$table"."id"';
}
