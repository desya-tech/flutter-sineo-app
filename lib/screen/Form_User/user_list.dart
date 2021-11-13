import 'package:flutter/material.dart';
import 'package:sineo_sambirejo/model/response_event.dart';
import 'package:sineo_sambirejo/service/api_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'dart:math' as math;

// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(UserList());

// class UserList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Expandable Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State createState() {
//     return MyHomePageState();
//   }
// }

// class MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Expandable Demo"),
//       ),
//       body: ExpandableTheme(
//         data: const ExpandableThemeData(
//           iconColor: Colors.blue,
//           useInkWell: true,
//         ),
//         child: ListView(
//           physics: const BouncingScrollPhysics(),
//           children: <Widget>[
//             Card1(),
//             Card2(),
//             Card3(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// const loremIpsum =
//     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

// class Card1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 150,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   shape: BoxShape.rectangle,
//                 ),
//               ),
//             ),
//             ScrollOnExpand(
//               scrollOnExpand: true,
//               scrollOnCollapse: false,
//               child: ExpandablePanel(
//                 theme: const ExpandableThemeData(
//                   headerAlignment: ExpandablePanelHeaderAlignment.center,
//                   tapBodyToCollapse: true,
//                 ),
//                 header: Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       "ExpandablePanel",
//                       style: Theme.of(context).textTheme.body2,
//                     )),
//                 collapsed: Text(
//                   loremIpsum,
//                   softWrap: true,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 expanded: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     for (var _ in Iterable.generate(5))
//                       Padding(
//                           padding: EdgeInsets.only(bottom: 10),
//                           child: Text(
//                             loremIpsum,
//                             softWrap: true,
//                             overflow: TextOverflow.fade,
//                           )),
//                   ],
//                 ),
//                 builder: (_, collapsed, expanded) {
//                   return Padding(
//                     padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                     child: Expandable(
//                       collapsed: collapsed,
//                       expanded: expanded,
//                       theme: const ExpandableThemeData(crossFadePoint: 0),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }

// class Card2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }

