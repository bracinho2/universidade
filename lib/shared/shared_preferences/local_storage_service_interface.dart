abstract class ILocalStoragePreferences {
  Future<String?> load({required String info});
  void save({required String info, required String data});
  void remove({required String info});
}
