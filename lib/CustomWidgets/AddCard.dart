import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pal/CustomWidgets/EventDetailsThreeDialog.dart';
import 'package:pal/Models/CMSMaster.dart';
import 'package:pal/Models/CardDetails.dart';
import 'package:pal/Models/GetCleveLandPalEvents.dart';
import 'package:pal/helpers/applicationvariables.dart';
import 'package:pal/helpers/validate.dart';

addNewCardDialog(BuildContext context, GetCleaveLandPalEvents cmsMaster) {
  bool isSwitched = false;
  bool isAccepted = false;
  final _formKey = GlobalKey<FormState>();
  final txtnameOnCard = TextEditingController();
  final txtcardNumber = TextEditingController();
  final txtexpirationDate = TextEditingController();
  final txtcvv = TextEditingController();
  final txtfirstName = TextEditingController();
  final txtlastName = TextEditingController();
  final txtemail = TextEditingController();
  final txtbillingAddress = TextEditingController();

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
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  children: <Widget>[
                    SingleChildScrollView(
                        child: Container(
                      width: double.infinity,
                      //height: _displayEmailBox ? 638:250,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFFc29a6a)),
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                            child: Text("ADD A NEW CARD",
                                style: TextStyle(fontSize: 21, color: Colors.white), textAlign: TextAlign.center),
                          ),
                          SizedBox(height: 12),
                          Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("CARD INFORMATION",
                                          style: TextStyle(
                                              fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF)),
                                          textWidthBasis: TextWidthBasis.longestLine,
                                          textAlign: TextAlign.left),
                                    ),
                                    TextFormField(
                                        controller: txtnameOnCard,
                                        maxLength: 20,
                                        keyboardType: TextInputType.text,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(20),
                                          new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                                        ],
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter name on card';
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Color(0xFF9b7745),
                                        ),
                                        decoration: InputDecoration(
                                          counterText: "",
                                          hintStyle: TextStyle(
                                            color: Color(0xFF9b7745),
                                            fontSize: 12,
                                          ),
                                          hintText: "NAME ON CARD",
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                        )),
                                    SizedBox(height: 8),
                                    TextFormField(
                                        controller: txtcardNumber,
                                        maxLength: 16,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(16),
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter card number';
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Color(0xFF9b7745),
                                        ),
                                        decoration: InputDecoration(
                                          counterText: "",
                                          hintStyle: TextStyle(
                                            color: Color(0xFF9b7745),
                                            fontSize: 12,
                                          ),
                                          hintText: "CARD NUMBER",
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                        )),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                              controller: txtexpirationDate,
                                              maxLength: 7,
                                              keyboardType: TextInputType.number,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(7),
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter expiration date';
                                                }
                                                return null;
                                              },
                                              style: TextStyle(
                                                color: Color(0xFF9b7745),
                                              ),
                                              decoration: InputDecoration(
                                                counterText: "",
                                                hintStyle: TextStyle(
                                                  color: Color(0xFF9b7745),
                                                  fontSize: 12,
                                                ),
                                                hintText: "EXPIRATION DATE",
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                focusedErrorBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                              controller: txtcvv,
                                              maxLength: 3,
                                              keyboardType: TextInputType.number,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(3),
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter email';
                                                }
                                                return null;
                                              },
                                              style: TextStyle(
                                                color: Color(0xFF9b7745),
                                              ),
                                              decoration: InputDecoration(
                                                counterText: "",
                                                hintStyle: TextStyle(
                                                  color: Color(0xFF9b7745),
                                                  fontSize: 12,
                                                ),
                                                hintText: "CVV",
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                focusedErrorBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("CARD HOLDER'S INFO INFORMATION",
                                          style: TextStyle(
                                              fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF)),
                                          textWidthBasis: TextWidthBasis.longestLine,
                                          textAlign: TextAlign.left),
                                    ),
                                    TextFormField(
                                        controller: txtfirstName,
                                        maxLength: 20,
                                        keyboardType: TextInputType.text,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(20),
                                          new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                                        ],
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter first name';
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Color(0xFF9b7745),
                                        ),
                                        decoration: InputDecoration(
                                          counterText: "",
                                          hintStyle: TextStyle(
                                            color: Color(0xFF9b7745),
                                            fontSize: 12,
                                          ),
                                          hintText: "FIRST NAME",
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                        )),
                                    SizedBox(height: 8),
                                    TextFormField(
                                        controller: txtlastName,
                                        maxLength: 20,
                                        keyboardType: TextInputType.text,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(20),
                                          new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                                        ],
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter last name';
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Color(0xFF9b7745),
                                        ),
                                        decoration: InputDecoration(
                                          counterText: "",
                                          hintStyle: TextStyle(
                                            color: Color(0xFF9b7745),
                                            fontSize: 12,
                                          ),
                                          hintText: "LAST NAME",
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                        )),
                                    SizedBox(height: 8),
                                    TextFormField(
                                        controller: txtemail,
                                        maxLength: 50,
                                        keyboardType: TextInputType.emailAddress,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(50),
                                        ],
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter email';
                                          }

                                          if (!Validate.validateEmail(value))
                                            return 'Please enter valid email address';
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Color(0xFF9b7745),
                                        ),
                                        decoration: InputDecoration(
                                          counterText: "",
                                          hintStyle: TextStyle(
                                            color: Color(0xFF9b7745),
                                            fontSize: 12,
                                          ),
                                          hintText: "EMAIL",
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                        )),
                                    SizedBox(height: 8),
                                    TextFormField(
                                        controller: txtbillingAddress,
                                        maxLength: 100,
                                        keyboardType: TextInputType.text,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(100),
                                        ],
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter billing address';
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Color(0xFF9b7745),
                                        ),
                                        decoration: InputDecoration(
                                          counterText: "",
                                          hintStyle: TextStyle(
                                            color: Color(0xFF9b7745),
                                            fontSize: 12,
                                          ),
                                          hintText: "BILLING ADDRESS",
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFF9b7745),
                                            ),
                                          ),
                                        )),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              )),
                          Center(
                              child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Switch(
                                    inactiveTrackColor: Color(0xFFa1753a),
                                    inactiveThumbColor: Color(0xFFddb385),
                                    activeTrackColor: Color(0xFFa1753a),
                                    activeColor: Color(0xFFddb385),
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                        print(isSwitched);
                                      });
                                    },
                                  ),
                                  Text(
                                    "SAVE INFORMATION TO MY ACCOUNT",
                                    style: TextStyle(fontSize: 12, color: Color(0xFF0b183b)),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: isAccepted,
                                    onChanged: (bool value) {
                                      setState(() {
                                        isAccepted = value;
                                      });

                                    },
                                  ),
                                  Text(
                                    "I AGREE TO TERMS & CONDITIONS",
                                    style: TextStyle(fontSize: 12, color: Color(0xFF0b183b)),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.fromLTRB(25, 10, 25, 10),
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0b183b)),
                                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    )),
                                  ),

                                  //padding: EdgeInsets.fromLTRB(25, 10, 25, 10),

                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      CardDetails cardDetails = new CardDetails();
                                      cardDetails.nameOnCard = txtnameOnCard.text;
                                      cardDetails.cardNumber = txtcardNumber.text;
                                      cardDetails.expirationDate = txtexpirationDate.text;
                                      cardDetails.cvv = txtcvv.text;
                                      cardDetails.firstName = txtfirstName.text;
                                      cardDetails.lastName = txtlastName.text;
                                      cardDetails.email = txtemail.text;
                                      cardDetails.billingAddress = txtbillingAddress.text;
                                      cmsMaster.myNumber = (new Random().nextInt(900000) + 100000).toString();
                                      ApplicationVariables.currentUser.AllCards.add(cardDetails);

                                      Navigator.pop(context);
                                      eventDetailsThreeDialog(context, cmsMaster);
                                    }
                                  },
                                  child: Text(
                                    "FINISH & REGISTER",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              SizedBox(height: 12),
                            ],
                          ))
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
                                "assets/card.png",
                              )),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        );
      });
}
