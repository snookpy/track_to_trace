import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_to_trace/models/package.dart';
import 'package:track_to_trace/pages/styles.dart';
import 'package:track_to_trace/services/thaipostapi_provider.dart';
import 'package:track_to_trace/widgets/transportation.dart';

class ProductRowItem extends StatelessWidget {
  final Package package;
  final bool lastItem;

  const ProductRowItem({@required this.package, this.lastItem = false});

  @override
  Widget build(BuildContext context) {
    void showDialog() {
      // CupertinoDialog
      showCupertinoModalPopup(
          context: context,
          builder: (_) {
            ThaipostApiProvider t = ThaipostApiProvider();
            // t.getToken();
            // t.getTrack("LO423098627CN");
            return Transportation();
          });
    }

    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
        right: 8,
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              'images/id-1.jpeg',
              fit: BoxFit.cover,
              width: 76,
              height: 76,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${package.packageName}",
                    style: Styles.productRowItemName,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    '${package.snNumber}',
                    style: Styles.productRowItemPrice,
                  )
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.location,
              semanticLabel: 'Detail',
            ),
            onPressed: () {
              showDialog();
            },
          ),
        ],
      ),
    );

    if (lastItem) {
      return row;
    }

    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: Styles.productRowDivider,
          ),
        ),
      ],
    );
  }
}
