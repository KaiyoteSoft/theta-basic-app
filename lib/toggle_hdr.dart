/// disable exposure delay
///
/// https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.set_options/
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/pretty_print.dart';
import 'package:theta_v_basic_app/screens/screen_home.dart';

Future<String> getHdr() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.getOptions',
    'parameters': {
      'optionNames': [
        "_filter",
      ]
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  Map<String, dynamic> hdrType = jsonDecode(response.body);
  String hdrState = hdrType['results']['options']['_filter'];

  return 'HDR is: $hdrState';
}

Future<http.Response> filterToggle () async {
  var url ='http://192.168.1.1/osc/commands/execute';

//  Following code gets hdr state
  Map hdrData = {
    'name': 'camera.getOptions',
    'parameters': {
      'optionNames': [
        '_filter'
      ]
    }
  };
  var hdrBody = jsonEncode(hdrData);

  var hdrResponse = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: hdrBody);

  Map<String, dynamic> hdrType = jsonDecode(hdrResponse.body);
  String hdrState = hdrType['results']['options']['_filter'];

//  Depending on hdr state, toggle between the two modes
  if (hdrState == 'off') {
    hdrState = 'hdr';
  }
  else {
    hdrState = 'off';
  }

//  Actually sets the hdr filter on or off
  Map data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        "_filter": hdrState,
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
  print(hdrState);
  return response;
}
