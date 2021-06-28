import 'package:wifi/wifi.dart';

import 'package:ping_discover_network/ping_discover_network.dart';

Future<List<String>> scan() async {
  final String ip = await Wifi.ip;
  final String subnet = ip.substring(0, ip.lastIndexOf('.'));
  final int port = 5005;

  List<NetworkAddress> adressesN;
  final stream = NetworkAnalyzer.discover2(subnet, port);
  // stream.listen((NetworkAddress addr) {
  //   if (addr.exists) {
  //     print('Found device: ${addr.ip}');
  //     adresses.add(addr.ip.toString());
  //   }
  // });
  adressesN = await stream.toList();
  List<String> adresses = [];

  for (NetworkAddress addr in adressesN) {
    //print(addr.ip);
    if (addr.exists) {
      adresses.add(addr.ip);
    }
  }
  //print(adresses);
  return adresses;
}
