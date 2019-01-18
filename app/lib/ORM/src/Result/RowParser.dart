import 'dart:mirrors';
import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/Annotations/Column.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/FieldAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/ParchedObject.dart';
import 'package:OOSE/ORM/src/Result/QueryParser.dart';
import 'package:OOSE/ORM/src/Result/QueryRow.dart';

class RowParser{

  // Private variables
  QueryParser _parser;
  QueryRow _row;
  Map<String, ParchedObject> _objects = new Map<String, ParchedObject>();

  RowParser(QueryParser parser, QueryRow row){
    _parser = parser;
    _row = row;
    _objects = _ConvertRowToObjects();
  }

  // Private methods
  Map<String, ParchedObject> _ConvertRowToObjects(){
    Map<String, ParchedObject> objects = new Map<String, ParchedObject>();

    int index = 0; // To keep track of current reflection

    _row.values.forEach((String name, dynamic value) {
      if(value != null) { // Only go through column if column exists
        RuntimeClassReflection reflection = _parser.ColumnReflections[index];
        ParchedObject parchedObject = _EnsureInstanceInObjects(objects, reflection); // Ensure object instance exists
        parchedObject.FillColumn(_parser.Result.Fields[index], value); // Fill column
      }
      index++;
    });

    return objects;
  }
  ParchedObject _EnsureInstanceInObjects(Map<String, ParchedObject> objects, RuntimeClassReflection reflection){
    if (!objects.containsKey(reflection.TableAnnotation.Identifier)) {
      objects[reflection.TableAnnotation.Identifier] = new ParchedObject(_NewInstanceOf(reflection), reflection, _row);
    }

    return objects[reflection.TableAnnotation.Identifier];
  }
  InstanceMirror _NewInstanceOf(RuntimeClassReflection reflection){
    ClassMirror mirror = reflectClass(reflection.TableAnnotation.AttachedType);
    return mirror.newInstance(new Symbol(''), []);
  }

  // Getters
  Map<String, ParchedObject> get Objects => _objects;
  QueryRow get Row => _row;
}