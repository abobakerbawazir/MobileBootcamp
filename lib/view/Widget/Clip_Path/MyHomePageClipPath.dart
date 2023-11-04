import 'package:flutter/material.dart';
import 'package:talqa_design/view/Widget/Clip_Path/CustomClipPath.dart';

class MyHomePageClipPath extends StatefulWidget {
  const MyHomePageClipPath({Key? key}) : super(key: key);

  @override
  State<MyHomePageClipPath> createState() => _MyHomePageClipPathState();
}

class _MyHomePageClipPathState extends State<MyHomePageClipPath> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        clipBehavior: Clip.none,
        width: MediaQuery.of(context).size.width,
        height: 200,
        color: Color(0xff285A95),
      ),
      clipper: CustomClipPath(),
    );
  }
}