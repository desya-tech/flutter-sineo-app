import 'dart:convert';

import 'package:sineo_sambirejo/screen/Form_Event/Event_List.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// import 'package:sineo_sambirejo/service/api_service.dart';
import 'package:sineo_sambirejo/shared/datetimepicker_dialog.dart';

class AddEvent extends StatefulWidget {
  AddEvent({Key key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  static final _host = 'https://event-kppm-sambirejo-api.herokuapp.com';
  TextEditingController nama_event_val = new TextEditingController();
  TextEditingController tema_event_val = new TextEditingController();
  TextEditingController ayat_val = new TextEditingController();
  TextEditingController deskripsi_ayat_val = new TextEditingController();
  TextEditingController deskripsi_event_val = new TextEditingController();
  TextEditingController start_event_val = new TextEditingController(
      text: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()).toString());
  TextEditingController end_event_val = new TextEditingController(
      text: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()).toString());
  TextEditingController path_val = new TextEditingController();

  int selectedKategori;
  List kategoriList;
  int selectedPelayan;
  List pelayanList;
  int selectedTipe;
  List tipeList;

  DateTime selectedDate = DateTime.now();
  DateTime selectedDateEnd = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  //untuk validasi
  final _formKey = GlobalKey<FormState>();

  void addData() {
    var url = '$_host/event/save';
    http.post(url, body: {
      "nama_event": nama_event_val.text,
      "tema_event": tema_event_val.text,
      "ayat": ayat_val.text,
      "deskripsi_ayat": deskripsi_ayat_val.text,
      "deskripsi_event": deskripsi_event_val.text,
      "start_event": start_event_val.text,
      "end_event": end_event_val.text,
      "id_kategori_event": selectedKategori.toString(),
      "id_pelayan": selectedPelayan.toString(),
      "id_tipe_pelaksanaan_event": selectedTipe.toString(),
      "path": path_val.text,
    });
  }

  Future getKategori() async {
    var response = await http.get('$_host/event/getkategori');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        kategoriList = jsonData;
      });
    } else {
      return [];
    }
  }

  Future getPelayan() async {
    var response = await http.get('$_host/event/getpelayan');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        pelayanList = jsonData;
      });
    } else {
      return [];
    }
  }

  Future getTipe() async {
    var response = await http.get('$_host/event/gettipe');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        tipeList = jsonData;
      });
    } else {
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    getKategori();
    getPelayan();
    getTipe();
    // kategoriList = ApiService.getKategori();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Tambah Event"), actions: [Icon(Icons.group_add_sharp)]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nama_event_val,
                    decoration: InputDecoration(
                        labelText: "Nama Event",
                        prefixIcon: Icon(Icons.event),
                        suffixIcon: IconButton(
                            onPressed: () => nama_event_val.clear(),
                            icon: Icon(Icons.close))),
                    validator: (nama_event_val) {
                      if (nama_event_val == null || nama_event_val.isEmpty) {
                        return 'Nama Event tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: tema_event_val,
                    decoration: InputDecoration(
                        labelText: "Tema Event", prefixIcon: Icon(Icons.event)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tema Event tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: ayat_val,
                    decoration: InputDecoration(
                        labelText: "Ayat", prefixIcon: Icon(Icons.book)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ayat tidak boleh kosong';
                      }
                      return null;
                    },
                    maxLength: 20,
                  ),
                  TextFormField(
                    controller: deskripsi_ayat_val,
                    decoration: InputDecoration(
                        labelText: "Deskripsi Ayat",
                        prefixIcon: Icon(Icons.book)),
                    // keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),
                  TextFormField(
                    controller: deskripsi_event_val,
                    decoration: InputDecoration(
                        labelText: "Deskripsi Event",
                        prefixIcon: Icon(Icons.description)),
                    maxLines: 3,
                  ),
                  TextFormField(
                    controller: start_event_val,
                    decoration: InputDecoration(
                        labelText: "Tanggal Mulai",
                        prefixIcon: Icon(Icons.event_available)),
                    focusNode: AlwaysDisabledFocusNode(),
                    onTap: () async {
                      showDateTimeDialog(context, initialDate: selectedDate,
                          onSelectedDate: (selectedDate) {
                        setState(() {
                          this.start_event_val.text = selectedDate.toString();
                          this.selectedDate = selectedDate;
                        });
                      });
                    },
                  ),
                  TextFormField(
                    controller: end_event_val,
                    decoration: InputDecoration(
                        labelText: "Tanggal Selesai",
                        prefixIcon: Icon(Icons.event_available)),
                    focusNode: AlwaysDisabledFocusNode(),
                    onTap: () async {
                      showDateTimeDialog(context, initialDate: selectedDateEnd,
                          onSelectedDate: (selectedDateEnd) {
                        setState(() {
                          this.end_event_val.text = selectedDateEnd.toString();
                          this.selectedDateEnd = selectedDateEnd;
                        });
                      });
                    },
                  ),
                  DropdownButtonFormField(
                    hint: Text("--Pilih Kategori--"),
                    value: selectedKategori,
                    icon: const Icon(Icons.category_outlined),
                    items: kategoriList?.map((kategori) {
                          return DropdownMenuItem(
                              value: kategori['id_kategori_event'],
                              child: Text(kategori['nama_kategori']));
                        })?.toList() ??
                        [],
                    onChanged: (value) {
                      setState(() {
                        selectedKategori = value;
                      });
                    },
                    validator: (value) => value == null ? 'isi kategori' : null,
                  ),
                  DropdownButtonFormField(
                    hint: Text("--Pilih Pelayan--"),
                    value: selectedPelayan,
                    icon: const Icon(Icons.person_pin_circle_sharp),
                    items: pelayanList?.map((pelayan) {
                          return DropdownMenuItem(
                              value: pelayan['id_pelayan'],
                              child: Text(pelayan['nama_pelayan']));
                        })?.toList() ??
                        [],
                    onChanged: (value) {
                      setState(() {
                        selectedPelayan = value;
                      });
                    },
                    validator: (value) => value == null ? 'isi pelayan' : null,
                  ),
                  DropdownButtonFormField(
                    hint: Text("--Pilih Tipe Pelaksanaan--"),
                    value: selectedTipe,
                    icon: const Icon(Icons.ondemand_video_outlined),
                    items: tipeList?.map((tipe) {
                          return DropdownMenuItem(
                              value: tipe['id_tipe_pelaksanaan_event'],
                              child: Text(tipe['nama_tipe_pelaksanaan']));
                        })?.toList() ??
                        [],
                    onChanged: (value) {
                      setState(() {
                        selectedTipe = value;
                      });
                    },
                    validator: (value) => value == null ? 'isi tipe' : null,
                  ),
                  Padding(padding: const EdgeInsets.all(10.0)),
                  ElevatedButton(
                      child: new Text("Add Data"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                        // addData();
                        // Navigator.of(context).push(new MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         new EventList()));
                        // setState(() {});
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
