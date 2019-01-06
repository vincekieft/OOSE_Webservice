import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/DatabaseActions/AAction.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';

class FindCollectionAction<T> extends AAction<T>{

  FindCollectionAction(ORM orm) : super(orm){

  }

  @override
  String BuildQuery() {
    QueryBuilder builder = new QueryBuilder("User");

    SelectSection select = builder.Select();

    select.SetNamedColumn("id", "User#id");
    select.SetNamedColumn("name", "User#name");
    select.SetNamedColumn("tel", "User#tel");

    select.SetNamedColumn("id", "Ding#id", "Ding");
    select.SetNamedColumn("ding", "Ding#ding", "Ding");
    select.SetNamedColumn("user_id", "Ding#user_id", "Ding");

    builder.LeftJoin("Ding").EqualColumn("id", "user_id");

    print(builder.Write());

    return builder.Write();
  }
}