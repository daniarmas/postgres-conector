import 'where_attribute.dart';

class WhereNormalSearch extends WhereAttribute {
  WhereNormalSearch({required String key, required dynamic value})
      : super(key: key, value: value);
  @override
  String toString() {
    return 'to_tsvector($key) @@ to_tsquery(\'$value\')';
  }
}
