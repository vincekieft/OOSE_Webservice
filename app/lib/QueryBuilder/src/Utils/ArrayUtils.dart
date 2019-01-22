import 'package:OOSE/QueryBuilder/src/IWritable.dart';

class ArrayUtils{
  static String JoinWritables<T extends IWritable>(List<T> array,String separator){
    array.sort((a, b) => a.Order().compareTo(b.Order()));
    return JoinList(array,separator);
  }

  static String JoinMapWritables<A ,T extends IWritable>(Map<A,T> map,String separator){
    List<T> array = new List<T>();
    map.forEach((A key, T value) => array.add(value));
    return JoinWritables(array, separator);
  }

  static String JoinList<T extends Object>(List<T> array, String separator){
    String text = "";
    array.removeWhere((value) => value == null); // filter out null
    for(int i = 0; i < array.length; i++){
      text += array[i].toString();
      if (i < array.length - 1) {
        text += separator;
      }
    }
    return text;
  }

  static String JoinMapValues<A ,T>(Map<A,T> map,String separator){
    List<T> array = new List<T>();
    map.forEach((A key, T value) => array.add(value));
    return JoinList(array, separator);
  }

  static String JoinMapKeys<A ,T>(Map<A,T> map,String separator){
    List<A> array = new List<A>();
    map.forEach((A key, T value) => array.add(key));
    return JoinList(array, separator);
  }
}