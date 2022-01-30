import 'package:hive/hive.dart';

class HiveHelper {
  String boxName;
  HiveHelper(this.boxName);

  Future<Box> openBox() async {
    return await Hive.openBox(boxName);
  }

  Future<void> add(value, {key, index}) async {
    bool isClosed = !Hive.box(boxName).isOpen;
    if (isClosed) {
      await openBox();
    }

    if (key == null && index == null) {
      addWithoutKeyOrIndex(value);
    } else if (key != null) {
      addWithKey(value, key);
    } else {
      addToIndex(value, index);
    }
  }

  Future<void> update(boxName, value, {key, index}) async {
    bool isClosed = !Hive.box(boxName).isOpen;

    if (isClosed) {
      await openBox();
    }
    if (key != null) {
      updateWithKey(value, key);
    } else {
      updateAtIndex(value, index);
    }
  }

  Future<dynamic> get(boxName, {index, key}) async {
    bool isClosed = !Hive.box(boxName).isOpen;

    if (isClosed) {
      await openBox();
    }
    if (key != null) {
      return getWithKey(key);
    } else if (index != null) {
      return getWithIndex(index);
    } else {
      return getAll();
    }
  }

  Future<dynamic> delete(boxName, {index, key}) async {
    bool isClosed = !Hive.box(boxName).isOpen;

    if (isClosed) {
      await Hive.openBox(boxName);
    }
    if (key != null) {
      await deleteWithKey(key);
    } else if (index != null) {
      await deleteWithIndex(index);
    } else {
      await deleteAll();
    }
  }

  Future<void> addWithoutKeyOrIndex(value) async {
    Hive.box(boxName).add(value);
  }

  Future<void> addWithKey(value, key) async {
    Hive.box(boxName).put(key, value);
  }

  Future<void> addToIndex(value, index) async {
    Hive.box(boxName).putAt(index, value);
  }

  Future<void> updateWithKey(value, key) async {
    Hive.box(boxName).put(key, value);
  }

  Future<void> updateAtIndex(value, index) async {
    Hive.box(boxName).putAt(index, value);
  }

  Future<dynamic> getAll() async {
    return Hive.box(boxName).values.toList();
  }

  Future<dynamic> getWithKey(key) async {
    return Hive.box(boxName).get(key);
  }

  Future<dynamic> getWithIndex(index) async {
    return Hive.box(boxName).getAt(index);
  }

  Future<dynamic> deleteAll() async {
    return Hive.box(boxName).clear();
  }

  Future<dynamic> deleteWithKey(key) async {
    return Hive.box(boxName).delete(key);
  }

  Future<dynamic> deleteWithIndex(index) async {
    return Hive.box(boxName).deleteAt(index);
  }
}
