/// disable exposure delay
///
/// https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.set_options/
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/pretty_print.dart';

Future<http.Response> disableTimer () async {
  var url ='http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        "exposureDelay": 0
      }
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: body
  );
  print("${response.statusCode}");
  prettyPrint("${response.body}");
  return response;
}
