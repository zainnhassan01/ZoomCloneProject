

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoomcloneproject/data%20models/userStream.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
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
    user = result.user;
    if(user != null){
      print("Display name ${user!.displayName}");
      print("Display uid ${user!.uid}");
      return user!.displayName;
    }else {
      return null;
    }
    } on FirebaseAuthException catch(e){
      print("login error $e");
      return e.message!;    }
  }
  //sign out
  dynamic signOut () async {
    try{
    await _auth.signOut();
    return null;
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }
  String? currentUserName(User? user){
    if(_auth.currentUser!= null){
      return _auth.currentUser!.displayName;
    }else {
      return null;
    }
  }
  String? currentUserId(User? user){
    if(_auth.currentUser!= null){
      return _auth.currentUser!.uid;
    }else {
      return null;
    }
  }
    String? currentUserphotoURL(User? user){
    if(_auth.currentUser!= null){
      print("Photo URl -> ${_auth.currentUser!.photoURL}");
      return _auth.currentUser!.photoURL;
    }else {
      return null;
    }
  }
}