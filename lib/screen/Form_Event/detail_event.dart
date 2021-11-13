import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sineo_sambirejo/model/response_event.dart';
import 'package:sineo_sambirejo/shared/share_event.dart';
// import 'package:url_launcher/url_launcher.dart'; //sende email,sms,whatshapp

class DetailEvent extends StatefulWidget {
  List<Eventlist> list;
  int index;
  DetailEvent({this.index, this.list});

  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  bool _largePhoto = false;
  String whatsappData;
  List<String> imagePaths = [];
  //sendwhatshap to specific number
  // void sendWhatapp({@required number, @required message}) async {
  //   String url = "whatsapp://send?phone=$number&text=$message";
  //   await canLaunch(url) ? launch(url) : print("can't open whatsapp");
  // }

  @override
  Widget build(BuildContext context) {
    DateTime start_event_val =
        DateTime.parse("${widget.list[widget.index].startEvent}");
    String start_event =
        DateFormat('dd MMMM yyyy HH:mm').format(start_event_val);
    return new Scaffold(
        appBar: AppBar(
          title: Text("Detail Event"),
          actions: [
            IconButton(icon: Icon(Icons.share_outlined), onPressed: () {})
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.share_rounded),
          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new ShareEvent(
                    list: widget.list,
                    index: widget.index,
                  ))),
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          reverse: !_largePhoto,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.scaled,
            );
          },
          child: _largePhoto
              ? GestureDetector(
                  onTap: () => setState(() => _largePhoto = !_largePhoto),
                  child: Image.network(
                    "${widget.list[widget.index].path}",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text("${widget.list[widget.index].namaEvent}",
                            style: new TextStyle(fontSize: 30.0)),
                        const SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () =>
                              setState(() => _largePhoto = !_largePhoto),
                          child: Image.network(
                            "${widget.list[widget.index].path}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text("${widget.list[widget.index].temaEvent}",
                            style: new TextStyle(fontSize: 20.0)),
                        Text("${widget.list[widget.index].ayat}",
                            style: new TextStyle(fontSize: 20.0)),
                        Text("${widget.list[widget.index].deskripsiAyat}",
                            style: new TextStyle(fontSize: 20.0)),
                        Text("${widget.list[widget.index].namaKategori}",
                            style: new TextStyle(fontSize: 20.0)),
                        ListTile(
                          leading: const Icon(Icons.today),
                          title: const Text('Tanggal Mulai'),
                          subtitle: Text(start_event),
                        ),
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Pelayan'),
                          subtitle:
                              Text("${widget.list[widget.index].namaPelayan}"),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                  label: Text("Update"),
                  icon: Icon(Icons.edit),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {}),
              ElevatedButton.icon(
                  label: Text("Delete"),
                  icon: Icon(Icons.delete),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {}
                  // => confirm(),
                  )
            ],
          ),
        )
        // Container(
        //   padding: EdgeInsets.all(20.0),
        //   child: Card(
        //     child: Center(
        //       child: Column(
        //         children: <Widget>[
        //           Image.network("${widget.list[widget.index]['path']}"),

        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
