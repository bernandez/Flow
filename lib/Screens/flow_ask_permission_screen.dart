import 'package:flow/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlowAskPermissions extends StatefulWidget {
  const FlowAskPermissions({Key? key}) : super(key: key);

  @override
  _FlowAskPermissionsState createState() => _FlowAskPermissionsState();
}

class _FlowAskPermissionsState extends State<FlowAskPermissions> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBlue,
      body: SafeArea(
        child: Column(
          children: [
            /// Image and text Area
            const Spacer(),
            Container(
              padding: EdgeInsets.only(
                  left: screenWidth * .1, right: screenHeight * .15),
              //width: screenWidth * .8,
              child: SvgPicture.asset(
                'assets/illustrations/request-location-on.svg',
                height: screenHeight * .5,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
              child: const Text(
                'Flow needs access to your location for certain features to work properly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
              child: const Text(
                'Allow Flow to access your location?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ///Allow Permissions Buttons
            Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                height: 45,
                child: const Text(
                    'Allow Permissions',
                   
                ),
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                  //  TODO: request permissions
                    Navigator.of(context).pop();
                  });
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pop();
                });
              },
              color: Colors.transparent,
              child: const Text(
                  'Deny',
                
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
