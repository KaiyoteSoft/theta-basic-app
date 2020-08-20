import 'package:http/http.dart' as http;
import 'package:theta_v_basic_app/pretty_print.dart';

void state() async {
  var url = 'http://192.168.1.1/osc/state';
  var response = await http.post(url);
  // print(response.body);
  prettyPrint(response.body);
}
