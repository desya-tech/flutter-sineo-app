import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';
import 'package:sineo_sambirejo/model/response_event.dart';

import 'package:sineo_sambirejo/shared/image_previews.dart';

class ShareEvent extends StatefulWidget {
  List<Eventlist> list;
  int index;
  ShareEvent({this.index, this.list});

  @override
  _ShareEventState createState() => _ShareEventState();
}

class _ShareEventState extends State<ShareEvent> {
  String text = '';
  String subject = '';
  String whatsappData;
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    DateTime start_event_val =
        DateTime.parse("${widget.list[widget.index].startEvent}");
    String start_event =
        DateFormat('dd MMMM yyyy HH:mm').format(start_event_val);
    setState(() {
      text = "Shallom, Selamat malam 😃\n"
          "📌"
          "*${widget.list[widget.index].namaKategori}*"
          "📌\n"
          "Acara: ${widget.list[widget.index].namaEvent}\n"
          "🗓️Tanggal: $start_event\n"
          "🕍Tempat: ${widget.list[widget.index].namaGereja}\n\n"
          "🔥Firman: ${widget.list[widget.index].namaPelayan}\n"
          "📖Tema: ${widget.list[widget.index].temaEvent}(${widget.list[widget.index].ayat})\n\n"
          "Terimakasih Tuhan Yesus memberkati 😇\n\n"
          "Poster bisa dilihat disini : ${widget.list[widget.index].path}";
    });

    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Share Event Preview'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(text),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  ImagePreviews(imagePaths, onDelete: _onDeleteImage),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add image"),
                    onTap: () async {
                      final imagePicker = ImagePicker();
                      final pickedFile = await imagePicker.getImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          imagePaths.add(pickedFile.path);
                        });
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton.icon(
                        label: Text('Share'),
                        icon: Icon(Icons.share),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent),
                        onPressed: text.isEmpty && imagePaths.isEmpty
                            ? null
                            : () => _onShare(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  }

  _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final RenderBox box = context.findRenderObject() as RenderBox;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }
}
