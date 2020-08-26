/// https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.set_options/
/// https://api.ricoh/docs/theta-web-api-v2.1/options/exposure_delay/
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/pretty_print.dart';


Future<http.Response> toggleMode () async {
  var url ='http://192.168.1.1/osc/commands/execute';

  Map data2 = {
    'name': 'camera.getOptions',
    'parameters': {
      'optionNames': [
        "captureMode",
      ]
    }
  };

  var captureBody = jsonEncode(data2);

  var captureResponse = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: captureBody
  );
  Map<String, dynamic> captureType = jsonDecode(captureResponse.body);

  String captureMode = captureType['results']['options']['captureMode'];

  if (captureMode == 'video') {
    captureMode = 'image';
  }
  else {
    captureMode = 'video';
  }

  Map data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        "captureMode": captureMode
      }
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: body
  );
  prettyPrint("${response.body}");
  return response;
}