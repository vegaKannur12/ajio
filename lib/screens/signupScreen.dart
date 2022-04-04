import 'package:ajioapp/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String _selectedGender = 'Male';
  bool rememberMe = true;
  var character = '';

  bool value = false;

  bool isPasswordCompliant(String password, [int minLength = 8]) {
    bool isComplient;
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;
    isComplient =
        hasDigits & hasUppercase & hasSpecialCharacters & hasMinLength;
    return isComplient;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Ajio",
                  style: TextStyle(color: Colors.black, fontSize: 23),
                ),
                Text(
                  "join / Sign-in using",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 1,
                  height: size.height * 0.08,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    // keyboardType: numberIn,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 235, 238),
                      hintText: "Your Mobile Number*",
                      hintStyle: TextStyle(fontSize: 15),
                      suffixIcon: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Edit",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please Enter Your Mobile Number';
                      } else if (text.length != 10) {
                        return 'Please check your mobile number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                // SizedBox(,),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "OTP will be send to this number for verification",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Gender",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _selectedGender,
                      onChanged: (val) {},
                    ),
                    Text(
                      'Male',
                      style: new TextStyle(fontSize: 17.0),
                    ),
                    Radio(
                      value: 2,
                      groupValue: _selectedGender,
                      onChanged: (val) {},
                    ),
                    Text(
                      'Female',
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),

                Container(
                  width: size.width * 1,
                  height: size.height * 0.08,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 235, 238),
                      hintText: "Name",
                      hintStyle: TextStyle(fontSize: 15),
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: size.width * 1,
                  height: size.height * 0.08,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 235, 238),
                      hintText: "Your Email Address*",
                      hintStyle: TextStyle(fontSize: 15),
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please Enter Your Email Address';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: size.width * 1,
                  height: size.height * 0.08,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 235, 238),
                      hintText: "Password*",
                      hintStyle: TextStyle(fontSize: 15),
                      suffixIcon: TextButton(
                        onPressed: () {},
                        child: Text(
                          "show",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                    ),
                    validator: (text) {
                      bool s = isPasswordCompliant(text!);
                      if (!s) {
                        return 'please Enter valid Password';
                      }
                    },
                    // validator: (text) {
                    //   if (text == null || text.isEmpty) {
                    //     return 'Please Enter Password';
                    //   } else if (text.length <= 8) return null;
                    // },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.03,
                      color: Color.fromARGB(255, 228, 235, 238),
                      child: Text(
                        "8+ Character",
                        style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.03,
                      color: Color.fromARGB(255, 228, 235, 238),
                      child: Text(
                        "# Special",
                        style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.03,
                      color: Color.fromARGB(255, 228, 235, 238),
                      child: Text(
                        "A Uppercase",
                        style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.03,
                      color: Color.fromARGB(255, 228, 235, 238),
                      child: Text(
                        "1 Number",
                        style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: size.width * 1,
                  height: size.height * 0.08,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 235, 238),
                      hintText: "Invalid Code(optional",
                      hintStyle: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {},
                    ),
                    Text(
                      "By Signing In,I agree to ",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
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
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.065,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      }
                    },
                    child: Text(
                      "Send OTP",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
