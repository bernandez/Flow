import 'package:flow/models/flow_location_model.dart';
import 'package:flutter/material.dart';
import 'package:flow/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';


class BottomSheetInfo extends StatefulWidget {
  final FlowLocation waterSource;

  BottomSheetInfo({
    Key? key,
   required this.waterSource,
  }) : super(key: key);

  @override
  BottomSheetInfoState createState() => BottomSheetInfoState();
}

class BottomSheetInfoState extends State<BottomSheetInfo> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      // height: MediaQuery.of(context).size.height * .4,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
        
              SizedBox(width: 8),
              Text(
                  widget.waterSource.name
                 
              )
            ],
          ),
          SizedBox(height: 15),
           Text(
              widget.waterSource.description
          ),
          SizedBox(height: 15),
          Row(
            children: [
               Text(
                  'Type: ',
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                 widget.waterSource.type
                 
              ),
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( 'Status:'),
                    Text(
                     widget.waterSource.isflowing ? "Flowing": "Not Ffowing",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                         
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text( 'Approx. Distance:'),
              
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              FloatingActionButton.extended(
                icon: SvgPicture.asset(
                  'Assets/icons/svgs/fi-rr-directions.svg',
                  color: Colors.white,
                  height: 20,
                ),
                elevation: 0,
                label: Text('Get Directions'),
                backgroundColor: kBlue,
                onPressed: () async {
                 //TODO: add method to get directions

                  Future.delayed(Duration(seconds: 1), () async {
                    //TODO: replace the pop with actual direction data
                    Navigator.pop(context, "dirInfo");
                  });
                },
              ),
              SizedBox(width: 10),
        
              SizedBox(width: 20),
      
            ],
          ),

          /// buttons row
        ],
      ),
    );
  }

}