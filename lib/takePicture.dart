import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/pretty_print.dart';
import 'dart:convert';

void takePicture() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  Map executeCommand = {'name': 'camera.takePicture'};

  var body = jsonEncode(executeCommand);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=utf-8'}, body: body);
  print(response.statusCode);
  prettyPrint(response.body);
}
