import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:sineo_sambirejo/model/response_event.dart';
import 'package:sineo_sambirejo/screen/Form_Event/add_event.dart';
import 'dart:convert';
import 'package:animations/animations.dart';
import 'package:expandable/expandable.dart';
import 'package:sineo_sambirejo/screen/Form_Event/details/details_screen.dart';

import 'package:sineo_sambirejo/service/api_service.dart';
import 'package:sineo_sambirejo/screen/Form_Event/detail_event.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

// import './Detail.dart';
// import 'Add.dart';

class EventList extends StatefulWidget {
  EventList({Key key}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  bool _showList = true;
  bool _slowAnimations = true;
  TextEditingController first_name_val = new TextEditingController();
  List<dynamic> data = [];

  Future<List> searchData() async {
    final response =
        await http.post("http://192.168.1.11/komittab/searchdata.php", body: {
      "firstName": first_name_val.text,
    });
    return json.decode(response.body);
  }

  void searchPopUp() {
    AlertDialog alertDialog = new AlertDialog(
      title: Text("Search"),
      content: TextField(
        controller: first_name_val,
        decoration: InputDecoration(
            labelText: "type name", prefixIcon: Icon(Icons.search)),
      ),
      actions: [
        RaisedButton(
          child: Text("cancel"),
          onPressed: () => Navigator.pop(context),
        ),
        RaisedButton(
          child: Text("Search"),
          onPressed: () => searchData(),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  static const historyLength = 5;

  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
  ];

  List<String> filteredSearchHistory;

  String selectedTerm;

  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: AppBar(
      //   title: const Text('Event KPPM'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.swap_horiz),
      //       onPressed: () => setState(() => _showList = !_showList),
      //     ),
      //   ],
      // ),
      // appBar: new AppBar(
      //   title: new Text("Komittab"),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () => searchPopUp(),
      //     )
      //   ],
      // ),
      resizeToAvoidBottomInset: false,
      body: FloatingSearchBar(
        controller: controller,
        body: FloatingSearchBarScrollNotifier(
          child: MenuList(showList: _showList),
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: Text(
          selectedTerm ?? 'Search Event',
          style: Theme.of(context).textTheme.headline6,
        ),
        hint: 'Search and find out...',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4,
              child: Builder(
                builder: (context) {
                  if (filteredSearchHistory.isEmpty &&
                      controller.query.isEmpty) {
                    return Container(
                      height: 56,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Start searching',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  } else if (filteredSearchHistory.isEmpty) {
                    return ListTile(
                      title: Text(controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        setState(() {
                          addSearchTerm(controller.query);
                          selectedTerm = controller.query;
                        });
                        controller.close();
                      },
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredSearchHistory
                          .map(
                            (term) => ListTile(
                              title: Text(
                                term,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: const Icon(Icons.history),
                              trailing: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    deleteSearchTerm(term);
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  putSearchTermFirst(term);
                                  selectedTerm = term;
                                });
                                controller.close();
                              },
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
      // Stack(
      //   fit: StackFit.expand,
      //   children: [
      //     buildFloatingSearchBar(),
      //     // MenuList(showList: _showList),
      //   ],
      // ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new AddEvent())),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({
    Key key,
    @required bool showList,
  })  : _showList = showList,
        super(key: key);

  final bool _showList;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: _showList ? ListEventShow() : GridViewEvent(),
    );
  }
}

class ListEventShow extends StatelessWidget {
  const ListEventShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: ApiService.getDataEvent(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new ItemList(list: snapshot.data)
            : new Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class GridViewEvent extends StatelessWidget {
  const GridViewEvent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: ApiService.getDataEvent(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new ItemList(list: snapshot.data)
            : new Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class User {
  final String first_name;
  User(this.first_name);
}

class ItemList extends StatelessWidget {
  final List<Eventlist> list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: EdgeInsets.only(top: 80),
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        // debugPrint("Dataaaaaa ::::   $list");
        return Container(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return ExpandableNotifier(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("${list[i].path}"),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true),
                            header: Padding(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                title: new Text("${list[i].namaEvent}"),
                                leading: Icon(Icons.data_usage),
                                subtitle:
                                    new Text("Tema : ${list[i].temaEvent}"),
                              ),
                            ),
                            collapsed: Text(
                              "${list[i].ayat}",
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                for (var _ in Iterable.generate(1))
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "${list[i].ayat} : '${list[i].deskripsiAyat}'",
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ListTile(
                                  leading: const Icon(Icons.today),
                                  title: const Text('Tanggal Mulai'),
                                  subtitle: Text("${list[i].startEvent}"),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.person),
                                  title: const Text('Pelayan'),
                                  subtitle: Text("${list[i].namaPelayan}"),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Expandable(
                                  collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
                // ListTile(
                //   title: new Text("${list[i]['nama_event']}"),
                //   leading: new Image.network("${list[i]['path']}"),
                //   subtitle: new Text("Tema : ${list[i]['tema_event']}"),
                //   // trailing: new Text(list[i]['ayat']),
                // );
              },
              openBuilder: (BuildContext _, VoidCallback __) {
                // return DetailEvent(list: list, index: i);
                return DetailsScreen(list: list, index: i);
              },
              onClosed: (_) => print('Closed'),
            ),
          ),
        );
      },
    );
  }
}
