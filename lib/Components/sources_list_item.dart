import 'package:flow/models/flow_location_model.dart';
import 'package:flow/models/flow_location_model.dart';
import 'package:flow/Components/bottom_sheet_info.dart';
import 'package:flow/models/flow_location_model.dart';
import 'package:flutter/material.dart';
import 'package:flow/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WaterSourcesListItemSavedScreen extends StatelessWidget {
  final FlowLocation waterSource;
  final String? distance;

  const WaterSourcesListItemSavedScreen({
    Key? key,
     required this.waterSource,
    this.distance,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 8),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        /*border: Border.all(color: primarycolor.withOpacity(.5), width: 1),*/
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('ID: ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).primaryColor)),
                Text(waterSource.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).primaryColor)),
              ],
            ),
            Spacer(),
            Text(
              distance ?? "Calculating",
            ),
            Spacer(),
            SvgPicture.asset(
                waterSource.isflowing
                    ? "assets/icons/svgs/flowing-filled.svg"
                    : "assets/icons/svgs/not-flowing.svg",
                color: waterSource.isflowing
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).iconTheme.color),
            IconButton(
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (context) =>
                        BottomSheetInfo(waterSource: waterSource));
              },
              icon: SvgPicture.asset(
                  'assets/icons/svgs/angle-small-down.svg',
                  color: Theme.of(context).iconTheme.color),
            ),
            IconButton(
              onPressed: () {
                //TODO: add method to delete saved location
              },
              icon: SvgPicture.asset(" assets/icons/svgs/trash.svg",
                  color: kFuchsia),
            )
          ],
        ),
      ),
    );
  }
}

class WaterSourcesListItemFindScreen extends StatelessWidget {
  final FlowLocation waterSource;

  const WaterSourcesListItemFindScreen({
    Key? key,
    required this.waterSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 8),
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        /*border: Border.all(color: primarycolor.withOpacity(.5), width: 1),*/
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                waterSource.id,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          SizedBox(width: 10),
          Text(
            "${waterSource.description.substring(0, 20)}...",
          ),
          Spacer(),
          SvgPicture.asset(
              waterSource.isflowing
                  ? "assets/icons/svgs/flowing-filled.svg"
                  : "assets/icons/svgs/not-flowing.svg",
              color: waterSource.isflowing
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color),
          IconButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (context) =>
                      BottomSheetInfo(waterSource: waterSource));
            },
            icon: SvgPicture.asset(
                'assets/icons/svgs/angle-small-down.svg',
                color: Theme.of(context).iconTheme.color),
          )
        ],
      ),
    );
  }
}
