import 'package:flutter/material.dart';
import 'package:pal/CustomWidgets/EventDetailsGreenDialog.dart';
import 'package:pal/Models/CMSMaster.dart';
import 'package:pal/Models/GetCleveLandPalEvents.dart';

eventDetailsThreeDialog(BuildContext context, GetCleaveLandPalEvents cmsMaster) {
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
                          color: Color(0xFF263561)),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(20, 70, 20, 8),
                              child: Text(
                                cmsMaster.fromDate +
                                    "\n" +
                                    cmsMaster.location,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFb2b2b2)),
                              )),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(cmsMaster.title,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Text(cmsMaster.subTitle,
                                style: TextStyle(
                                    fontSize: 17,
                                    // fontWeight: FontWeight.w600,
                                    color: Color(0xFFb2b2b2)),
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Divider(
                                  color: Colors.white,
                                ),
                                SizedBox(height: 15),


                                Container(

                                  padding: EdgeInsets.all(15),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xFF0b193d),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Registration Complete!" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,  color: Color(0xFF5e70a5))),
                                      SizedBox(height: 8),
                                      Text("Click below to see your registration information & get your Check In code" ,textAlign: TextAlign.center , style: TextStyle(fontWeight: FontWeight.w600,  fontSize: 14,  color: Color(0xFFb2b2b2))),
                                      SizedBox(height: 20),

                                      ElevatedButton(
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                              EdgeInsets.fromLTRB(55, 10, 55, 10),
                                            ),
                                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFa2753b)),


                                          ),



                                          onPressed: () {

                                            Navigator.pop(context);

                                            eventDetailsgreenDialog(context,cmsMaster);

                                           // myEventsDialog(context);

                                          },

                                          child: Text("SEE MY EVENTS",style: TextStyle(color:Color(0xFFffffff) ),
                                              ))
                                    ],
                                  ),
                                ),



                                SizedBox(height: 15),
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
                            backgroundColor: Color(0xFF0b183b),
                            radius: 50.0,
                            child: Text("\$ "+
            cmsMaster.eventPrice,
                              style: TextStyle(
                                  color: Color(0xFFa2753b),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ));
          },
        );
      });
}
