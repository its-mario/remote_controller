import 'package:flutter/material.dart';

import 'widgets/Components.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color(0xffBEBBBB),
      body: SafeArea(
          child: Container(
        child: Column(
          children: <Widget>[
            MyTouchBar(),
            SizedBox(
              height: 25,
            ),
            RowOne(),
            SizedBox(
              height: 54,
            ),
            RowTwo(),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
      )),
    ),
  ));
}
