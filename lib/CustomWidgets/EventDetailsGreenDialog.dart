import 'package:flutter/material.dart';
import 'package:pal/Models/CMSMaster.dart';
import 'package:pal/Models/GetCleveLandPalEvents.dart';
import 'package:pal/helpers/applicationvariables.dart';
import 'package:qr_flutter/qr_flutter.dart';

eventDetailsgreenDialog(BuildContext context, GetCleaveLandPalEvents cmsMaster) {
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
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFFc29a6a)),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 70, 20, 8),
                            child: Text("My Events",
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Text("Event ID :${cmsMaster.myNumber}",
                                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xFFa2753b)),
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(cmsMaster.title,
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  cmsMaster.fromDate + "\n" + cmsMaster.location,
                                  style:
                                      TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xFFa2753b)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(15),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFF0b183b),
                                    ),
                                    child: Center(
                                        child: Text(ApplicationVariables
                                            .currentUser.AllChildren.where((element) => element.IsRegistered).length.toString() +" Registered Attendees",
                                            style: TextStyle(fontSize: 18, color: Colors.white)))),
                                SizedBox(height: 15),
                                Container(
                                    padding: EdgeInsets.all(15),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFa98155),
                                    ),
                                    child: Center(
                                      child: QrImage(
                                        data: cmsMaster.myNumber,
                                        version: QrVersions.auto,
                                        size: 200.0,
                                      ),

                                      // Image.asset("assets/QRCode.png", width: MediaQuery.of(context).size.width * .5, )
                                    )),
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
