import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextNput extends StatefulWidget {
  void Function(String)? onSubmit;

  TextNput({Key? key, this.onSubmit}) : super(key: key);

  @override
  _TextNputState createState() => _TextNputState();
}

class _TextNputState extends State<TextNput> {
  TextEditingController? _controller;

  void submit(String text) {
    print("<text Input>: '$text'");
    if (widget.onSubmit != null) {
      widget.onSubmit!(text);
    }
    _controller?.clear();
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffC4C4C4),
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(
        vertical: 15,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: TextField(
          style: GoogleFonts.patrickHand(),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          cursorColor: Color(0xff8A8E91),
          controller: _controller,
          onSubmitted: submit),
    );
  }
}
