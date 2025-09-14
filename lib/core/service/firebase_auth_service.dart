import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/custom_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createAccountWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in firbaseAuthService.createAccountWithEmailAndPassword: ${e.toString()} ++ ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomExceptions(eMsg: "الرقم السري ضعيف");
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
            eMsg: "لقد تم إنشاء حساب بهذا البريد الإلكتروني");
      } else {
        throw CustomExceptions(
            eMsg: "لقد  حدث خطأ ما. يرجى المحاولة مرة أخرى");
      }
    } catch (e) {
      log("Exception in firbaseAuthService.createAccountWithEmailAndPassword: ${e.toString()}");
      throw CustomExceptions(eMsg: "لقد  حدث خطأ ما. يرجى المحاولة مرة أخرى");
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in firbaseAuthService.signInWithEmailAndPassword: ${e.toString()} ++ ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomExceptions(
            eMsg: " البريد الإلكتروني غير مسجل او كلمة المرور غير صحيحة");
      } else if (e.code == 'wrong-password') {
        log("Exception in firbaseAuthService.signInWithEmailAndPassword: ${e.toString()} ++ ${e.code}");
        throw CustomExceptions(
            eMsg: "البريد الإلكتروني غير مسجل او كلمة المرور غير صحيحة");
      } else if (e.code == 'network-request-failed') {
        log("Exception in firbaseAuthService.signInWithEmailAndPassword: ${e.toString()} ++ ${e.code}");
        throw CustomExceptions(eMsg: "تأكد من الاتصال بالانترنت");
      } else {
        throw CustomExceptions(
            eMsg: "لقد  حدث خطأ ما. يرجى المحاولة مرة أخرى");
      }
    } catch (e) {
      log("Exception in firbaseAuthService.signInWithEmailAndPassword: ${e.toString()}");
      throw CustomExceptions(eMsg: "لقد  حدث خطأ ما. يرجى المحاولة مرة أخرى");
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  // Future<User?> signInWithGoogle() async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser =
  //         await GoogleSignIn.instance.authenticate();

  //     if (googleUser == null) {
  //       // The user canceled the sign-in
  //       return null;
  //     }

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     // Create a new credential (⚠️ accessToken removed in v7+)
  //     final credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken,
  //     );

  //     // Once signed in, return the User
  //     final userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);

  //     return userCredential.user;
  //   } catch (e) {
  //     log("Google Sign-In error: $e");
  //     return null;
  //   }
  // }
}
