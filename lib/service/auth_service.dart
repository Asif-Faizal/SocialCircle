import 'package:chattr/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //login function
  //register funtion
  Future registerUserWithEmailandPassword(
      String fullname, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        //call our database services to update user data
        await DatabaseService(uid: user.uid)
            .updateuseData(fullname, email, password);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  //signout function
}
