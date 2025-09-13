import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/custom_exceptions.dart';

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
}
