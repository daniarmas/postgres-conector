import 'where_attribute.dart';

class WhereNormalAttributeHigher extends WhereAttribute {
  WhereNormalAttributeHigher({required String key, required dynamic value})
      : super(key: key, value: value);
  @override
  String toString() {
    return '"$key" > \'$value\'';
  }
}
