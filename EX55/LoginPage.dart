import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mukalla_store/EX55/User2ViewModels.dart';
import 'package:mukalla_store/EX55/towPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserViewModel2 uVM2 = UserViewModel2();
  TextEditingController emailtxt = TextEditingController();
  TextEditingController usernametxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //checkAuth(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("shared_prefernces"),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Username"),
                controller: usernametxt,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                controller: emailtxt,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('showHome', true);
                    //uVM2.checkAuthUser(context);
                    //await uVM2.authUser();
                    //await uVM2.login(emailtxt.text, usernametxt.text);
                    uVM2.saveUserANdEmail(emailtxt.text, usernametxt.text);

                    setState(() {});
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return TowPage();
                      },
                    ));
                  },
                  child: Text("Login")),

              //           Column(
              //   children: [
              //     Center(child: Text("${uVM2.getUsernameorEmailBykey("username")}")),
              //     Text("${uVM2.getUsernameorEmailBykey("email")}"),
              //   ],
              // ),
            ],
          )),
    );
  }
}

checkAuth(BuildContext context) async {
  print("ppppppppppppppppppppppp");
  SharedPreferences shared = await SharedPreferences.getInstance();

  Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context) {
      if (shared.getInt("token") == null) {
        return LoginPage();
      }
      return TowPage();
    },
  ));
}
