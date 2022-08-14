import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final _auth = FirebaseAuth.instance;

  ///----------Register with email and password-------------///
  void registerUser(BuildContext context,
      {required String email,
      required String password,
      String? firstName,
      String? lastName}) async {
    try {
      final UserCredential? newUser = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (newUser != null) {
        // Navigator.pushNamed(context, HomeScreen.id);
      }
    } catch (e) {
      ///TODO: show snackbar when failed
      //debugPrint();
    }
  }

  ///-----------Sign in with email and password---------------///
  void signIn(String email, String password, BuildContext context) async {
    try {
      final UserCredential? loggedInUser = await _auth
          .signInWithEmailAndPassword(email: email, password: password);

      if (loggedInUser != null) {
        //If user is logged in, then allow to acces order page
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  ///---------Sign Out-----------///

  void SIgnOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      /// TODO: deal with soign out erros
    }
  }

  ///--------------Sign In with Google---------------///
  Future<void> signInWithGoogle(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      "email"
          "profile"
    ]);

    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      GoogleSignInAuthentication? googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      UserCredential? loggedInUser =
          await _auth.signInWithCredential(credential);

      if (loggedInUser != null) {
        ///Show the order page
      }
    } catch (e) {
      //TODO: deal with any error
    }
  }

  ///----------Get Current User--------------///

  User? getCurrentUser() {
    final User? currentUser = _auth.currentUser;
    return currentUser;
  }


}
