import 'package:postgres_conector/src/parse_list.dart';

import 'where_attribute.dart';

class WhereNormalAttributeNotIn extends WhereAttribute {
  WhereNormalAttributeNotIn({required String key, List<dynamic>? value})
      : super(
            key: '"$key"',
            value: (value != null && value.isNotEmpty)
                ? 'NOT IN (${parseList(value)})'
                : '');
}
