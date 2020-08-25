import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/pretty_print.dart';

Future<String> info() async {
  var url = 'http://192.168.1.1/osc/info';
  var response = await http.get(url);

  prettyPrint(response.body);
  return outputPrettyPrint(response.body);
}
