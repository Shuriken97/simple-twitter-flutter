import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/components/simple_form_field.dart';
import 'package:simple_twitter/helpers/validators.dart';
import 'package:simple_twitter/views/auth/login/login_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginModel loginModel = Get.put(LoginModel());

    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: loginModel.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SimpleTextField(
                controller: loginModel.loginEmailController,
                labelText: 'Email',
                validator: Validators.email,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SimpleTextField(
                  controller: loginModel.loginPasswordController,
                  labelText: 'Password',
                  obscureText: true,
                  maxLines: 1,
                  validator: (String? value) => Validators.validateEmptyString(value, fieldName: 'Password'),
                ),
              ),
              ElevatedButton(
                onPressed: loginModel.signIn,
                child: const Text('Login'),
              ),
            ],
          ),
        ));
  }
}
