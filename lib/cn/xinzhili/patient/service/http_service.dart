import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';

Future request(url) async {
  try {
    Response response;
    // 或者通过传递一个 `options`来创建dio实例
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/json;charset=UTF-8");
    Map<String, String> additionalHttpHeaders = HashMap();
    additionalHttpHeaders["Authorization"] = "aa";
    dio.options.headers = additionalHttpHeaders;
    response = await dio.get(url);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("后端接口异常,请检查测试代码与服务器情况!!!");
    }
  } catch (e) {
    return print('error:::${e}');
  }
}
