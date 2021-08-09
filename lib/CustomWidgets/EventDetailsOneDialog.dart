import 'package:flutter/material.dart';

import 'package:pal/CustomWidgets/EventDetailsTwoDialog.dart';
import 'package:pal/CustomWidgets/EventLoginDialog.dart';
import 'package:pal/Models/CMSMaster.dart';
import 'package:pal/Models/GetCleveLandPalEvents.dart';
import 'package:pal/Utilities/colorsUsing.dart';
import 'package:pal/helpers/applicationvariables.dart';
//Register and Pay Scrren
eventDetailsOneDialog(BuildContext context, GetCleaveLandPalEvents cmsMaster) {
  bool detailsSelected=false;
  bool locationSelected=false;
  bool selected=false;
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(20, 90, 20, 8),
                              child: Text(
                                cmsMaster.fromDate + " | " +cmsMaster.uptoTime+
                                    "\n" +
                                    cmsMaster.location,textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    // fontWeight: FontWeight.w600,
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
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Divider(
                                  color: Colors.white,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [

                                    ElevatedButton(

                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                            EdgeInsets.fromLTRB(25, 10, 25, 10),
                                          ),
                                          backgroundColor: MaterialStateProperty.all<Color>(detailsSelected?Color(0xFF4b5f9a):themeColorBlue),
                                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0.0),
                                          )),
                                        ),



                                        onPressed: () {
                                          setState((){
                                            selected=true;
                                            detailsSelected=true;
                                            locationSelected=false;
                                          });
                                        },

                                        child: Text(
                                          "Details",style: TextStyle(color:detailsSelected?Color(0xFF0b183b):Colors.white, ),
                                        )),
                                    SizedBox(width: 10),

                                    ElevatedButton(

                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                            EdgeInsets.fromLTRB(25, 10, 25, 10),
                                          ),
                                          backgroundColor: MaterialStateProperty.all<Color>(locationSelected?Color(0xFF4b5f9a):Color(0xFF0b183b)),

                                        ),



                                        onPressed: () {
                                          setState((){
                                            selected=true;
                                            detailsSelected=false;
                                            locationSelected=true;
                                          });
                                        },

                                        child: Text(
                                          "Location",style: TextStyle(color:locationSelected?themeColorBlue: Colors.white),
                                        )),
                                  ],
                                ),
                                Text(  selected?(detailsSelected?cmsMaster.about:cmsMaster.location):"",
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(height: 10),
                                Text("REGISTER & PAY",
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(height: 10),

                                ElevatedButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        EdgeInsets.fromLTRB(55, 10, 55, 10),
                                      ),
                                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0b183b)),
                                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      )),
                                    ),





                                    onPressed: () {
                                      if (ApplicationVariables.currentUser != null) {
                                        Navigator.pop(context);
                                        eventDetailsTwoDialog(context, cmsMaster);
                                      } else {
                                        Navigator.pop(context);
                                        eventLoginDialog(context, cmsMaster);
                                      }
                                    },
                                   // textColor: Color(0xFF101d40),
                                    child: Image.asset(
                                      "assets/rightArrowGolden.png",
                                      height: 20,
                                    )),
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
                                ),
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
