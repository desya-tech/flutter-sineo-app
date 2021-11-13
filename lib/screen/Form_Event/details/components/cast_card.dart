import 'package:flutter/material.dart';
import 'package:sineo_sambirejo/model/response_event.dart';

import 'package:sineo_sambirejo/shared/constants.dart';

class CastCard extends StatelessWidget {
  final List<Eventlist> list;
  final int index;

  const CastCard({Key key, this.list, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kDefaultPadding),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/actor_1.png')),
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            "${list[0].namaPelayan}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          SizedBox(height: kDefaultPadding / 4),
          Text(
            "${list[index].jabatan} - ${list[index].namaGereja}",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(color: kTextLightColor),
          ),
        ],
      ),
    );
  }
}
