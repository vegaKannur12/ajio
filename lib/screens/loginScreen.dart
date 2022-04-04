import 'package:ajioapp/screens/otpScreen.dart';
import 'package:ajioapp/services/firebse_service.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController mobile = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? get _errorText {
    final text = mobile.value.text;
    if (text.isEmpty) return 'Please Enter Mobile Number/Email';
    return null;
  }

  FirebaseService service = FirebaseService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  Container(
                    height: size.height * 0.17,
                    width: size.width * 0.18,
                    child: Image.asset(
                      "asset/logo.png",
                    ),
                  ),
                  Text(
                    "Welcome to Ajio",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width * 0.7,
                    height: size.height * 0.065,
                    child: TextFormField(
                      controller: mobile,
                      decoration: InputDecoration(
                        // errorText: _errorText,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 228, 235, 238),
                        hintText: "Enter Mobile Number/Email",
                        hintStyle: TextStyle(fontSize: 15),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please fill the field';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    width: size.width * 0.7,
                    height: size.height * 0.065,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OtpScreen(logValue:mobile.text.toString())));
                        }
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        width: size.width * 0.02,
                        margin: const EdgeInsets.only(left: 5.0, right: 15.0),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      )),
                      Text(
                        "or",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Container(
                          width: size.width * 0.02,
                          margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width * 0.65,
                    child: Row(
                      children: [
                        InkWell(
                          child: Container(
                            width: size.width * 0.32,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Image.asset(
                              "asset/goo.png",
                              // height: size.height*0.02,width: size.width*0.02,
                            ),
                          ),
                          onTap: () {
                            service.signup(context);
                          },
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        InkWell(
                          child: Container(
                            width: size.width * 0.32,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Image.asset("asset/facebook.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: size.width * 0.16,
                      // ),
                      Text(
                        "By Signing In,I agree to ",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: "Roboto"),
                      ),
                      Text(
                        "Terms & Conditions",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.blue,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
