import 'package:flow/constants.dart';
import 'package:flutter/material.dart';
import 'package:flow/Components/flow_maps.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../Components/circular_button.dart';

class FlowHomeScreen extends StatefulWidget {
    static const id = "home screen";
  const FlowHomeScreen({Key? key}) : super(key: key);

  @override
  _FlowHomeScreenState createState() => _FlowHomeScreenState();
}

class _FlowHomeScreenState extends State<FlowHomeScreen> {
  // double shortestDistance;
  // String closestSourceDistance;
  // String closestSourceID;
  // String closestSourceDescription;
  // List<double> sourceDistancesList;
  // LatLng currentLocation;
  // LatLng markerLocation;
  // GeoPoint firebaseLocation;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: FlowAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    height: screenSize.height * .65,
                    margin: const EdgeInsets.only(top: kDefaultPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefaultPadding2x)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                        child: FlowMaps()),
                  ),
                  Positioned(
                    bottom: kDefaultPadding / 2,
                    right: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // toggle map type button
                        FlowCircularButton(
                          iconLink: 'assets/icons/svgs/map_change.svg',
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            Feedback.forTap(context);

                            ///TODO: add method to swtich map type
                          },
                        ),

                        FlowCircularButton(
                          iconLink: 'assets/icons/svgs/zoom_out.svg',
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            Feedback.forTap(context);

                            ///TODO: implement map resizing
                          },
                        ),

                        // SearchClosestSourceButton(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              Text(
                "Tap 1",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              Text(
                "Description located behind this building",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: kDefaultPadding / 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Flowing",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18, color: Theme.of(context).primaryColor)),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text(
                    "20 m",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/svgs/heart.svg",
                          color: Theme.of(context).iconTheme.color,
                        )),
                    FlowButton(
                      iconLink: "assets/icons/svgs/heart.svg",
                      onPressed: () {},
                      label: "Get Directions",
                      bgColor: Theme.of(context).primaryColor,
                      iconColor: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
