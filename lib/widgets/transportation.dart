import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transportation extends StatelessWidget {
  const Transportation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: CupertinoScrollbar(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CupertinoButton(
                    child: Icon(
                      CupertinoIcons.clear,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              RowLogisticDetail(
                place: "Muang, Chiangmai",
                placeDate: "04-01-2020",
              ),
              RowVerticalLine(),
              RowLogisticDetail(
                place: "Thailand",
                placeDate: "03-01-2020",
              ),
              RowVerticalLine(),
              RowLogisticDetail(
                place: "China",
                placeDate: "01-01-2020",
              ),
              RowVerticalLine(),
            ],
          ),
        ),
      ),
    );
  }
}

class RowLogisticDetail extends StatelessWidget {
  final String place;
  final String placeDate;

  const RowLogisticDetail(
      {Key key, @required this.place, @required this.placeDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            width: 18,
            height: 18,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$placeDate",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text("$place",
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ],
          ),
        )
      ],
    );
  }
}

class RowVerticalLine extends StatelessWidget {
  const RowVerticalLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child:
              Container(height: 24, child: VerticalDivider(color: Colors.grey)),
        ),
        Expanded(
          flex: 8,
          child: Container(),
        )
      ],
    );
  }
}
