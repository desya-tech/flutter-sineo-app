import 'package:flutter/material.dart';
import 'package:sineo_sambirejo/model/movie.dart';
import 'package:sineo_sambirejo/model/response_event.dart';

import 'package:sineo_sambirejo/shared/constants.dart';
import 'package:sineo_sambirejo/shared/genre_card.dart';

class Genres extends StatelessWidget {
  const Genres({
    Key key,
    @required this.kategori,
  }) : super(key: key);

  // final List<Eventlist> list;
  // final int index;
  final kategori;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (context, index) => GenreCard(
            genre: this.kategori,
          ),
        ),
      ),
    );
  }
}
