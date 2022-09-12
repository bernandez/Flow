import 'package:flow/providers/flow_water_sources_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flow/constants.dart';
import 'package:flow/Components/sources_list_item.dart';
import 'package:provider/provider.dart';
import '../Components/flow_app_bar.dart';

class FlowFindScreen extends StatefulWidget {
  const FlowFindScreen({Key? key}) : super(key: key);

  @override
  _FlowFindScreenState createState() => _FlowFindScreenState();
}

class _FlowFindScreenState extends State<FlowFindScreen> {
  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<FlowWaterSourcesData>(
      builder: (context, flowSourcesData, child) {
        return Scaffold(
          appBar: FlowAppBar(),
          body: SafeArea(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 16),
                child: Text(
                  'Water Sources',
                  style: TextStyle(
                    color: kBlue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: ListView.builder(
                  itemExtent: 50,
                  itemCount: flowSourcesData.flowLocationList.length,
                  itemBuilder: (context, index) {
                    return WaterSourcesListItemFindScreen(
                      waterSource: flowSourcesData.flowLocationList[index],
                    );
                  },
                ),
              ),
            ]),
          ),

          // SearchBar(),
        );
      },
    );
  }
}
