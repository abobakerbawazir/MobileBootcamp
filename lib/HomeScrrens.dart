import 'package:flutter/material.dart';
import 'package:video/vedioPlayerScerrnspage.dart';

class Video {
  final String name;
  final String video_path;
  final String image_path;

  Video(
      {required this.name, required this.video_path, required this.image_path});
}

class HomeScreens extends StatelessWidget {
  HomeScreens({super.key});
  List<Map<String, dynamic>> icon_name_builder = [
    {"icon": Icons.movie, "name": "MOVIE"},
    {"icon": Icons.add, "name": "SERIES"},
    {"icon": Icons.content_copy, "name": "kIDS CONTENT"},
    {"icon": Icons.abc, "name": "MOVIE"},
    {"icon": Icons.remove, "name": "asd"},
    {"icon": Icons.outbond, "name": "vbgf"},
  ];
  final List<Video> videoList = [
    Video(
        name: 'video1',
        video_path: 'assets/videos/1.mp4',
        image_path: 'assets/images/1.jpg'),
    Video(
        name: 'video2',
        video_path: 'assets/videos/2.mp4',
        image_path: 'assets/images/2.jpg'),
    Video(
        name: 'video3',
        video_path: 'assets/videos/3.mp4',
        image_path: 'assets/images/3.jpg'),
    Video(
        name: 'video4',
        video_path: 'assets/videos/4.mp4',
        image_path: 'assets/images/4.jpg'),
    Video(
        name: 'video5',
        video_path: 'assets/videos/5.mp4',
        image_path: 'assets/images/5.jpg'),
    Video(
        name: 'video6',
        video_path: 'assets/videos/6.mp4',
        image_path: 'assets/images/6.jpg'),
    Video(
        name: 'video7',
        video_path: 'assets/videos/7.mp4',
        image_path: 'assets/images/7.jpg'),
    Video(
        name: 'video8',
        video_path: 'assets/videos/8.mp4',
        image_path: 'assets/images/8.jpg'),
    Video(
        name: 'video9',
        video_path: 'assets/videos/9.mp4',
        image_path: 'assets/images/9.jpg'),
    Video(
        name: 'video10',
        video_path: 'assets/videos/10.mp4',
        image_path: 'assets/images/10.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    container_drawer(
        {required String Name_image,
        required String Name_Person,
        required String Email_Person}) {
      return Container(
        height: 180,
        child: DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 49, 48, 48),
            ),
            child: Column(
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        margin: EdgeInsets.only(left: 250),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ))),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(Name_image),
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          Name_Person,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          Email_Person,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
      );
    }

    ListTile_me(
        {required IconData Name_icon,
        required String title,
        required String pageNameRoute}) {
      return ListTile(
        leading: Icon(Name_icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          Navigator.pushNamed(context, "/${pageNameRoute}");
        },
      );
    }

    drawer_Me() {
      return Drawer(
        child: Container(
          color: Color.fromARGB(255, 49, 48, 48),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              container_drawer(
                  Name_image: "assets/images/1.jpg",
                  Name_Person: "Ahmed Ali",
                  Email_Person: "Ahmed@gmail.com"),
              ListTile_me(
                  Name_icon: (Icons.person),
                  title: 'My Account',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.person),
                  title: 'About Us',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.settings_input_antenna),
                  title: 'My Subscriptions',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.support),
                  title: 'Support',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.person),
                  title: 'Rate Us',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.logout),
                  title: 'Sign Out',
                  pageNameRoute: 'login'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 48, 48),
        actions: [
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: Text(
                      "TRENDING",
                      style: TextStyle(fontSize: 10),
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: Text(
                      "NEWEST",
                      style: TextStyle(fontSize: 10),
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: Text(
                      "FOR YOU",
                      style: TextStyle(fontSize: 10),
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: Text(
                      "POPULAR",
                      style: TextStyle(fontSize: 10),
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/list_Empty");
                    }),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/1.jpg"),
                      minRadius: 15,
                    )),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          )
        ],
      ),
      drawer: drawer_Me(),
      body: Container(
        color: Color.fromARGB(255, 49, 48, 48),
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: videoList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPlayerScreenPage(
                                    videoList[index].video_path),
                              ),
                            );
                          },
                          child: Container(
                            width: 180,
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(videoList[index].image_path),
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(
                                left: 5, top: 10, bottom: 10, right: 5),
                          ),
                        ),
                      );
                    },
                  )),
            ),
            SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: icon_name_builder.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: InkWell(onTap: () {
                        Navigator.pushNamed(context, "/PaymentMethod14");},
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Icon(icon_name_builder[index]['icon'],
                                      color: Colors.yellow),
                                  width: 80,
                                  height: 80,
                                  // decoration: BoxDecoration(
                                  //   image: DecorationImage(
                                  //       image: AssetImage(images_one_builder[index]),
                                  //       fit: BoxFit.cover),
                                  //   color: Colors.red,
                                  //   borderRadius: BorderRadius.circular(5),
                                  // ),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                      left: 5, top: 10, bottom: 10, right: 5),
                                ),
                              ),
                              Text(
                                icon_name_builder[index]['name'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.black,
              height: 3,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "RENDING IN VIMU",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "SEE ALL",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ))
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: videoList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPlayerScreenPage(
                                        videoList[index].video_path),
                                  ),
                                );
                              },
                              child: Container(
                                width: 180,
                                height: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(videoList[index].image_path),
                                      fit: BoxFit.cover),
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                    left: 5, top: 10, bottom: 10, right: 5),
                              ),
                            ),
                          ),Text(videoList[index].name,style: TextStyle(color: Colors.white),)
                        ],
                      );
                    },
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "NEWEST",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "SEE ALL",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ))
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: videoList.length,
                    itemBuilder: (context, index) {
                      return InkWell( onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreenPage(videoList[index].video_path),
                  ),
                );
              },
                        child: Container(
                          width: 180,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(videoList[index].image_path),
                                fit: BoxFit.cover),
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(
                              left: 5, top: 10, bottom: 10, right: 5),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}













