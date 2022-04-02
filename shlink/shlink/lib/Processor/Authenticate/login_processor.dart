import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<bool> AuthorizeRequestToFireBase(String email, String password) async
{
  try{
    final FirebaseAuth authorizer = FirebaseAuth.instance;
    await authorizer.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final isVerified = await authorizer.currentUser?.emailVerified;

    if(!isVerified!){
      authorizer.currentUser?.sendEmailVerification();
      await SignOutFromFirebase();
      return false;
    }

    return true;
  }catch(e){
    return false;
  }
}

Future<bool> SignOutFromFirebase() async
{
  try{
    final FirebaseAuth authorizer = FirebaseAuth.instance;

    await authorizer.signOut();
    return true;
  }catch(e){
    return false;
  }
}