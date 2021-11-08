import 'package:postgres_conector/postgres_conector.dart';

class CaseAttribute extends Attribute {
  final String table;
  final List<CaseWhen> whens;
  final String elseValue;

  CaseAttribute(
      {required this.table,
      required this.whens,
      required this.elseValue,
      required String name})
      : super(name: name);

  @override
  String toString() {
    String listOfWhen = '';
    for (var item in whens) {
      listOfWhen +=
          'WHEN "$table".${item.attribute.name}=\'${item.attributeValue}\' THEN \'${item.assignValue}\' ';
    }
    return 'CASE $listOfWhen ELSE \'$elseValue\' END as "$name" ';
  }
}

class CaseWhen {
  final Attribute attribute;
  final String attributeValue;
  final String assignValue;
  CaseWhen(
      {required this.attribute,
      required this.attributeValue,
      required this.assignValue});
}
