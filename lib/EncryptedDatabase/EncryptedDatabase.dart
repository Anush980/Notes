import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class EncryptedDatabase {
  static EncryptedDatabase get instance => Get.find<EncryptedDatabase>();

  static const String boxName = 'secure_cache';
  late Box box;

  Future<void> init() async {
    final dir = await getApplicationSupportDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox(boxName);
  }

  Future<void> write(String key, dynamic value) async {
    await box.put(key, value);
  }

  dynamic read(String key) {
    return box.get(key);
  }

  Future<void> delete(String key) async {
    await box.delete(key);
  }

  Future<void> clear() async {
    await box.clear();
  }
}
