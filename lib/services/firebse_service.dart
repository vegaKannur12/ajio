import 'package:ajioapp/screens/loginScreen.dart';
import 'package:ajioapp/screens/productScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  /////////////////////////google signin/////////////////
  Future<void> signup(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        var prefs = await SharedPreferences.getInstance();
        prefs.setString("email", user!.email!);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProductScreen()));
        //return result.user;

      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  /////////////////////////////////////signinwithotp/////////////////////////////////

  Future<void> signupinwithOtp(
      BuildContext context, String verId, String smsCode) async {
    final AuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
        UserCredential usercreds = await auth.signInWithCredential(credential);
         User?  current_user = await auth.currentUser;  
         assert(usercreds.user!.uid==current_user!.uid);
         
  }

  // void checkUserLog(BuildContext context) async {
  //   final user = await auth.currentUser;
  //   if (user != null) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => ProductScreen()));
  //   }
  // }

  //////////////////////////signout////////////////////
  Future<void> logOut(BuildContext context) async {
    await auth.signOut();
    await googleSignIn.signOut();
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("email");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
