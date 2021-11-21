import 'package:postgres_conector/postgres_conector.dart';
import 'package:postgres_conector/src/order_by.dart';

String parseOrderBy(OrderBy? orderBy) {
  if (orderBy != null && orderBy is OrderByAsc) {
    return 'ORDER BY "${orderBy.table}"."${orderBy.name}" ASC ';
  } else if (orderBy != null && orderBy is OrderByDesc) {
    return 'ORDER BY "${orderBy.table}"."${orderBy.name}" DESC ';
  } else {
    return '';
  }
}
