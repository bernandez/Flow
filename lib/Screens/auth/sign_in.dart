import 'package:flow/Components/circular_button.dart';
import 'package:flow/Screens/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class SignInScreen extends StatefulWidget {
  static const id = "sign in screen";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Key emailKey = GlobalKey();
  Key passwordKey = GlobalKey();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
         padding: const EdgeInsets.symmetric( horizontal: kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //email
              TextFormField(
                key: emailKey,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null) {
                    return "Please input your email";
                  } else if (!value.contains("@")) {
                    return "Input a valid email adress";
                  }
                  if (formKey.currentState!.validate()) {
                    return null;
                  }
                },
              ),
              //password
              TextFormField(
                key: passwordKey,
                obscureText: true,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null) {
                    return "Please input your password";
                  } else if (value.length < 8) {
                    return "Password must be atleast 8 Characters";
                  }
                  if (formKey.currentState!.validate()) {
                    return null;
                  }
                },
              ),

              FlowButton(
                  onPressed: () {
                    ///TODO: implemnt sign in
                  },
                  label: "Sign In"),

              Text("Or"),

              FlowButton(
                bgColor: Theme.of(context).scaffoldBackgroundColor,
                
                  showicon: true,
                  iconLink: "assets/icons/svgs/google_icon.svg",
                  onPressed: () {
                    ///TODO: implemnt sign in
                  },
                  label: "Sign In With Google"),

              Row(
                children: [
                  Text("Don't have an account?",
                      style: Theme.of(context).textTheme.bodyText2),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Feedback.forTap(context);

                      Navigator.pushNamed(context, CreateAccountScreen.id);
                    },
                    child: Text(
                      "Create One",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
