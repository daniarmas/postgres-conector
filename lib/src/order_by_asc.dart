import 'package:postgres_conector/src/order_by.dart';

class OrderByAsc extends OrderBy {
  OrderByAsc({required String name, required String table})
      : super(name: name, table: table);
}
