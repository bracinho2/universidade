abstract class IRemoteStorageServiceAPI {
  Future<List<Map<String, dynamic>>> getAllItens(
      {required Map<String, dynamic> map});
}
