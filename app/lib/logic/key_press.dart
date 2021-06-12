import 'package:http/http.dart' as http;

import '../configs.dart';

const ip = "$remoteIp:5005";

const urlpress = "http://$ip/press_key/";
const urlcombination = "http://$ip/press_combination/";
const urlmouseclick = "http://$ip/mouseclick/";

void sendcomand(String key) async {
  var response = await http.get(urlpress + key);
  /*if (response.statusCode == 200){
    print(response.body);
  } else {
    print("Something went wrong");
  }*/
}

void sendcomand_combination(String key) async {
  var response = await http.get(urlcombination + key);
  /*if (response.statusCode == 200){
    print(response.body);
  } else {
    print("Something went wrong");
  }*/
}

void mouseclick(bool typeof) async {
  if (typeof) {
    var response = await http.get(urlmouseclick + 'right');
    /*if (response.statusCode == 200){
      print(response.body);
    } else {
      print("Something went wrong");
    }*/
  } else {
    var response = await http.get(urlmouseclick + 'left');
    /*if (response.statusCode == 200){
      print(response.body);
    } else {
      print("Something went wrong");
    }*/
  }
}
