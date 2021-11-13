import 'package:flutter/material.dart';
import 'package:sineo_sambirejo/model/response_event.dart';
import 'package:sineo_sambirejo/shared/constants.dart';
import 'package:intl/intl.dart';
import 'package:sineo_sambirejo/shared/share_event.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key key,
    @required this.list,
    @required this.index,
  }) : super(key: key);

  final List<Eventlist> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  list[index].namaEvent,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: kDefaultPadding / 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    "Tema - ${list[index].temaEvent}",
                    style: TextStyle(
                      color: Color(0xFF737599),
                    ),
                  ),
                ),
                // Row(
                // children: <Widget>[
                //   Text(
                //     'tema - ${list[index].temaEvent}',
                //     style: TextStyle(color: kTextLightColor),
                //   ),
                //   SizedBox(width: kDefaultPadding),
                // Text(
                //   '',
                //   style: TextStyle(color: kTextLightColor),
                // ),
                // SizedBox(width: kDefaultPadding),
                // Text(
                //   "2h 32min",
                //   style: TextStyle(color: kTextLightColor),
                // ),
                // ],
                // )
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: FlatButton(
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new ShareEvent(
                        list: list,
                        index: index,
                      ))),
              color: kSecondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.share,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
