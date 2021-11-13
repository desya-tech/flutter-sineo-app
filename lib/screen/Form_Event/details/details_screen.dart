import 'package:flutter/material.dart';
import 'package:sineo_sambirejo/model/movie.dart';
import 'package:sineo_sambirejo/model/response_event.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  // final Movie movie;
  final List<Eventlist> list;
  final int index;
  const DetailsScreen({Key key, this.list, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Body(list: list, index: index),
      ),
    );
  }
}
