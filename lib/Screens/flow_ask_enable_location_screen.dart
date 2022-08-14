import 'package:flow/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlowAskEnableLocation extends StatefulWidget {
  const FlowAskEnableLocation({Key? key}) : super(key: key);

  @override
  Future<_FlowAskEnableLocationState> createState() async => _FlowAskEnableLocationState();
}

class _FlowAskEnableLocationState extends State<FlowAskEnableLocation> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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

            //SizedBox(height: 10),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
              child: Text(
                'Hmm, We can\'t seem to find you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
              child: Text(
                'Please make sure your location is turned on.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kBlue,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),

            ///Allow Permissions Buttons
            Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kBlue,
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                height: 45,
                child: const Text(
                    'Turn it on',
                  
                ),
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ///TODO: request to tuen on location
                    Navigator.of(context).pop();
                  });
                },
              ),
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
                  'Leave off',
               
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
