import 'package:flutter/material.dart';
import 'package:remoute_mouse/logic/controller.dart';
import 'package:remoute_mouse/logic/network_scan.dart';
import 'button_section.dart';
import 'text_nput.dart';
import 'touch_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String>? adreses;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Controller controller;
    if (adreses != null && adreses?[0] != null) {}
    return Scaffold(
      backgroundColor: Color(0xffD2D1D1),
      body: SafeArea(
        child: FutureBuilder(
          future: scan(),
          initialData: ["192.168.1.10"],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            controller = Controller(ip: snapshot.data.first);
            return Container(
              margin: EdgeInsets.only(
                left: 35,
                right: 35,
                bottom: 35,
              ),
              child: Column(
                children: [
                  ButtonSection(
                    onPress: controller.restApi.press,
                  ),
                  TextNput(
                    onSubmit: controller.restApi.write,
                  ),
                  TouchBar(
                    pos: controller.udpClient.sendPos,
                    onClick: controller.restApi.click,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
