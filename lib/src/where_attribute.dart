import 'package:postgres_conector/postgres_conector.dart';

class WhereAttribute implements Where {
  final String key;
  final dynamic value;

  WhereAttribute({required this.key, required this.value});
}
