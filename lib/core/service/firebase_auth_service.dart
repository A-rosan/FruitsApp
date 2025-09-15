import 'dart:developer';
import 'dart:convert';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential))
        .user!;
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