class Home extends StatelessWidget {
  List<String> images_one_builder = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
    "assets/images/5.jpeg",
    "assets/images/6.jpeg",
    "assets/images/7.jpeg",
    "assets/images/8.jpeg",
    "assets/images/9.jpeg",
    "assets/images/10.jpeg",
  ];
  List<Map<String, dynamic>> icon_name_builder = [
    {"icon": Icons.movie, "name": "MOVIE"},
    {"icon": Icons.abc, "name": "SERIES"},
    {"icon": Icons.content_copy, "name": "kIDS CONTENT"},
    {"icon": Icons.abc, "name": "MOVIE"},
    {"icon": Icons.abc, "name": "asd"},
    {"icon": Icons.abc, "name": "vbgf"},
  ];
  @override
  Widget build(BuildContext context) {
    container_drawer(
        {required String Name_image,
        required String Name_Person,
        required String Email_Person}) {
      return Container(
        height: 180,
        child: DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 49, 48, 48),
            ),
            child: Column(
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        margin: EdgeInsets.only(left: 250),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ))),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(Name_image),
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          Name_Person,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          Email_Person, // البريد الإلكتروني
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
      );
    }

    ListTile_me(
        {required IconData Name_icon,
        required String title,
        required String pageNameRoute}) {
      return ListTile(
        leading: Icon(Name_icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          Navigator.pushNamed(context, "/${pageNameRoute}");
        },
      );
    }

    drawer_Me() {
      return Drawer(
        child: Container(
          color: Color.fromARGB(255, 49, 48, 48),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              container_drawer(
                  Name_image: "assets/images/4.jpeg",
                  Name_Person: "Ahmed Ali",
                  Email_Person: "Ahmed@gmail.com"),
              ListTile_me(
                  Name_icon: (Icons.person),
                  title: 'My Account',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.person),
                  title: 'About Us',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.settings_input_antenna),
                  title: 'My Subscriptions',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.support),
                  title: 'Support',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.person),
                  title: 'Rate Us',
                  pageNameRoute: 'login'),
              ListTile_me(
                  Name_icon: (Icons.logout),
                  title: 'Sign Out',
                  pageNameRoute: 'login'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 48, 48),
        actions: [
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: Text(
                      "TRENDING",
                      style: TextStyle(fontSize: 10),
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: Text(
                      "NEWEST",
                      style: TextStyle(fontSize: 10),
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: Text(
                      "FOR YOU",
                      style: TextStyle(fontSize: 10),
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: Text(
                      "POPULAR",
                      style: TextStyle(fontSize: 10),
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/list_Empty");
                    }),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/4.jpeg"),
                      minRadius: 15,
                    )),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          )
        ],
      ),
      drawer: drawer_Me(),
      body: Container(
        color: Color.fromARGB(255, 49, 48, 48),
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images_one_builder.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(images_one_builder[index]),
                              fit: BoxFit.cover),
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            left: 5, top: 10, bottom: 10, right: 5),
                        // child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Maiami",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //       Text(
                        //         "783 proparties",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold),
                        //       )
                        //     ]),
                      );
                    },
                  )),
              //         Column(
              //         children: [
              //           CarouselSlider(
              //               options: CarouselOptions(
              //                   height: 100,
              //                   autoPlay: true,
              //                   autoPlayInterval: Duration(seconds: 2)),
              //               items: [
              //                 Image.asset("assets/images/2.jpeg"),
              //                 Image.asset("assets/images/4.jpeg"),
              //                 Image.asset("assets/images/6.jpeg"),
              //               ])
              //         ],

              // ),
            ),
            SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: icon_name_builder.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: Icon(icon_name_builder[index]['icon'],
                                color: Colors.yellow),
                            width: 80,
                            height: 80,
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //       image: AssetImage(images_one_builder[index]),
                            //       fit: BoxFit.cover),
                            //   color: Colors.red,
                            //   borderRadius: BorderRadius.circular(5),
                            // ),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(
                                left: 5, top: 10, bottom: 10, right: 5),
                          ),
                        ),
                        Text(
                          icon_name_builder[index]['name'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    );
                  },
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.black,
              height: 3,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "RENDING IN VIMU",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "SEE ALL",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ))
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images_one_builder.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(images_one_builder[index]),
                              fit: BoxFit.cover),
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            left: 5, top: 10, bottom: 10, right: 5),
                      );
                    },
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "RENDING IN VIMU",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "SEE ALL",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ))
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images_one_builder.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(images_one_builder[index]),
                              fit: BoxFit.cover),
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            left: 5, top: 10, bottom: 10, right: 5),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
