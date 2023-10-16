import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Exercise1_34_day extends StatefulWidget {
  const Exercise1_34_day({super.key});

  @override
  State<Exercise1_34_day> createState() => _Exercise1_34_dayState();
}

class _Exercise1_34_dayState extends State<Exercise1_34_day>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    super.initState();
  }

  Animation<Size?> gets(context) {
    return SizeTween(
            begin: Size(MediaQuery.of(context).size.width, 0),
            end: Size(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height/2))
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () {
        if (animationController.isCompleted)
          animationController.reverse();
        else
          animationController.forward();
      },
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.blue,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: gets(context).value!.height,
                color: Colors.black,
              ),
            ],
          );
        },
      ),
    ));
  }
}
