import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_to_trace/models/tracking_model.dart';

class Transportation extends StatelessWidget {
  const Transportation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trackingState = Provider.of<TrackingModel>(context);
    var trackings = trackingState.trackings;
    return CupertinoPopupSurface(
      child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: trackingState.isFetching
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoActivityIndicator(
                    radius: 24,
                  ))
              : SafeArea(
                  top: false,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
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
                      Expanded(
                        child: CupertinoScrollbar(
                          child: ListView.separated(
                            itemCount: trackings.length,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (BuildContext context, int index) {
                              return RowLogisticDetail(
                                place:
                                    "${trackings[index].statusDescription}, ${trackings[index].location}",
                                placeDate: trackings[index].statusDate,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    RowVerticalLine(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
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
