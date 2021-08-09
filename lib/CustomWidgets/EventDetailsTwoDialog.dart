import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:pal/CustomWidgets/AddCard.dart';
import 'package:pal/CustomWidgets/EventDetailsOneDialog.dart';
import 'package:pal/CustomWidgets/Registration.dart';
import 'package:pal/Models/CMSMaster.dart';
import 'package:pal/Models/GetCleveLandPalEvents.dart';
import 'package:pal/helpers/applicationvariables.dart';
import 'package:pal/helpers/messagebox.dart';
import 'package:http/http.dart' as http;
import 'package:pal/views/payment_services.dart';


Map<String, dynamic> _paymentSheetData;
//Regsiter an Attendee
eventDetailsTwoDialog(BuildContext context, GetCleaveLandPalEvents cmsMaster) {

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
                                cmsMaster.fromDate+" | "+cmsMaster.uptoTime +
                                    "\n" +
                                    cmsMaster.location,
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
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Divider(
                                  color: Colors.white,
                                ),
                                SizedBox(height: 15),
                                Text("REGISTER All ATTENDEES",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0Xff0b193d))),
                                SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xFF0b193d),
                                    ),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: ApplicationVariables
                                              .currentUser.AllChildren
                                              .map((e) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  e.IsRegistered = !e.IsRegistered;


                                                  setState(() {




                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    e.IsRegistered?
                                                    Icon(Icons.highlight_remove,
                                                        color:
                                                            Color(0xFF4b5f9a)):
                                                    Icon(Icons.add_circle_outlined,
                                                        color:
                                                        Color(0xFF4b5f9a)),
                                                    RichText(
                                                      textAlign: TextAlign.left,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: e.FirstName +
                                                                ' ' +
                                                                e.LastName,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF5f79c4),
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          e.IsRegistered?
                                                          TextSpan(
                                                            text:
                                                                ' is now registered',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF4b5f9a),
                                                              fontSize: 14.0,
                                                            ),
                                                          ):TextSpan(
                                                            text:'') ,
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              registrationDialog(
                                                  context,
                                                  ApplicationVariables
                                                      .currentUser,
                                                  cmsMaster);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.add_circle_outline,
                                                    color: Color(0xFFc49a6c)),
                                                Text(
                                                  "REGISTER AN ATTENDEE",
                                                  //  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFFc49a6c)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                TextButton(
                                  onPressed: () {},
                                  //padding: EdgeInsets.zero,
                                  child: Text("+ ADD/CHOOSE YOU PAYMENT OPTION",
                                      style: TextStyle(
                                          color: Color(0xFF9b7745),
                                          fontWeight: FontWeight.bold)),
                                ),

                                ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF64554e)),

                                  ),


                                  onPressed: () {

ApplicationVariables.buildContext = context;
                                    if(ApplicationVariables
                                        .currentUser.AllChildren.where((element) => element.IsRegistered).length > 0) {
                                     Navigator.pop(context);


                                     // addNewCardDialog(context, cmsMaster);
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentSheetScreen()));.

                                      //TODO: FOR PAYMENT
                                      PaymentSheetScreen payment=PaymentSheetScreen();
                                      print(cmsMaster.eventPrice.split('.'));
                                      List price=cmsMaster.eventPrice.split('.');

                                      print("list data  "+price.toString());
                                      payment.initPaymentSheet(price[0]+price[1]);
                                    }
                                    else
                                      MessageBox.show("Please select a child");
                                  },
                                 // textColor: Color(0xFF101d40),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        ApplicationVariables
                                            .currentUser.AllChildren.where((element) => element.IsRegistered).length > 0?
                                        TextSpan(
                                          text: '('+ApplicationVariables
                                              .currentUser.AllChildren.where((element) => element.IsRegistered).length.toString() + ' item)',
                                          style: TextStyle(
                                            color: Color(0xFF0b183b),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ):TextSpan(),
                                        TextSpan(
                                          text: ' CONFIRM & PAY',
                                          style: TextStyle(
                                            color: Color(0xFF0b183b),
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                                   Navigator.pop(context);
                                      eventDetailsOneDialog(context,cmsMaster);
                                    },
                                   // textColor: Color(0xFF101d40),
                                    child: Image.asset(
                                      "assets/leftArrowGolden.png",
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








