import 'package:postgres_conector/src/order_by.dart';

class OrderByDesc extends OrderBy {
  OrderByDesc({required String name, required String table})
      : super(name: name, table: table);
}
