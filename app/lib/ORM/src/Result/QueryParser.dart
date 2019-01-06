import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/ParchedObject.dart';
import 'package:OOSE/ORM/src/Result/QueryResult.dart';
import 'package:OOSE/ORM/src/Result/QueryRow.dart';
import 'package:OOSE/ORM/src/Result/RowParser.dart';

class QueryParser<T>{

  // Private variables
  QueryResult _result;
  ORM _orm;
  List<RuntimeClassReflection> _columnReflections;
  Map<String, RuntimeClassReflection> _tableReflections;

  QueryParser(QueryResult result, ORM orm){
    _result = result;
    _orm = orm;
    _orm.EnsureRuntimeReflection(T); // Ensure reflections
    _columnReflections = _GetColumnReflections(_result);
    _tableReflections = _GetTableReflections(result);
  }

  // Public methods
  List<T> ParseQuery(){
    Map<String, Map<dynamic, ParchedObject>> objects = FetchUniqueObjects();

    // Resolve associations
    objects.forEach((String table, Map<dynamic, ParchedObject> instances){
      instances.forEach((dynamic identifier, ParchedObject object){
        ResolveObjectAssociations(object, objects);
      });
    });

    // Format results
    return FormatResult(objects);
  }

  // Private methods
  Map<String, Map<dynamic, ParchedObject>> FetchUniqueObjects(){
    Map<String, Map<dynamic, ParchedObject>> objects = new Map<String, Map<dynamic, ParchedObject>>();

    for (QueryRow row in _result.Rows) {
      RowParser rowParser = new RowParser(this, row);

      int index = 0;
      rowParser.Objects.forEach((String table, ParchedObject object){
        if(!objects.containsKey(table)){ objects[table] = new Map<dynamic, ParchedObject>(); } // Ensure table exists in map
        dynamic identifier = object.Identifier;
        identifier = (identifier != null) ? identifier : index; // If object identifier is null identifier is index
        objects[table][identifier] = object;
        index++;
      });
    }

    return objects;
  }
  void ResolveObjectAssociations(ParchedObject object, Map<String, Map<dynamic, ParchedObject>> others){
    if(object.Reflection.Associations.length > 0){ // If there are associations
      object.Reflection.Associations.forEach((AssociationAnnotationDecorator<Association> association){
        association.Identifiable.ResolveAssociation(association,object,others);
      });
    }
  }
  List<T> FormatResult(Map<String, Map<dynamic, ParchedObject>> objects){
    RuntimeClassReflection targetReflection = _orm.GetRuntimeReflection(T);
    Map<dynamic, ParchedObject> resultMap = objects[targetReflection.TableAnnotation.Identifier];

    // Actual formatting
    List<T> result = new List<T>();
    resultMap.values.forEach((ParchedObject object){
      result.add(object.Object as T);
    });

    return result;
  }


  // Private methods
  Map<String, RuntimeClassReflection> _GetTableReflections(QueryResult result){
    Map<String, RuntimeClassReflection> reflections = new Map<String, RuntimeClassReflection>();
    result.Tables.forEach((String table){
      if(!reflections.containsKey(table)){
        reflections[table] = _orm.GetRuntimeReflectionTable(table);
      }
    });
    return reflections;
  }
  List<RuntimeClassReflection> _GetColumnReflections(QueryResult result){
    List<RuntimeClassReflection> reflections = new List<RuntimeClassReflection>();
    result.Tables.forEach((String table){
      reflections.add(_orm.GetRuntimeReflectionTable(table));
    });
    return reflections;
  }

  // Getters
  QueryResult get Result => _result;
  List<RuntimeClassReflection> get ColumnReflections => _columnReflections;
  Map<String, RuntimeClassReflection> get TableReflections => _tableReflections;
}