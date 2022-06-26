import 'package:flow/providers/flow_water_sources_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowClosestSourceDialog extends StatelessWidget {
  const ShowClosestSourceDialog({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    ///Calculating distances and adding to the List;
    return Consumer<FlowWaterSourcesData>(
        builder: (context, flowSourcesData, child) {
      return CustomAlertHeroDialog(
            child: flowSourcesData.closestLocation == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${flowSourcesData.closestLocation?.id ?? 'Calculating'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'is closest to you, and marked as flowing',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${flowSourcesData.shortestDistance?.toStringAsFixed(2)} Km',
                      ),
                      SizedBox(height: 30),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Feedback.forTap(context);

                                Navigator.of(context).pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 11.0),
                                  child: Text('Lets go!',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () async {
                                Feedback.forTap(context);
                            
                             //TODO: get directions and navigate to homepage

                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                    border: Border.all()),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10.0),
                                  child: Text(
                                    'No thanks',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          );
        }
      );
    
  }
}

class CustomAlertHeroDialog extends StatelessWidget {
  final Widget child;
  final String _heroShowClosestSourceTag = 'hero_show_closest_source_tag';

  const CustomAlertHeroDialog({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: _heroShowClosestSourceTag,
        child: Material(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * .8,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
