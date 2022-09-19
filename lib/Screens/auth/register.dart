import 'package:flow/constants.dart';
import 'package:flutter/material.dart';

import '../../Components/circular_button.dart';

class CreateAccountScreen extends StatefulWidget {
  static const id = "create account";
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Key emailKey = GlobalKey();
  Key passwordKey = GlobalKey();
  Key nameKey = GlobalKey();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
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
              //firstname
              TextFormField(
                key: nameKey,
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null) {
                    return "Please input your Name";
                  }
                  if (formKey.currentState!.validate()) {
                    return null;
                  }
                },
              ),

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
                  label: "Create Account"),

              Text("Or"),
              FlowButton(
                bgColor: Theme.of(context).scaffoldBackgroundColor,

                  showicon: true,
                  iconLink: "assets/icons/svgs/google-icon.svg",
                  onPressed: () {
                    ///TODO: implemnt google sign in
                  },
                  label: "Sign In With Google"),

            

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyText2),
                    TextSpan(
                        text: "Create One",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Theme.of(context).primaryColor)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
