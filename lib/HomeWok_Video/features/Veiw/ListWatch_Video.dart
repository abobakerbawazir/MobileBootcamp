import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/features/Controller/VideoController/VideoController.dart';
import 'package:video/HomeWok_Video/features/Model/VideoModel/Video.dart';
import 'package:video/HomeWok_Video/features/Veiw/List_is_Empty_16.dart';

class ListWatch_Video extends StatefulWidget {
  List<Video> x;
  ListWatch_Video({
    required this.x,
    super.key,
  });

  @override
  State<ListWatch_Video> createState() => _ListWatch_VideoState();
}

class _ListWatch_VideoState extends State<ListWatch_Video> {
  void deleteVideoTovideoListToRoute(int index) {
    widget.x.removeAt(index);
  }
  // List<Video> items = [
  //   Video(
  //       name: "name",
  //       video_path: "video_path",
  //       image_path: "image_path",
  //       name_icon: Icons.abc,
  //       name_icon_color_red: Icons.abc,
  //       isSelectedIcon: false)
  // ];
  // @override
  // void didChangeDependencies() {
  //   items = ModalRoute.of(context)!.settings.arguments as List<Video>;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return widget.x.isEmpty?ListIsEmpty(): Scaffold(
      appBar: AppBar(
        title: Text("WatchList"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.circle_outlined)),
                  Text("All"),
                  SizedBox(width: MediaQuery.of(context).size.width / 1.45),
                  Expanded(
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete)))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/1.3,
                child: ListView.builder(
                  itemCount: widget.x.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  //   Container(

                                  //   decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //         image: AssetImage(
                                  //             widget.x[index].image_path),
                                  //        ),
                                  //     //color: Colors.red,
                                  //     borderRadius: BorderRadius.circular(5),
                                  //   ),

                                  // ),
                                  Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.x[index].image_path),
                              fit: BoxFit.cover),
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),),
                                  Positioned(
                                      left: 65,
                                      top: 35,
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Colors.yellow,
                                      ))
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10,top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/HD.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    Text(
                                      widget.x[index].name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      widget.x[index].type_Movie,
                                      style: const TextStyle(
                                          color: Colors.yellow, fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/fivestar.png",
                                      width: 80,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {});
                                      deleteVideoTovideoListToRoute(index);

                                      //widget.x.removeAt(index);
                                    },
                                    icon: Icon(Icons.circle_outlined)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Color.fromARGB(255, 109, 107, 107),
                          height: 1,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  
  }
}
