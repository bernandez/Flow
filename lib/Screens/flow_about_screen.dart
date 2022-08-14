import 'package:flow/Components/custom_dialog_route.dart';
import 'package:flow/constants.dart';
import 'package:flutter/material.dart';

class FlowAboutScreen extends StatelessWidget {
  const FlowAboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * .2),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * .25),
                      child: const Image(
                        image: AssetImage('assets/images/flow_logo.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                       'Find water easily around Bambili',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * .07),
                child: Column(
                  children: [
                   const Text(
                      'Developed By'
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Feedback.forTap(context);
                        Navigator.push(
                          context,
                          CustomHeroDialogRoute(
                            builder: (context) {
                              return const TeamFlowNames();
                            },
                          ),
                        );
                      },
                      child: Material(
                        elevation: 0,
                        color: Colors.white,
                        child: Hero(
                          tag: 'teamflowherotag',
                          child: Text('Team Flow',
                              style: TextStyle(
                                  color: kBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * .05,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'This is a project by the Google Developer Student Clubs of the University of Bamenda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TeamFlowNames extends StatelessWidget {
  const TeamFlowNames({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'teamflowherotag',
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                   Text(
                    'Alouzeh Brandone'
                 
                    ),
                    SizedBox(
                      height: 10,
                    ),
                   Text( 'Ida Delphine'
                   
                    ),
                    SizedBox(
                      height: 10,
                    ),
                   Text(
                      'Nuikweh Lewis'
                    
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Chi Karl')
                  
                   , SizedBox(
                      height: 10,
                    ),
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
