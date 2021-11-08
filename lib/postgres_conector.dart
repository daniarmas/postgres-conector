/// Support for doing something awesome.
///
/// More dartdocs go here.
library postgres_conector;

export 'src/postgres_conector_base.dart';
export 'src/and.dart' show And;
export 'src/attribute.dart' show Attribute;
export 'src/case_attribute.dart' show CaseAttribute, CaseWhen;
export 'src/get_where_list.dart' show getWhereNormalAttributeList;
export 'src/inner_attribute.dart' show InnerAttribute;
export 'src/inner_join.dart';
export 'src/normal_attribute.dart' show NormalAttribute;
export 'src/or.dart' show Or;
export 'src/parse_attribute.dart' show parseAttribute;
export 'src/postgresql_dao.dart' show PostgresqlDao;
export 'src/where.dart' show Where;
export 'src/where_attribute.dart' show WhereAttribute;
export 'src/where_method.dart' show parseWhere;
export 'src/where_normal_attribute.dart' show WhereNormalAttributeEqual;
export 'src/where_normal_attribute.dart' show WhereNormalAttributeNotEqual;
export 'src/where_normal_attribute_higher.dart' show WhereNormalAttributeHigher;
export 'src/where_normal_attribute_in.dart' show WhereNormalAttributeIn;
export 'src/where_normal_attribute_not_in.dart' show WhereNormalAttributeNotIn;
export 'src/where_search.dart' show WhereNormalSearch;


// TODO: Export any libraries intended for clients of this package.
