import 'attribute.dart';

class InnerAttribute extends Attribute {
  final String innerTable;
  InnerAttribute({required String name, required this.innerTable})
      : super(name: '"$name"');
}
