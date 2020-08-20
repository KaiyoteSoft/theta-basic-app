import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/pretty_print.dart';

Future<String> checkConnection() async {
  var url = 'http://192.168.1.1/osc/info';
  var response = await http.get(url);
  bool connectionStatus = false;

  if (response.statusCode == 200) {
    String message = 'The camera is connected!';
    print(message);
    connectionStatus = true;
  }
  return response.body;
//  prettyPrint(response.body);
}
