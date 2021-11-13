import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sineo_sambirejo/screen/Form_Event/Event_List.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:sineo_sambirejo/screen/Form_User/user_list.dart';
import 'package:sineo_sambirejo/screen/home/home_screen.dart';
import 'package:sineo_sambirejo/shared/CalendarView.dart';
import 'package:sineo_sambirejo/shared/webView_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
      // ),
      // appBar: AppBar(
      //   title: Text(
      //     'Dashboard',
      //     style: TextStyle(
      //       fontSize: 18.0,
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        currentIndex: currentIndex,
        hasInk: true,
        inkColor: Colors.white,
        onTap: changePage,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
            title: Text('Home'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(
              Icons.event,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.event_available,
              color: Colors.indigo,
            ),
            title: Text('Event'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.web,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.web_asset,
              color: Colors.deepPurple,
            ),
            title: Text('WebView'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.green,
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.calendar_today_rounded,
              color: Colors.green,
            ),
            title: Text('Calendar'),
          ),
        ],
      ),
      body: (currentIndex == 0)
          ? HomeScreen()
          : (currentIndex == 1)
              ? EventList()
              : (currentIndex == 2)
                  ? WebViewEvent()
                  // : CalendaView(),
                  : StepperPage(),
    );
  }
}
