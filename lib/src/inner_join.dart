class InnerJoin {
  final String relationTable;
  final String relationValue;
  final String table;
  final String tableValue;

  InnerJoin(
      {required this.table,
      required this.tableValue,
      required this.relationValue,
      required this.relationTable});

  @override
  String toString() {
    return 'INNER JOIN "$relationTable" ON "$relationTable"."$relationValue"="$table"."$tableValue"';
  }
}
