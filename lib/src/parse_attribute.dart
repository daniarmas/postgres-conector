import 'package:postgres_conector/postgres_conector.dart';

String parseAttribute(
    {required List<Attribute>? attributes, required String table}) {
  // Attributes
  String attributesResult = '*';
  if (attributes != null && attributes.isNotEmpty) {
    attributesResult = '';
    for (int i = 0; i < attributes.length; i++) {
      if (i == attributes.length - 1) {
        if (attributes[i] is NormalAttribute) {
          attributesResult += '"$table"."${attributes[i].name}"';
        } else if (attributes[i] is InnerAttribute) {
          var innerAttribute = attributes[i] as InnerAttribute;
          attributesResult +=
              '"${innerAttribute.innerTable}".${attributes[i].name}';
        } else if (attributes[i] is CaseAttribute) {
          var caseAttribute = attributes[i] as CaseAttribute;
          attributesResult += '$caseAttribute';
        } else {
          attributesResult += '"$table".${attributes[i].name}';
        }
      } else {
        if (attributes[i] is NormalAttribute) {
          attributesResult += '"$table"."${attributes[i].name}",';
        } else if (attributes[i] is InnerAttribute) {
          var innerAttribute = attributes[i] as InnerAttribute;
          attributesResult +=
              '"${innerAttribute.innerTable}".${attributes[i].name},';
        } else if (attributes[i] is CaseAttribute) {
          var caseAttribute = attributes[i] as CaseAttribute;
          attributesResult += '$caseAttribute,';
        } else {
          attributesResult += '"$table".${attributes[i].name},';
        }
      }
    }
  }
  return attributesResult;
}
