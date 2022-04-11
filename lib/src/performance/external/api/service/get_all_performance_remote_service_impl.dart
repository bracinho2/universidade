import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:universidade/src/keys/api_key.dart';
import 'package:universidade/src/performance/external/api/service/get_all_performance_remote_service_interface.dart';

class GetAllPerformanceRemoteStorageImpl
    implements IGetAllPerformanceRemoteStorage {
  final Dio _dio;

  GetAllPerformanceRemoteStorageImpl(this._dio);

  @override
  Future<List<Map<String, dynamic>>> getAllItens(
      {required Map<String, dynamic> map}) async {
    final _baseUrl = API.url;

    final response = await _dio.post(_baseUrl, data: map);

    final values = List<Map<String, dynamic>>.from(jsonDecode(response.data));

    //dados para teste;
    final mockvalues = [
      {
        "nome": "alexandre",
        "treinamento": "universidade",
        "dataInicial": "10/10/2021",
        "dataFinal": "10/10/2022",
        "nota": "95"
      },
    ];

    return values;
  }
}
