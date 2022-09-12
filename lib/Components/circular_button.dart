import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class FlowCircularButton extends StatelessWidget {
  final String iconLink;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? bgColor;
  const FlowCircularButton({
    Key? key,
    required this.iconLink,
    required this.onPressed,
    this.iconColor,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        primary: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
        shape: const CircleBorder(),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding - 2),
        child: SvgPicture.asset(
          iconLink,
          color: iconColor ?? Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}

class FlowButton extends StatelessWidget {
  final String? iconLink;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? bgColor;
  final bool showicon;
  final String label;
  final bool? isSecondary;
  const FlowButton({
    Key? key,
 this.iconLink,
    required this.onPressed,
     this.showicon =false,
    required this.label,
    this.iconColor,
    this.isSecondary = false,
    this.bgColor,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        primary: isSecondary!? Colors.transparent:   bgColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultPadding2x),
            side: isSecondary!? BorderSide(width: 1.5, color: bgColor ?? Theme.of(context).primaryColor) : BorderSide.none
            ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding+4, vertical: kDefaultPadding-2),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              showicon
                  ? Padding(
                    padding: const EdgeInsets.only(right: kDefaultPadding/2),
                    child: SvgPicture.asset(
                        iconLink ?? "",
                        color: iconColor ?? Theme.of(context).iconTheme.color,
                      ),
                  )
                  : const SizedBox(),
                  
              Text(
                label,
                style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18, color: isSecondary!? bgColor?? Theme.of(context).primaryColor: iconColor),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}
