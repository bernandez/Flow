import 'package:flow/Components/circular_button.dart';
import 'package:flow/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class FlowOrderScreen extends StatelessWidget {
  static const id = "order screen";
  const FlowOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FlowUserData>(
      builder: (context, userData, child) {
        if (userData.flowUser?.uid != null) {
          return Scaffold(
            body: Column(
              children: const [
                Text("You have an ccount, now you can order"),
                ///TODO: Build ordering page
              ],
            ),
          );
        } else {
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
            children: [
                   Text(" You need an account to place and order", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                  
                      const SizedBox(height: kDefaultPadding2x,),
                  FlowButton(
                      iconLink: "",
                      onPressed: () {
                        ///TODO: nav to sign in page
                      },
                      iconColor: Colors.white,
                      label: "Sign In"),

                      const SizedBox(height: kDefaultPadding,),
                  FlowButton(
                    isSecondary: true,
                      iconLink: "",
                      onPressed: () {
                        ///TODO: nav to create account page
                      },
                      label: "Create Account")
            ],
          ),
                ),
              ));
        }
      },
    );
  }
}
