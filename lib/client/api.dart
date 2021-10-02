import 'dart:async';

import 'package:dio/dio.dart';

class Api {
  String get _url => 'https://pokeapi.co/api/v2';
  String _getUrl(String endpoint) => '$_url/$endpoint';

  Future<T> getRequest<T>({
    required String path,
    Map<String, dynamic>? parameters,
    required T Function(Map<String, dynamic> response) constructor,
  }) async {
    var completer = Completer<T>();
    Dio dio = Dio();
    await dio.get(_getUrl(path), queryParameters: parameters).then((value) {
      completer.complete(constructor(value.data));
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }
}
