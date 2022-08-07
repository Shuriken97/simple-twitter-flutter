import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/services/firebase_services.dart';

class LoginModel extends GetxController {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  FirebaseServices firebaseServices = Get.find<FirebaseServices>();

  /// check if form has no error
  bool validate() {
    final FormState? form = loginFormKey.currentState;
    if (form!.validate()) {
      return true;
    }
    return false;
  }

  /// It takes the email and password from the text controllers and passes them to the
  /// firebaseServices.emailPasswordSignIn function.
  Future<void> signIn() async {
    if (validate()) {
      await firebaseServices.emailPasswordSignIn(email: loginEmailController.text.trim(), password: loginPasswordController.text.trim());

      if (Get.isRegistered<LoginModel>()) {
        Get.delete<LoginModel>();
      }
    }
  }
}
