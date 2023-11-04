import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';
import 'package:talqa_design/view/Widget/Elevated_Button/Elevated_button_signUp.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  SizedBox textFormFieldVerificationCode() {
    return SizedBox(
      height: 68,
      width: 60,
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
            hintText: '0',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyHomePageClipPath(),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "رمز التحقق",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("يرجى إدخال الرمز المرسل"),
                          Text("إلى جوالك +967775630183 تعديل"),
                          Text(
                            "أو سيتم إرساله إلى رقم الواتساب الخاص بك",
                            style: TextStyle(color: Color(0xff35A097)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                height: MediaQuery.of(context).size.height / 2.2,
              ),
              Form(
                  child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textFormFieldVerificationCode(),
                        textFormFieldVerificationCode(),
                        textFormFieldVerificationCode(),
                        textFormFieldVerificationCode(),
                        textFormFieldVerificationCode(),
                        textFormFieldVerificationCode(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Elevated_button_signUp(
                      backgroundColor: Color(0xffF2902F),
                      foregroundColor: Colors.white,
                      onPressed: () {},
                      text: "تحقق",
                      width: MediaQuery.of(context).size.width),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("لم يصل الرمز؟"),
                        TextButton(
                            onPressed: () {
                              //Navigator.pushNamed(context, '/loginPage');
                            },
                            child: Text("إعادة الإرسال"))
                      ],
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
