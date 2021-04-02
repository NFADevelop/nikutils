import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NkPreferences {
  GetStorage _box;

  void _initializePreferences() {
    _box = GetStorage();
  }

  static Future initializePrefsService() async {
    await GetStorage.init();
    var pref = Get.put(NkPreferences());
    pref._initializePreferences();
  }

  void write<T>(String key, T value) {
    _box.write(key, value);
  }

  T read<T>(String key) {
    return _box.read<T>(key);
  }
}
