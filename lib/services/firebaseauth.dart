

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoomcloneproject/data%20models/userStream.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserStreamModel? _userData (User? user) {
    return user != null? UserStreamModel(uid: user.uid) : null;
  }
  Stream<UserStreamModel?> get userStream {
    return _auth.authStateChanges().map((event) => _userData(event));
  }

  dynamic signInWithGoogle() async{
    try{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? gAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication gAuth = await gAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: gAuth.idToken,
      accessToken: gAuth.accessToken,
    );
    final UserCredential result = await _auth.signInWithCredential(credential);
    final User? user = result.user;
    print("Login success");
    } on FirebaseAuthException catch(e){
      print("login error $e");
      return e.message!;    }
  }
}