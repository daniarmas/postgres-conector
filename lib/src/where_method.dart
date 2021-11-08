import 'package:postgres_conector/postgres_conector.dart';

String parseWhere({required List<Where>? where, required String table}) {
  // Where
  String whereResult = '';
  if (where != null && where.isNotEmpty) {
    String whereString = '';
    for (int i = 0; i < where.length; i++) {
      if (i == 0) {
        if (where[i] is And) {
          var and = where[i] as And;
          for (var y = 0; y < and.attributes.length; y++) {
            var item = and.attributes[y];
            if (y == 0) {
              if (item is WhereNormalAttributeEqual) {
                whereString += '"$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += '"$table".${item.key} != \'${item.value}\' ';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\'';
              }
            } else {
              if (item is WhereNormalAttributeEqual) {
                whereString += ' AND "$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString +=
                    ' AND "$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeHigher) {
                whereString += ' AND "$table".$item';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += ' AND ${item.key} = \'${item.value}\'';
              }
            }
          }
        } else if (where[i] is Or) {
          var and = where[i] as Or;
          for (var y = 0; y < and.attributes.length; y++) {
            var item = and.attributes[y];
            if (y == 0) {
              if (item is WhereNormalAttributeEqual) {
                whereString += '"$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += '"$table".${item.key} != \'${item.value}\' ';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value == '') {
              } else if (where[y] is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
              } else {
                whereString += '${item.key} = \'${item.value}\'';
              }
            } else {
              if (item is WhereNormalAttributeEqual) {
                whereString += ' OR "$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += ' OR "$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeHigher) {
                whereString += ' OR "$table".$item';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += ' OR ${item.key} = \'${item.value}\'';
              }
            }
          }
        } else {
          var item = where[i] as WhereAttribute;
          if (item is WhereNormalAttributeEqual) {
            whereString += '"$table".${item.key} = \'${item.value}\'';
          } else if (item is WhereNormalAttributeNotEqual) {
            whereString += '"$table".${item.key} != \'${item.value}\' ';
          } else if (item is WhereNormalAttributeNotIn && item.value != '') {
            whereString += '"$table".${item.key} ${item.value}';
          } else if (item is WhereNormalAttributeHigher) {
            whereString += '"$table".$item';
          } else if (item is WhereNormalAttributeNotIn && item.value == '') {
          } else if (item is WhereNormalAttributeIn && item.value != '') {
            whereString += '"$table".${item.key} ${item.value}';
          } else if (item is WhereNormalAttributeIn && item.value == '') {
          } else {
            whereString += '${item.key} = \'${item.value}\'';
          }
        }
      } else {
        whereString += ' AND ';
        if (where[i] is And) {
          var and = where[i] as And;
          for (var y = 0; y < and.attributes.length; y++) {
            var item = and.attributes[y];
            if (y == 0) {
              if (item is WhereNormalAttributeEqual) {
                whereString += '"$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += '"$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\' ';
              }
            } else {
              if (item is WhereNormalAttributeEqual) {
                whereString += ' AND "$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString +=
                    ' AND "$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += ' AND ${item.key} = \'${item.value}\' ';
              }
            }
          }
        } else if (where[i] is Or) {
          var and = where[i] as Or;
          for (var y = 0; y < and.attributes.length; y++) {
            var item = and.attributes[y];
            if (y == 0) {
              if (item is WhereNormalAttributeEqual) {
                whereString += '"$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += '"$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\' ';
              }
            } else {
              if (item is WhereNormalAttributeEqual) {
                whereString += ' OR "$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += ' OR "$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeHigher) {
                whereString += ' OR "$table".$item';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += ' OR ${item.key} = \'${item.value}\' ';
              }
            }
          }
        } else {
          var item = where[i] as WhereAttribute;
          if (item is WhereNormalAttributeEqual) {
            whereString += ' "$table".${item.key} = \'${item.value}\' ';
          } else if (item is WhereNormalAttributeNotEqual) {
            whereString += ' "$table".${item.key} != \'${item.value}\' ';
          } else if (item is WhereNormalAttributeNotIn && item.value != '') {
            whereString += ' "$table".${item.key} ${item.value} ';
          } else if (item is WhereNormalAttributeHigher) {
            whereString += '"$table".$item';
          } else if (item is WhereNormalAttributeNotIn && item.value == '') {
          } else if (item is WhereNormalAttributeIn && item.value != '') {
            whereString += ' "$table".${item.key} ${item.value} ';
          } else if (item is WhereNormalAttributeIn && item.value == '') {
          } else {
            whereString += ' ${item.key} = \'${item.value}\' ';
          }
        }
      }
    }
    whereResult = 'WHERE $whereString';
  }
  return whereResult;
}
