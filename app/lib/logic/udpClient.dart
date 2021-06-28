import 'dart:io';
import 'dart:convert';

class UDPConnection {
  late final InternetAddress clientAddress;
  final int port;
  RawDatagramSocket? socket;

  UDPConnection({
    required String host,
    required this.port,
  }) {
    clientAddress = InternetAddress(host);
    RawDatagramSocket.bind(InternetAddress.anyIPv4, 0).then((value) {
      socket = value;
    });
  }

  void sendPos(num dx, num dy) async {
    var x = num.parse(dx.toStringAsFixed(3));
    var y = num.parse(dy.toStringAsFixed(3));

    var dict = {'dx': x, 'dy': y};
    var jsObject = jsonEncode(dict);

    print("X:$dx, Y:$dy");

    var tries = 0;
    while (tries < 5) {
      tries += 1;
      if (socket != null) {
        socket!.send(Utf8Codec().encode(jsObject), clientAddress, port);
        return;
      } else {
        await Future.delayed(const Duration(seconds: 1));
        print('Wait a second the socket is not instanced! tries:$tries');
      }
    }
    if (tries > 5) {
      throw Exception(["The <socket> coldn't be instanced!"]);
    }
  }
}
