
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Screens/flow_about_screen.dart';
import '../Screens/flow_homescreen.dart';
import '../Screens/flow_saved_screen.dart';
import '../Screens/order/order_screen.dart';

class FlowBottomNavBar extends StatefulWidget {
  const FlowBottomNavBar({Key? key}) : super(key: key);

  @override
  State<FlowBottomNavBar> createState() => _FlowBottomNavBarState();
}

class _FlowBottomNavBarState extends State<FlowBottomNavBar> {
  int currentMenuIndex = 0;

  final List<Widget> _selectedMenuOptions = [
    const FlowHomeScreen(),
    const FlowOrderScreen(),
    const FlowSavedScreen(),
    const FlowAboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          SafeArea(child: _selectedMenuOptions[currentMenuIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,

        currentIndex: currentMenuIndex,
        onTap: (value) {
          currentMenuIndex = value;
          setState(() {});
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            label: ('Home'),
            icon: SvgPicture.asset(
              'assets/icons/svgs/home.svg',
              color: Theme.of(context).iconTheme.color,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/svgs/home_alt_filled.svg',
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Find',
            icon: SvgPicture.asset(
              'assets/icons/svgs/search.svg',
              color:Theme.of(context).iconTheme.color,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/svgs/search_filled.svg',
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Saved',
            icon: SvgPicture.asset(
              'assets/icons/svgs/heart.svg',
              color: Theme.of(context).iconTheme.color,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/svgs/heart_filled.svg',
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          BottomNavigationBarItem(
            label: 'About',
            icon: SvgPicture.asset(
              'assets/icons/svgs/user.svg',
              color:Theme.of(context).iconTheme.color,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/svgs/user_filled.svg',
              color:Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
