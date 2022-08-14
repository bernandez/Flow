import 'package:flutter/material.dart';
import 'package:flow/constants.dart';
import 'package:flow/Components/flow_app_bar.dart';
import 'package:provider/provider.dart';

import '../Components/sources_list_item.dart';
import '../providers/flow_water_sources_data_provider.dart';

class FlowSavedScreen extends StatefulWidget {
  const FlowSavedScreen({Key? key}) : super(key: key);

  @override
  _FlowSavedScreenState createState() => _FlowSavedScreenState();
}

class _FlowSavedScreenState extends State<FlowSavedScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<FlowWaterSourcesData>(
      builder: (context, flowSourcesData, childe) {
        if (flowSourcesData.savedLocationsList.isEmpty) {
          return Scaffold(
            //backgroundColor: Colors.white,
            appBar: FlowAppBar(),
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * .25),
                      child: Image.asset('assets/images/placeholder_image.png'),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * .15),
                      child: Text(
                        'You haven\'t saved any water sources yet',
                        style: TextStyle(
                            color: kBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Once you save some, they\'ll appear here',
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: screenHeight * .15,
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: FlowAppBar(),
            body: SafeArea(
              child: Stack(
                children: [
                  // SearchBar(),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 16),
                      child:  Text(
                        'Saved \nWater Sources',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: ListView.builder(
                      itemCount: flowSourcesData.savedLocationsList.length,
                      itemExtent: 50,
                      itemBuilder: (BuildContext context, int index) {
                        return WaterSourcesListItemSavedScreen(
                          waterSource:
                              flowSourcesData.savedLocationsList[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: FlowBottomNavBar(),
          );
        }
      },
    );
  }
}
