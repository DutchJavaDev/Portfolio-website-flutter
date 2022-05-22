import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width * 0.55;
    var mHeight = MediaQuery.of(context).size.height * 0.45;
    return Center(
        child: SizedBox(
      width: mWidth,
      height: mHeight,
      child: Container(
        color: Colors.green,
        child: Text("asfsfsfssfsd"),
      ),
    ));
  }
}
