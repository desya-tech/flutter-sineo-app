import 'dart:convert';
// import 'package:sineo_sambirejo/model/eventls_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sineo_sambirejo/model/response_event.dart';

class ApiService {
  // static final _host = 'https://event-kppm-sambirejo-api.herokuapp.com';
  // static final _host = 'http://10.8.90.35:3000';
  static final _host = 'http://192.168.1.2:3000';

  // static Future<List> getData() async {
  //   final response = await http.get('$_host/event');
  //   if (response.statusCode == 200) {
  //     getDataEvent();
  //     print("datalamaaaaaaaaaaa");
  //     print(json.decode(response.body));
  //     return json.decode(response.body);
  //   } else {
  //     return [];
  //   }
  // }

  // static Future<List<EventLsRes>> getDataEvent() async {
  //   List<EventLsRes> eventls = [];
  //   final response = await http.get('$_host/event');
  //   if (response.statusCode == 200) {
  //     List json = jsonDecode(response.body);
  //     eventls = json.map((job) => new EventLsRes.fromJson(job)).toList();
  //     return eventls;
  //   } else {
  //     return [];
  //   }
  // }

  static Future<List<Eventlist>> getDataEvent() async {
    List<Eventlist> listEvent = [];
    final response = await http.get('$_host/event'); //data json
    print("datalamaaaaaaaaaaa");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      ResponseEvent respEvent = ResponseEvent.fromJson(json);
      respEvent.eventlist.forEach((item) {
        listEvent.add(item);
      });

      return listEvent;
    } else {
      return [];
    }
  }
}
