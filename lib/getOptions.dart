import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/pretty_print.dart';

Future<String> getOptions() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  // Map data = {
  //     'name': 'camera.getOptions',
  //     'parameters': {
  //       'optionNames': [
  //         "_filter",
  //       ]
  //     }
  //   };

  /// example 1 for iso and iso support
  // Map data = {
  //   'name': 'camera.getOptions',
  //   'parameters': {
  //     'optionNames': ["iso", "isoSupport", "shutterSpeedSupport"]
  //   }
  // };

  Map data = {
    'name': 'camera.getOptions',
    'parameters': {
      'optionNames': [
        "offDelay",
        "sleepDelay",
        "remainingSpace",
        "_colorTemperature",
        "previewFormat",
        "captureMode",
        "_filter",
        "shutterSpeed",
        "_autoBracket",
        "exposureCompensation",
        "dateTimeZone",
        "sleepDelay"
      ]
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  prettyPrint("${response.body}");
  return outputPrettyPrint(response.body);
}
