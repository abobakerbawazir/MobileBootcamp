
import 'package:flutter/material.dart';
//Exercise2_day_30
class Person extends StatefulWidget {
  const Person({super.key});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  String SelECTED = "AI";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),margin: EdgeInsets.all(40),
        child: Column(

          children: [
            Container(child: Text("")),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: DropdownButton(
                hint: Text('Select'),
                  value: SelECTED,
                  onTap: () {},
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      
                        value: "AI",
                        child: ListTile(
                          title: Text("AI"),
                          
                        )),
                    DropdownMenuItem(
                        value: "MVC",
                        child: ListTile(
                          title: Text("MVC"),
                          
                        )),
                    DropdownMenuItem(
                        value: "VP",
                        child: ListTile(
                          title: Text("VP"),
                        
                        )),
                  ],
                  onChanged: (x) {
                    SelECTED = x!;
                    setState(() {

                    });
                    print(x);
                  }),
            ),
            SizedBox(
              height: 20,
            ),Container(height: 100,width: 100,
              child: FloatingActionButton(
                onPressed: () {
                  if (SelECTED != null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Git INFO'),
                          content: Text('Are you sure?'),
                          actions: [
                            Container(height: 100,width: 100,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    //SelECTED = null;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text('Confirm'),
                              ),
                            ),
                            Container(height: 100,width: 100,
                              child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Git INFO'),
              ),
            ),
            
            if (SelECTED != null) ...[
              SizedBox(height: 16.0),
              Text('Selected Value: $SelECTED'),
              SizedBox(height: 8.0),
              Text('Data:'),
              if (SelECTED == 'AI') ...[
                Text('- AI'),
                Text('- 3'),
                Text('- Cs'),
              ] else if (SelECTED == 'MVC') ...[
                Text('- MVC'),
                Text('- 5'),
                Text('- ASP.Net'),
              ] else if (SelECTED == 'VP') ...[
                Text('- VP'),
                Text('- 2'),
                Text('- Descop'),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

