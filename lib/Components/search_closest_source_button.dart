import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'show_closest_source_dialog.dart';
import 'custom_dialog_route.dart';
class SearchClosestSourceButton extends StatelessWidget {
  final String _heroShowClosestSourceTag = 'hero_show_closest_source_tag';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(CustomHeroDialogRoute(
          builder: (context) {
            return ShowClosestSourceDialog();
          },
        ));
      },
      child: Hero(
        tag: _heroShowClosestSourceTag,
        child: Material(
          //  decoration: BoxDecoration(
          //   // shape: BoxShape.circle,
          //    color: Colors.white,
          //    borderRadius: BorderRadius.circular(32),
          //  ),
          color: Colors.white,

          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              'assets/icons/svgs/search.svg',
               
            ),
          ),
        ),
      ),
    );
  }
}
