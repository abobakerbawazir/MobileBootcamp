import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';
import 'package:video/HomeWok_Video/features/Veiw/VideoPlayerScreenPage.dart';

class PaymentMethod14 extends StatefulWidget {
  const PaymentMethod14({super.key});

  @override
  State<PaymentMethod14> createState() => _PaymentMethod14State();
}

class _PaymentMethod14State extends State<PaymentMethod14> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PAYMENT MOTHED",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 49, 48, 48),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.3,
                image: AssetImage("assets/images/5.jpg"),
                fit: BoxFit.cover),
            color: Colors.black,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Container(
                color: const Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Card Number",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/images/circle.png"))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            // fillColor: Colors.white,
                            // hoverColor: Colors.white,
                            // focusColor: Colors.white,
                            // iconColor: Colors.white,
                            // prefixIconColor: Colors.white,
                            // suffixIconColor: Colors.white,
                            contentPadding: const EdgeInsets.all((3)),
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Card Number",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 25, bottom: 10, top: 10, right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Expiry date",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text("CVV/CVC",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    keyboardType: TextInputType.datetime,
                                    inputFormatters: [
                                      FilteringTextInputFormatter
                                          .singleLineFormatter
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        // fillColor: Colors.white,
                                        // hoverColor: Colors.white,
                                        // focusColor: Colors.white,
                                        // iconColor: Colors.white,
                                        // prefixIconColor: Colors.white,
                                        // suffixIconColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.all((3)),
                                        prefixIcon: const Icon(Icons.search),
                                        hintText: "12  /  2021",
                                        hintStyle: const TextStyle(
                                            color: Colors.white),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(0))),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        counterText: '',
                                        // fillColor: Colors.whit
                                        // e,
                                        // hoverColor: Colors.white,
                                        // focusColor: Colors.white,
                                        // iconColor: Colors.white,
                                        // prefixIconColor: Colors.white,
                                        // suffixIconColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.all((3)),
                                        prefixIcon: const Icon(Icons.search),
                                        hintText: "123",
                                        hintStyle: const TextStyle(
                                            color: Colors.white),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(0))),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Elevated_button_sign_in(
                            height: 70,
                            width: 370,
                            backgroundColor: Color.fromARGB(255, 107, 104, 104),
                            foregroundColor: Colors.yellow,
                            onPressed: () {
                              Navigator.pushNamed(context, '/payment_15_page');
                              // Navigator.push(context, MaterialPageRoute(
                              //   builder: (context) {
                              //     return VideoPlayerScreenPage(
                              //         "assets/videos/1.mp4");
                              //   },
                              // ));
                            },
                            text: "PAY NOW")
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
