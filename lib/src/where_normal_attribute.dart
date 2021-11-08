import 'where_attribute.dart';

class WhereNormalAttributeEqual extends WhereAttribute {
  WhereNormalAttributeEqual({required String key, required dynamic value})
      : super(key: '"$key"', value: value);
}

class WhereNormalAttributeNotEqual extends WhereAttribute {
  WhereNormalAttributeNotEqual({required String key, required dynamic value})
      : super(key: '"$key"', value: value);
}
