
import 'package:flutter/material.dart';

import '../constants.dart';

flowSnackBar(BuildContext context,
    {required String message, required bool isSuccessful}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
     
      width: double.infinity,
      elevation: 30,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: isSuccessful? kBlue: Colors.white),
        ),
      ),
      backgroundColor: isSuccessful?  Colors.white: kFuchsia,
    ),
  ) as Widget;
}
