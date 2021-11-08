import 'package:postgres_conector/src/parse_list.dart';

import 'where_attribute.dart';

class WhereNormalAttributeIn extends WhereAttribute {
  WhereNormalAttributeIn({required String key, List<dynamic>? value})
      : super(
            key: '"$key"',
            value: (value != null && value.isNotEmpty)
                ? 'IN (${parseList(value)})'
                : '');
}
