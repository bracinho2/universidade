import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:universidade/core/api_router.dart';
import 'package:universidade/src/company/service/remote_service_interface.dart';
import 'package:universidade/src/keys/api_key.dart';

class RemoteServiceImpl implements IRemoteStorageService {
  final Dio _dio;

  RemoteServiceImpl(this._dio);
  @override
  Future<List<Map<String, dynamic>>> getAllItens() async {
    final _baseUrl = API.url;
    final _jsonRequest = APIRoutes.listarEmpresas;

    final response = await _dio.post(_baseUrl, data: _jsonRequest);
    final values = List<Map<String, dynamic>>.from(jsonDecode(response.data));
    return values;
  }
}
