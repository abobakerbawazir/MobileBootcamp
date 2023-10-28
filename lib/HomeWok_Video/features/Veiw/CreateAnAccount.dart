import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/Facebook_google_twwetter.dart';
import 'package:video/HomeWok_Video/core/components/My_textformfield_CteateAnAccount.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';

class CreateAnAccount extends StatefulWidget {
  const CreateAnAccount({super.key});

  @override
  State<CreateAnAccount> createState() => _CreateAnAccountState();
}

class _CreateAnAccountState extends State<CreateAnAccount> {
  bool iconObsecure = false;
  bool iconObsecure1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CREATE AN ACCPUNT")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              My_Textformfield_CreateanAccount(
                  labeltext: 'Email', obscureText: false),
              My_Textformfield_CreateanAccount(
                labeltext: 'Password',
                obscureText: iconObsecure,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {});
                    if (iconObsecure == false) {
                      iconObsecure = true;
                    } else {
                      iconObsecure = false;
                    }
                  },
                  icon: Icon(iconObsecure == false
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
              My_Textformfield_CreateanAccount(
                labeltext: 'Re_Password',
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
              SizedBox(
                height: 40,
              ),
              Elevated_button_sign_in(
                  left: 0,
                  right: 0,
                  width: 500,
                  height: 70,
                  backgroundColor: Color.fromARGB(255, 222, 201, 9),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, "/verificationCodePage");
                  },
                  text: "CREATE AN ACCOUNT"),
              SizedBox(
                height: 5,
              ),
              Text(
                "By signing up you agree to cur privacy",
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Policy and Tems",
                style: TextStyle(
                  color: Color.fromARGB(255, 222, 201, 9),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Google_Facebook_Towetter(
                height: 80,
                text1: "Sign Up With Social media",
                text2: "Alredy have an account? ",
                typesign: "Sign In",
                onPressed: () {
                  Navigator.pushNamed(context, "/sign_in");
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
