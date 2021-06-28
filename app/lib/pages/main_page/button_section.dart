import 'package:flutter/material.dart';

// TO:DO Refactor this code.
class ButtonSection extends StatelessWidget {
  final Function(List keys) onPress;

  const ButtonSection({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstrow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            onPress(["esc"]);
          },
          child: Container(
            width: 73,
            height: 56,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              color: Color(0xff6D000A),
            ),
            child: Center(
              child: Text(
                "Esc",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  onPress(["pageup"]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xff2D2D34),
                  ),
                  width: 47,
                  height: 43,
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              GestureDetector(
                onTap: () {
                  onPress(["pagedown"]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xff2D2D34),
                  ),
                  width: 47,
                  height: 43,
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );

    var secondrow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            onPress(["left"]);
          },
          child: Container(
            height: 59,
            width: 59,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff2D2D34),
            ),
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
        ), //left key
        GestureDetector(
          onTap: () {
            onPress(["space"]);
          },
          child: Container(
            height: 59,
            width: 94,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color(0xff474A2C),
            ),
            child: Center(
              child: Text(
                "Space",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ), //space key
        GestureDetector(
          onTap: () {
            onPress(["right"]);
          },
          child: Container(
            height: 59,
            width: 59,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff2D2D34),
            ),
            child: Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
        ), //right key
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15,
      ),
      height: MediaQuery.of(context).size.height * 0.26,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          firstrow,
          secondrow,
        ],
      ),
    );
  }
}
