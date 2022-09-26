import 'package:auto_size_text/auto_size_text.dart';
import 'package:flow/constants.dart';
import 'package:flutter/material.dart';
import 'package:flow/Components/flow_maps.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flow/Components/circular_button.dart';

class FlowDeliveryScreen extends StatefulWidget {
  const FlowDeliveryScreen({Key? key}) : super(key: key);

  @override
  State<FlowDeliveryScreen> createState() => _FlowDeliveryScreenState();
}

class _FlowDeliveryScreenState extends State<FlowDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
     final Size screenSize = MediaQuery.of(context).size;
     return Scaffold(
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
                    height: screenSize.height * .50,
                    margin: const EdgeInsets.only(top: kDefaultPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefaultPadding2x)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                        child: FlowMaps()
                        ),
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
                "Order Details",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: kDefaultPadding ),
              Row(
                children: [
                  Text(
                " Details ",
                 style: TextStyle(fontSize: 24),  
              ),
                ],
               
                        ),
                        SizedBox(height: 12,),

            Container(
              child: Row(
                children: [
                 Flexible(
                   child: Container(
                     child: Text(
                      " You have an order from Montero to deliver 40L of water to MAMI Anne",
                       style: TextStyle(fontSize: 18,                     
                      ),  
                ),
                   ),
                 ),

               

                
                ],
              ),
            ),

            SizedBox(height: 50,),

            Row(
               children: [
                  Text(
                  " 40L",
                   style: TextStyle(fontSize: 24),  
                ),
                 SizedBox(width: 200,),
                Text(
                  " Location",
                   style: TextStyle(fontSize: 24),  
                ),
                ],

            ),

            SizedBox(height: 50,),
            
            Center(
              child: Row(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2.0,color: Theme.of(context).primaryColor),
                      textStyle: const TextStyle(fontSize: 20, ),
                      fixedSize: Size(351, 50),
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(35)
                    )
                    ),
                    onPressed: () {}, 
                    icon: Icon(Icons.location_city_rounded), 
                    label: Text('Accept Order')),
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