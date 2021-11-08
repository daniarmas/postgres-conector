import 'package:postgres_conector/postgres_conector.dart';

class Or extends Where {
  final List<WhereAttribute> attributes;

  Or(this.attributes);
}
