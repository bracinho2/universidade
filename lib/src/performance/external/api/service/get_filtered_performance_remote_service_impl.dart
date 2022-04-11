import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:universidade/src/keys/api_key.dart';
import 'package:universidade/src/performance/external/api/service/get_filtered_performance_remote_service_interface.dart';

class GetFilteredPerformanceRemoteStorageImpl
    implements IGetFilteredPerformanceRemoteStorage {
  final Dio _dio;

  GetFilteredPerformanceRemoteStorageImpl(this._dio);

  @override
  Future<List<Map<String, dynamic>>> getAllItens(
      {required Map<String, dynamic> map}) async {
    final _baseUrl = API.url;

    final response = await _dio.post(_baseUrl, data: map);

    final json = Map<String, dynamic>.from(jsonDecode(response.data));

    //print(json['resposta']);

    final values = List<Map<String, dynamic>>.from(json['resposta']);

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
