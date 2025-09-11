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
      throw CustomExceptions(eMsg: "لقد  حدث خطأ ما. يرجى المحاولة مرة أخرى");
    }
  }
}
