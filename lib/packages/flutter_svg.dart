import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlutterSvgPackages extends StatelessWidget {
  const FlutterSvgPackages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset("assets/images/d2.svg"),
      ),
    );
  }
}
