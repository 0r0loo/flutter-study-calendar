import 'package:drift/drift.dart';

class CategoryColors extends Table {
  // PRIMARY KEy
  IntColumn get id => integer().autoIncrement()();

  // hexcode
  TextColumn get hexCode => text()();
}
