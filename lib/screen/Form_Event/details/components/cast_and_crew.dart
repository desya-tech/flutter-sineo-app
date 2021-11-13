import 'package:flutter/material.dart';
import 'package:sineo_sambirejo/model/response_event.dart';

import 'package:sineo_sambirejo/shared/constants.dart';
import 'cast_card.dart';

class CastAndCrew extends StatelessWidget {
  final List<Eventlist> list;
  final int index;

  const CastAndCrew({Key key, this.list, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Pelayan",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) =>
                  CastCard(list: list, index: index),
            ),
          )
        ],
      ),
    );
  }
}
