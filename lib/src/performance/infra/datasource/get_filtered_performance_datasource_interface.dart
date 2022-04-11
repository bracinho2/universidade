abstract class IGetFilteredPerformanceDatasource {
  Future<List<Map<String, dynamic>>> getFilteredPerformances(
      {required String filter});
}
