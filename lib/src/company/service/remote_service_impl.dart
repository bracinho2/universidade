import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:universidade/src/company/service/remote_service_interface.dart';
import 'package:universidade/src/keys/api_key.dart';

class RemoteServiceImpl implements IRemoteStorageService {
  @override
  Future<List<Map<String, dynamic>>> getAllItens() async {
    final Dio _dio = Dio();

    final _baseUrl = API.url;
    final _jsonRequest = {
      "dominio": API.dominio,
      "senha": API.senha,
      "classe": "empresa",
      "metodo": "listar"
    };

    final response = await _dio.post(_baseUrl, data: _jsonRequest);
    final values = List<Map<String, dynamic>>.from(jsonDecode(response.data));
    return values;
  }
}
