import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';

Future request(url) async {
  try {
    Response response;
    // 或者通过传递一个 `options`来创建dio实例
    Options options = new Options();
    options.contentType = ContentType.parse("application/json;charset=UTF-8");
    options.headers = {
      HttpHeaders.acceptHeader: "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI1NE8yajgiLCJ1c2VyX25hbWUiOiIxODc0MDM5NzY2NyIsImF1dGhvcml0aWVzIjpbIlBBVElFTlRfUkVBRCIsIlBBVElFTlRfV1JJVEUiXSwianRpIjoiNDJlZTA5MjUtYmM3NC00OWUwLTk5ZGYtNWMwOGExN2YyYjI2IiwiY2xpZW50X2lkIjoicGF0aWVudF9hcHAiLCJzY29wZSI6WyJQQVRJRU5UIl19.f6xoBHuidtbwrj_zJUOyYpPaElkZcvfACiSioyFUResAMJEytDDZEtSXQ7Y7y9j236oZmsfl8rAgFcR0p5Jve4QTEpnkhg_YupJ5GaNMeOHjVxrL8iokkWW8BzfrUmIQJGhKsg4vBXaqQWq6I6bnmMHjGqt6yZlAiCLVO8rQ9K5kyt0Sp9NVALNQhkPcF2ZQa9ebG8g7Hc-4nQS6tq_roHxbk5whpBiWXY9ssVwy5cl32hS7SYUsN0gWDZq39oo88XY0FV3UYsaDG4SNu-3M16Ed9bX3Z_48ZvKBRPZzKenCXiovmIS97LON7UxJOs1A8y7y6LktUq3mMfgWqHJgLA"
    };
    options.responseType = ResponseType.PLAIN;
    Dio dio = Dio(options);
    response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口异常,请检查测试代码与服务器情况!!!");
    }
  } catch (e) {
    return print('error:::${e}');
  }
}
