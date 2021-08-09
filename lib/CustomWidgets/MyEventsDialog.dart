import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pal/CustomWidgets/EventDetailsGreenDialog.dart';
import 'package:pal/helpers/applicationvariables.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('d/MMM/yyyy').format(now);




myEventsDialog(BuildContext context) {
  return showDialog(
      barrierColor: Colors.black.withOpacity(0.8),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Stack(

                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: <Widget>[
                    SingleChildScrollView(
                        child: Container(
                      width: double.infinity,
                      //height: _displayEmailBox ? 638:250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFc29a6a)),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 70, 20, 8),
                            child: Text("My Events",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Today's Event",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )),
                                Divider(
                                  color: Color(0xFFFFFFFF),
                                ),
                              _upcomingTodayEvents(),
                             /*   GestureDetector(
                                  onTap: () {
print(formattedDate);
print(ApplicationVariables.allGetCleaveLandPalEvents[0].eventFullDate);

                                 *//* Navigator.pop(context);
                                    eventDetailsgreenDialog(context,null);*//*
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(15),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFa98155),
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Annual Youth Basketball Championship",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "June 15, 2020 | 1pm-5pm\nCleveland Rec Center",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFFb2b2b2)),
                                            )
                                          ],
                                        ),
                                      )),
                                ),*/
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Upcoming Events",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )),
                                Divider(
                                  color: Color(0xFFFFFFFF),
                                ),
                               _upcomingEvents(),




                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    Positioned(
                      top: -30,
                      child: Stack(

                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                              backgroundColor: Color(0xFfa2753b),
                              radius: 50.0,
                              backgroundImage: AssetImage(
                                "assets/starTicker.png",
                              )),
                        ],
                      ),
                    )
                  ],
                ));
          },
        );
      });
}
Widget _upcomingEvents() {
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: ApplicationVariables.allGetCleaveLandPalEvents.length,
      itemBuilder: (context, index) {
        if (ApplicationVariables.allGetCleaveLandPalEvents[index].isActive == true) {
          return Container(
            margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFa98155),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      ApplicationVariables.allGetCleaveLandPalEvents[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      ApplicationVariables.allGetCleaveLandPalEvents[index].fromDate+' | '+
                          ApplicationVariables.allGetCleaveLandPalEvents[index].uptoTime +"\n"+ApplicationVariables.allGetCleaveLandPalEvents[index].location,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFb2b2b2)),
                    )
                  ],
                ),
              ));
        } else {
          return Container();
        }
      });
}
Widget _upcomingTodayEvents() {
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: ApplicationVariables.allGetCleaveLandPalEvents.length,
      itemBuilder: (context, index) {
        if (ApplicationVariables.allGetCleaveLandPalEvents[index].isActive == true && ApplicationVariables.allGetCleaveLandPalEvents[index].eventFullDate == formattedDate ) {
          return Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFa98155),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      ApplicationVariables.allGetCleaveLandPalEvents[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      ApplicationVariables.allGetCleaveLandPalEvents[index].fromDate+' | '+
                          ApplicationVariables.allGetCleaveLandPalEvents[index].uptoTime +"\n"+ApplicationVariables.allGetCleaveLandPalEvents[index].location,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFb2b2b2)),
                    )
                  ],
                ),
              ));
        } else {
          return Container();
        }
      });
}
