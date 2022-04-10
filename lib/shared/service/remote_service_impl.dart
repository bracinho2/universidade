import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:universidade/shared/service/remote_service_interface.dart';
import 'package:universidade/src/keys/api_key.dart';

class RemoteServiceImpl implements IRemoteStorageServiceAPI {
  final Dio _dio;

  RemoteServiceImpl(this._dio);

  @override
  Future<List<Map<String, dynamic>>> getAllItens(
      {required Map<String, dynamic> map}) async {
    final _baseUrl = API.url;

    final response = await _dio.post(_baseUrl, data: map);

    final values = List<Map<String, dynamic>>.from(jsonDecode(response.data));

    //dados para teste;
    final mockvalues = [
      {"id": "1", "empresa": "Sulina 01", "cnpj": "1234"},
      {"id": "2", "empresa": "Sulina 01", "cnpj": "5678"},
      {"id": "3", "empresa": "Sulina 01", "cnpj": "1234"},
    ];

    return values;
  }
}
