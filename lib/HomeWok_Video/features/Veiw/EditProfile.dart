import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/My_textformfield_CteateAnAccount.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool iconObsecure1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Stack(
              children: [Container(decoration: BoxDecoration(
                        color: Colors.black,
                        //borderRadius: BorderRadius.circular(500)
                         ),
                    //color: Colors.black,
                    padding: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: ClipOval(
                        child: Image.asset(
                      "assets/imagesvideo/movies4.jpg",
                      width: 60,
                      height: 60,
                    ))),
                Positioned(top: 20,right: 120,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Positioned(top: 22,right: 123,
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.black,
                  ),
                ),
                
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  My_Textformfield_CreateanAccount(
                      labeltext: "Email", obscureText: false),
                  My_Textformfield_CreateanAccount(
                      labeltext: "Full Name", obscureText: false),
                  My_Textformfield_CreateanAccount(
                    labeltext: 'Change password',
                    obscureText: iconObsecure1,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {});
                        if (iconObsecure1 == false) {
                          iconObsecure1 = true;
                        } else {
                          iconObsecure1 = false;
                        }
                      },
                      icon: Icon(iconObsecure1 == false
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  My_Textformfield_CreateanAccount(
                      labeltext: "Phone number", obscureText: false),
                  My_Textformfield_CreateanAccount(
                      labeltext: "Gender", obscureText: false),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
            ),
            Elevated_button_sign_in(
                left: 5,
                right: 5,
                height: 70,
                width: MediaQuery.of(context).size.width / 1.2,
                backgroundColor: Color.fromARGB(255, 107, 104, 104),
                foregroundColor: Color.fromARGB(255, 255, 230, 0),
                onPressed: () {},
                text: "SAVE CHANGES"),
          ],
        ),
      )),
    );
  }
}
