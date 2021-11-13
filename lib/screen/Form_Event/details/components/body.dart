import 'package:flutter/material.dart';
import 'package:sineo_sambirejo/model/movie.dart';
import 'package:sineo_sambirejo/model/response_event.dart';
import 'package:sineo_sambirejo/screen/Form_Event/details/components/backdrop_rating.dart';
import 'package:sineo_sambirejo/shared/constants.dart';

import 'cast_and_crew.dart';
import 'genres.dart';
import 'title_duration_and_fav_btn.dart';

class Body extends StatelessWidget {
  final List<Eventlist> list;
  final int index;

  const Body({Key key, this.list, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackdropAndRating(size: size, list: list, index: index),
          SizedBox(height: kDefaultPadding / 2),
          TitleDurationAndFabBtn(list: list, index: index),
          Genres(
            kategori: "${list[index].namaKategori}",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            child: Text(
              "${list[index].ayat}",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              "${list[index].deskripsiAyat}",
              style: TextStyle(
                color: Color(0xFF737599),
              ),
            ),
          ),
          // CastAndCrew(casts: movie.cast),
          CastAndCrew(list: list),
        ],
      ),
    );
  }
}
