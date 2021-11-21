import 'package:postgres_conector/postgres_conector.dart';
import 'package:postgres_conector/src/parse_order_by.dart';

String constructSqlQuerySearch({
  required String table,
  required List<Where> where,
  List<Attribute>? attributes,
  List<String>? agregationAttributes,
  InnerJoin? innerJoin,
  int? limit,
  OrderBy? orderBy,
}) {
  // Attributes
  String attributesResult =
      parseAttribute(attributes: attributes, table: table);
  // AgregationAttributes
  String agregationAttributesResult = '';
  if (agregationAttributes != null && agregationAttributes.isNotEmpty) {
    for (int i = 0; i < agregationAttributes.length; i++) {
      if (i == agregationAttributes.length - 1) {
        agregationAttributesResult += agregationAttributes[i];
      } else {
        agregationAttributesResult += '${agregationAttributes[i]},';
      }
    }
    attributesResult += ', $agregationAttributesResult';
  }
  // Where
  String whereResult = '';
  whereResult = parseWhere(table: table, where: where);
  // InnerJoin
  String innerJoinResult = (innerJoin != null) ? '$innerJoin' : '';
  // OrderBy
  String orderByAscResult = parseOrderBy(orderBy);
  // Limit
  String limitResult = limit != null ? 'LIMIT $limit;' : '';
  return 'SELECT $attributesResult '
      'FROM "$table" '
      '$innerJoinResult'
      '$whereResult'
      '$orderByAscResult'
      '$limitResult ';
}
