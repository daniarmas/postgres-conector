import 'package:postgres_conector/postgres_conector.dart';

List<Where> getWhereNormalAttributeList(Map<String, dynamic> data) {
  List<Where> where = [];
  if (data.isNotEmpty) {
    Iterable<String> keys = data.keys;
    Iterable<dynamic> values = data.values;
    for (var i = 0; i < keys.length; i++) {
      where.add(WhereNormalAttributeEqual(
          key: keys.elementAt(i), value: values.elementAt(i)));
    }
    return where;
  } else {
    return where;
  }
}
