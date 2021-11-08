String parseList(List<dynamic> list) {
  String result = '';
  for (var i = 0; i < list.length; i++) {
    if (i == list.length - 1) {
      result += '\'${list[i]}\'';
    } else {
      result += '\'${list[i]}\', ';
    }
  }
  print(result);
  return result;
}
