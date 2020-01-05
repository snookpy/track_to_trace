import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_to_trace/pages/styles.dart';
import 'package:track_to_trace/widgets/transportation.dart';

class ProductRowItem extends StatelessWidget {
  // const ProductRowItem({
  //   this.index,
  //   this.product,
  //   this.lastItem,
  // });

  // // final Product product;
  final int index = 0;
  final bool lastItem = false;

  @override
  Widget build(BuildContext context) {
    void showDialog() {
      // CupertinoDialog
      showCupertinoModalPopup(
          context: context,
          builder: (_) {
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
                    "Bad Bag",
                    style: Styles.productRowItemName,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    '\$ 50',
                    style: Styles.productRowItemPrice,
                  )
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.time,
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


