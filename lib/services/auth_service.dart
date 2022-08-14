

import 'package:flutter/cupertino.dart';

class FirebaseAuthService{

  final _auth = FirebaseAuth.instance;

///Register with email and password
  void registerUser(BuildContext context, {required String email, required String password, String?  firstName, String? lastName}) async{

    try{
      final UserCredential? newUser = await _auth.createuserWithEmailAndPassword(email: email,  password: password);
    
    if(newUser!=null){
      Navigator.pushNamed(context, HomeScreen.id);
    }
    } catch(e){
///TODO: show snackbar when failed
      debugPrint(e);
    }
  }
}