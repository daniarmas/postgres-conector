import 'package:postgres_conector/postgres_conector.dart';

class And extends Where {
  final List<WhereAttribute> attributes;

  And(this.attributes);
}
