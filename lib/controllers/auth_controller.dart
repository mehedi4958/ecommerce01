import 'package:e_commerce_01/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  ///function to sign up users
  Future<String> signUpUser(
      String fullName, String username, String email, String password) async {
    String result = 'some error occured';
    try {
      if (fullName.isNotEmpty &&
          username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        fireStore.collection('users').doc(userCredential.user!.uid).set({
          'fullName': fullName,
          'username': username,
          'email': email,
        });
        print(userCredential.user!.email);
        result = 'success';
      } else {
        result = 'Fields must not be empty';
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
}
