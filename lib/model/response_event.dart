// To parse this JSON data, do
//
//     final responseEvent = responseEventFromJson(jsonString);

import 'dart:convert';

ResponseEvent responseEventFromJson(String str) =>
    ResponseEvent.fromJson(json.decode(str));

String responseEventToJson(ResponseEvent data) => json.encode(data.toJson());

class ResponseEvent {
  ResponseEvent({
    this.message,
    this.status,
    this.eventlist,
  });

  String message;
  bool status;
  List<Eventlist> eventlist;

  factory ResponseEvent.fromJson(Map<String, dynamic> json) => ResponseEvent(
        message: json["message"],
        status: json["status"],
        eventlist: List<Eventlist>.from(
            json["eventlist"].map((x) => Eventlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "eventlist": List<dynamic>.from(eventlist.map((x) => x.toJson())),
      };
}

class Eventlist {
  Eventlist({
    this.idEvent,
    this.namaEvent,
    this.temaEvent,
    this.ayat,
    this.deskripsiAyat,
    this.deskripsiEvent,
    this.startEvent,
    this.endEvent,
    this.namaKategori,
    this.namaPelayan,
    this.jabatan,
    this.pesan,
    this.namaGereja,
    this.namaTipePelaksanaan,
    this.namaStatus,
    this.path,
    this.showTypeId,
  });

  int idEvent;
  String namaEvent;
  String temaEvent;
  String ayat;
  String deskripsiAyat;
  String deskripsiEvent;
  DateTime startEvent;
  String endEvent;
  String namaKategori;
  String namaPelayan;
  String jabatan;
  String pesan;
  String namaGereja;
  String namaTipePelaksanaan;
  String namaStatus;
  String path;
  int showTypeId;

  factory Eventlist.fromJson(Map<String, dynamic> json) => Eventlist(
        idEvent: json["id_event"],
        namaEvent: json["nama_event"],
        temaEvent: json["tema_event"],
        ayat: json["ayat"],
        deskripsiAyat: json["deskripsi_ayat"],
        deskripsiEvent: json["deskripsi_event"],
        startEvent: DateTime.parse(json["start_event"]),
        endEvent: json["end_event"],
        namaKategori:
            json["nama_kategori"] == null ? null : json["nama_kategori"],
        namaPelayan: json["nama_pelayan"] == null ? null : json["nama_pelayan"],
        jabatan: json["jabatan"] == null ? null : json["jabatan"],
        pesan: json["pesan"] == null ? null : json["pesan"],
        namaGereja: json["nama_gereja"] == null ? null : json["nama_gereja"],
        namaTipePelaksanaan: json["nama_tipe_pelaksanaan"] == null
            ? null
            : json["nama_tipe_pelaksanaan"],
        namaStatus: json["nama_status"] == null ? null : json["nama_status"],
        path: json["path"],
        showTypeId: json["show_type_id"],
      );

  Map<String, dynamic> toJson() => {
        "id_event": idEvent,
        "nama_event": namaEvent,
        "tema_event": temaEvent,
        "ayat": ayat,
        "deskripsi_ayat": deskripsiAyat,
        "deskripsi_event": deskripsiEvent,
        "start_event": startEvent.toIso8601String(),
        "end_event": endEvent,
        "nama_kategori": namaKategori == null ? null : namaKategori,
        "nama_pelayan": namaPelayan == null ? null : namaPelayan,
        "jabatan": jabatan == null ? null : jabatan,
        "pesan": pesan == null ? null : pesan,
        "nama_gereja": namaGereja == null ? null : namaGereja,
        "nama_tipe_pelaksanaan":
            namaTipePelaksanaan == null ? null : namaTipePelaksanaan,
        "nama_status": namaStatus == null ? null : namaStatus,
        "path": path,
        "show_type_id": showTypeId,
      };
}