//     buildCollapsed1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                     style: Theme.of(context).textTheme.body1,
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildCollapsed2() {
//       return buildImg(Colors.lightGreenAccent, 150);
//     }

//     buildCollapsed3() {
//       return Container();
//     }

//     buildExpanded1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                     style: Theme.of(context).textTheme.body1,
//                   ),
//                   Text(
//                     "3 Expandable widgets",
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildExpanded2() {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//               Expanded(child: buildImg(Colors.orange, 100)),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightBlue, 100)),
//               Expanded(child: buildImg(Colors.cyan, 100)),
//             ],
//           ),
//         ],
//       );
//     }

//     buildExpanded3() {
//       return Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               loremIpsum,
//               softWrap: true,
//             ),
//           ],
//         ),
//       );
//     }

//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//       child: ScrollOnExpand(
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expandable(
//                 collapsed: buildCollapsed1(),
//                 expanded: buildExpanded1(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed2(),
//                 expanded: buildExpanded2(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed3(),
//                 expanded: buildExpanded3(),
//               ),
//               Divider(
//                 height: 1,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Builder(
//                     builder: (context) {
//                       var controller =
//                           ExpandableController.of(context, required: true);
//                       return TextButton(
//                         child: Text(
//                           controller.expanded ? "COLLAPSE" : "EXPAND",
//                           style: Theme.of(context)
//                               .textTheme
//                               .button
//                               .copyWith(color: Colors.deepPurple),
//                         ),
//                         onPressed: () {
//                           controller.toggle();
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

// class Card3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     buildItem(String label) {
//       return Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Text(label),
//       );
//     }

//     buildList() {
//       return Column(
//         children: <Widget>[
//           for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
//         ],
//       );
//     }

//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: ScrollOnExpand(
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             children: <Widget>[
//               ExpandablePanel(
//                 theme: const ExpandableThemeData(
//                   headerAlignment: ExpandablePanelHeaderAlignment.center,
//                   tapBodyToExpand: true,
//                   tapBodyToCollapse: true,
//                   hasIcon: false,
//                 ),
//                 header: Container(
//                   color: Colors.indigoAccent,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         ExpandableIcon(
//                           theme: const ExpandableThemeData(
//                             expandIcon: Icons.arrow_right,
//                             collapseIcon: Icons.arrow_drop_down,
//                             iconColor: Colors.white,
//                             iconSize: 28.0,
//                             iconRotationAngle: math.pi / 2,
//                             iconPadding: EdgeInsets.only(right: 5),
//                             hasIcon: false,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             "Items",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyText1
//                                 .copyWith(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 collapsed: Container(),
//                 expanded: buildList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import 'package:share/share.dart';

// import 'package:sineo_sambirejo/shared/image_previews.dart';

// void main() {
//   runApp(UserList());
// }

// class UserList extends StatefulWidget {
//   @override
//   DemoAppState createState() => DemoAppState();
// }

// class DemoAppState extends State<UserList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // This is handled by the search bar itself.
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // buildMap(),
//           // buildBottomNavigationBar(),
//           buildFloatingSearchBar(),
//         ],
//       ),
//     );
//   }

//   Widget buildFloatingSearchBar() {
//     final isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;

//     return FloatingSearchBar(
//       hint: 'Search...',
//       scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//       transitionDuration: const Duration(milliseconds: 800),
//       transitionCurve: Curves.easeInOut,
//       physics: const BouncingScrollPhysics(),
//       axisAlignment: isPortrait ? 0.0 : -1.0,
//       openAxisAlignment: 0.0,
//       width: isPortrait ? 600 : 500,
//       debounceDelay: const Duration(milliseconds: 500),
//       onQueryChanged: (query) {
//         // Call your model, bloc, controller here.
//       },
//       // Specify a custom transition to be used for
//       // animating between opened and closed stated.
//       transition: CircularFloatingSearchBarTransition(),
//       actions: [
//         FloatingSearchBarAction(
//           showIfOpened: false,
//           child: CircularButton(
//             icon: const Icon(Icons.place),
//             onPressed: () {},
//           ),
//         ),
//         FloatingSearchBarAction.searchToClear(
//           showIfClosed: false,
//         ),
//       ],
//       builder: (context, transition) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Material(
//             color: Colors.white,
//             elevation: 4.0,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: Colors.accents.map((color) {
//                 return Container(height: 112, color: color);
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

//calendarrrrrrrrrrrrrrrrrrrrrrrrrr active

// void main() {
//   return runApp(UserList());
// }

// /// The app which hosts the home page which contains the calendar on it.
// class UserList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(title: 'Calendar Demo', home: MyHomePage());
//   }
// }

// /// The hove page which hosts the calendar
// class MyHomePage extends StatefulWidget {
//   /// Creates the home page to display teh calendar widget.
//   const MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     FutureBuilder(
//       future: ApiService.getDataEvent(),
//       builder: (context, snapshot) {
//         print("calendarrrrr");
//         if (snapshot.hasError) print(snapshot.error);
//         return snapshot.hasData
//             ? _getDataEvent(snapshot.data)
//             : new Center(
//                 child: CircularProgressIndicator(),
//               );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Calendar View"),
//         ),
//         body: Container(
//             child: SfCalendar(
//           showDatePickerButton: true,
//           showCurrentTimeIndicator: true,
//           showNavigationArrow: true,
//           view: CalendarView.month,
//           dataSource: MeetingDataSource(_getDataSource()),
//           // by default the month appointment display mode set as Indicator, we can
//           // change the display mode as appointment using the appointment display
//           // mode property
//           monthViewSettings: const MonthViewSettings(
//               appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
//               showAgenda: true),
//         )));
//   }

//   List<Eventlist> _getDataEvent(List<Eventlist> data) {
//     print(data);
//     final List<Eventlist> meetings = <Eventlist>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//         DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime = startTime.add(const Duration(hours: 2));
//     meetings.add(Eventlist(namaEvent: data[0].namaEvent));
//     return meetings;
//   }

//   List<Meeting> _getDataSource() {
//     final List<Meeting> meetings = <Meeting>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//         DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime = startTime.add(const Duration(hours: 2));
//     meetings.add(Meeting(
//         'Conference', startTime, endTime, const Color(0xFF0F8644), false));
//     return meetings;
//   }
// }

// /// An object to set the appointment collection data source to calendar, which
// /// used to map the custom appointment data to the calendar appointment, and
// /// allows to add, remove or reset the appointment collection.
// class MeetingDataSource extends CalendarDataSource {
//   /// Creates a meeting data source, which used to set the appointment
//   /// collection to the calendar
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }

//   @override
//   DateTime getStartTime(int index) {
//     return _getMeetingData(index).from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return _getMeetingData(index).to;
//   }

//   @override
//   String getSubject(int index) {
//     return _getMeetingData(index).eventName;
//   }

//   @override
//   Color getColor(int index) {
//     return _getMeetingData(index).background;
//   }

//   @override
//   bool isAllDay(int index) {
//     return _getMeetingData(index).isAllDay;
//   }

//   Meeting _getMeetingData(int index) {
//     final Meeting meeting = appointments[index];
//     // final Meeting meetingData;
//     // if (meeting is Meeting) {
//     //   meetingData = meeting;
//     // }

//     return meeting;
//   }
// }

// /// Custom business object class which contains properties to hold the detailed
// /// information about the event data which will be rendered in calendar.
// class Meeting {
//   /// Creates a meeting class with required details.
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;

//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;

//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;

//   /// Background which is equivalent to color property of [Appointment].
//   Color background;

//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }

import 'package:flutter/cupertino.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('CupertinoStepper for Flutter'),
      ),
      child: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            switch (orientation) {
              case Orientation.portrait:
                return _buildStepper(StepperType.vertical);
              case Orientation.landscape:
                return _buildStepper(StepperType.horizontal);
              default:
                throw UnimplementedError(orientation.toString());
            }
          },
        ),
      ),
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        for (var i = 0; i < 3; ++i)
          _buildStep(
            title: Text('Step ${i + 1}'),
            isActive: i == currentStep,
            state: i == currentStep
                ? StepState.editing
                : i < currentStep
                    ? StepState.complete
                    : StepState.indexed,
          ),
        _buildStep(
          title: Text('Error'),
          state: StepState.error,
        ),
        _buildStep(
          title: Text('Disabled'),
          state: StepState.disabled,
        )
      ],
    );
  }

  Step _buildStep({
    Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 300,
        child: Container(color: CupertinoColors.systemGrey),
      ),
    );
  }
}
