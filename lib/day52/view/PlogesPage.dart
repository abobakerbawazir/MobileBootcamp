import 'package:day_48_exercise/day52/Controller/BlogsController.dart';
import 'package:day_48_exercise/day52/Model/BlogsModel.dart';
import 'package:day_48_exercise/day52/view/CommentsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlogsPage extends StatefulWidget {
  const PlogsPage({super.key});

  @override
  State<PlogsPage> createState() => _PlogsPageState();
}

class _PlogsPageState extends State<PlogsPage> {
  TextEditingController idtxt = TextEditingController();
  TextEditingController titletxt = TextEditingController();
  TextEditingController contenttxt = TextEditingController();
  List<Blogs>? listBloges = [];
  late BlogsController blogsController = BlogsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: idtxt,
            ),
            TextFormField(
              controller: titletxt,
            ),
            TextFormField(
              controller: contenttxt,
            ),
            TextButton(
              onPressed: () async {
                blogsController.postBlogs(Blogs(
                    title: titletxt.text,
                    content: contenttxt.text,
                    id: idtxt.text));
                setState(() {});
              },
              child: Text("add"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: FutureBuilder(
                future: blogsController.getBlogs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      listBloges = snapshot.data;
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      blogsController.putBlogs(
                                          Blogs(
                                              title: titletxt.text,
                                              content: contenttxt.text,
                                              id: idtxt.text),
                                          index);
                                      setState(() {});
                                    },
                                    child: Text("edit"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      blogsController.deleteBlogs(index);
                                      setState(() {});
                                    },
                                    child: Text("delete"),
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return CommentsPage(
                                          name: listBloges![index].id!,
                                        );
                                      },
                                    ));
                                  },
                                  child: Text(listBloges![index].id!)),
                              Text(listBloges![index].title!),
                              Text(listBloges![index].content!)
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Container(
                          color: Colors.blue,
                          width: 200,
                          height: 200,
                        ),
                      );
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
