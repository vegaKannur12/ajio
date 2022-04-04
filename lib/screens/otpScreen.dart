import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  String logValue;
  OtpScreen({required this.logValue});
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: size.height * 0.6,
                ),
              Text(
                "Join Ajio",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height: size.height * 0.01,
                ),
              Text(
                "Please Enter OTP send to 77363252333",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontFamily: "Poppins"
                    ),
              ),
              SizedBox(
                  height: size.height * 0.025,
                ),
              Container(
                  width: size.width * 0.9,
                  height: size.height * 0.06,
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
                      hintText: "OTP",
                      hintStyle: TextStyle(fontSize: 15),
                      suffixIcon: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.065,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Start Shopping",
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
    );
  }
}
