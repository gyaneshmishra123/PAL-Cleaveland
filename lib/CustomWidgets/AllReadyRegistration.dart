import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pal/Models/UserInformation.dart';
import 'package:pal/helpers/applicationvariables.dart';
import 'package:pal/helpers/messagebox.dart';

allReadyRegistrationDialog(BuildContext context, UserInformation userDetails) {
  bool isSwitched = false;
  bool isAccepted = false;
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  final txtChildFirstName = TextEditingController();
  final txtChildLastName = TextEditingController();
  final txtChildAge = TextEditingController();
  final txtChildGender = TextEditingController();
  final txtFirstName = TextEditingController();
  final txtLastName = TextEditingController();
  final txtContact = TextEditingController();
  final txtAddress = TextEditingController();
  final txtEmail = TextEditingController();

  txtEmail.text = userDetails.UserName;

  return showDialog(
      barrierColor: Colors.black.withOpacity(0.8),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: ModalProgressHUD(
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
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                                child: Text("REGISTRATION",
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center),
                              ),
                              Text("SECURLY REGISTER YOU CHILD FOR THIS EVENT",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFFFFFFFF)),
                                  textAlign: TextAlign.center),
                              SizedBox(height: 12),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("CHILD'S INFORMATION",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFFFFFFFF)),
                                            textWidthBasis:
                                                TextWidthBasis.longestLine,
                                            textAlign: TextAlign.left),
                                      ),
                                      TextFormField(
                                          controller: txtChildFirstName,
                                          maxLength: 20,
                                          keyboardType: TextInputType.text,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(20),
                                            new FilteringTextInputFormatter.allow(
                                                RegExp("[a-zA-Z ]")),
                                          ],
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please child's first name";
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
                                                fontSize: 12),
                                            hintText: "CHILD'S FIRST NAME",
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 6,
                                                bottom: 6),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 8),
                                      TextFormField(
                                          controller: txtChildLastName,
                                          maxLength: 20,
                                          keyboardType: TextInputType.text,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(20),
                                            new FilteringTextInputFormatter.allow(
                                                RegExp("[a-zA-Z ]")),
                                          ],
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter child's last name";
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
                                            hintText: "CHILD'S LAST NAME",
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 6,
                                                bottom: 6),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                                controller: txtChildAge,
                                                maxLength: 2,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      2),
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please enter age';
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
                                                  hintText: "AGE",
                                                  isDense: true,
                                                  contentPadding: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      top: 6,
                                                      bottom: 6),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color(0xFF9b7745),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color(0xFF9b7745),
                                                    ),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color(0xFF9b7745),
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(12),
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
                                                controller: txtChildGender,
                                                maxLength: 12,
                                                keyboardType: TextInputType.name,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      20),
                                                  new FilteringTextInputFormatter
                                                      .allow(RegExp("[a-zA-Z ]")),
                                                ],
                                                style: TextStyle(
                                                  color: Color(0xFF9b7745),
                                                ),
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  hintStyle: TextStyle(
                                                    color: Color(0xFF9b7745),
                                                    fontSize: 12,
                                                  ),
                                                  hintText: "GENDER (OPTIONAL)",
                                                  isDense: true,
                                                  contentPadding: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      top: 6,
                                                      bottom: 6),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color(0xFF9b7745),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color(0xFF9b7745),
                                                    ),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color(0xFF9b7745),
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color(0xFF9b7745),
                                                    ),
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                      // Align(
                                      //     alignment: Alignment.centerLeft,
                                      //     child: FlatButton(
                                      //       onPressed: () {},
                                      //       padding: EdgeInsets.zero,
                                      //       child: Text(
                                      //           "+ REGISTER ANOTHER CHILD",
                                      //           style: TextStyle(
                                      //               color: Color(0xFF9b7745),
                                      //               fontWeight: FontWeight.w600)),
                                      //     )),
                                      SizedBox(height: 8),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("PARENT/CONTACT INFORMATION",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFFFFFFFF)),
                                            textWidthBasis:
                                                TextWidthBasis.longestLine,
                                            textAlign: TextAlign.left),
                                      ),
                                      TextFormField(
                                          controller: txtFirstName,
                                          maxLength: 20,
                                          keyboardType: TextInputType.name,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(20),
                                            new FilteringTextInputFormatter.allow(
                                                RegExp("[a-zA-Z ]")),
                                          ],
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter parent's first name";
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
                                            hintText: "PARENT'S FIRST NAME",
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 6,
                                                bottom: 6),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 8),
                                      TextFormField(
                                          controller: txtLastName,
                                          maxLength: 20,
                                          keyboardType: TextInputType.name,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(20),
                                            new FilteringTextInputFormatter.allow(
                                                RegExp("[a-zA-Z ]")),
                                          ],
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter parent's last name";
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
                                            hintText: "PARENT'S LAST NAME",
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 6,
                                                bottom: 6),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 8),
                                      TextFormField(
                                          enabled: false,
                                          controller: txtEmail,
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
                                            hintStyle: TextStyle(
                                              color: Color(0xFF9b7745),
                                              fontSize: 12,
                                            ),
                                            hintText: "EMAIL",
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 6,
                                                bottom: 6),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 8),
                                      TextFormField(
                                          controller: txtContact,
                                          maxLength: 12,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(12),
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter phone/contact';
                                            }
                                            if (value.length < 10) {
                                              return 'Please enter valid phone/contact';
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
                                            hintText: "PHONE/MOBILE",
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 6,
                                                bottom: 6),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 8),
                                      TextFormField(
                                          maxLength: 30,
                                          controller: txtAddress,
                                          keyboardType: TextInputType.text,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(30),
                                          ],
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter address';
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
                                            hintText: "ADDRESS",
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 6,
                                                bottom: 6),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xFF9b7745),
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 8),
                                    ],
                                  )),
                              Center(
                                  child: Column(
                                children: [
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment: CrossAxisAlignment.center,
                                  //   children: [
                                  //     Switch(
                                  //       inactiveTrackColor: Color(0xFFa1753a),
                                  //       inactiveThumbColor: Color(0xFFddb385),
                                  //       activeTrackColor: Color(0xFFa1753a),
                                  //       activeColor: Color(0xFFddb385),
                                  //       value: isSwitched,
                                  //       onChanged: (value) {
                                  //         setState(() {
                                  //           isSwitched = value;
                                  //           print(isSwitched);
                                  //         });
                                  //       },
                                  //     ),
                                  //     Text(
                                  //       "SAVE INFORMATION TO MY ACCOUNT",
                                  //       style: TextStyle(
                                  //           fontSize: 12,
                                  //           color: Color(0xFF0b183b)),
                                  //     ),
                                  //   ],
                                  // ),
                                  Row(
                                   // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(

                                        value: isAccepted,
                                        onChanged: (bool value) {
                                          print(value);

                                          setState(() {
                                            isAccepted = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        "I AGREE TO TERMS & CONDITIONS",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF0b183b)),
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

                                      onPressed: ()async {
                                        ApplicationVariables.buildContext =
                                            context;

                                        if (_formKey.currentState.validate()) {
                                          _loading = true;
                                          setState(() {});

                                          // UserInformation(
                                          //     this.UserID,
                                          //     this.UserName,
                                          //     this.ProfileImage,
                                          //     this.FirstName,
                                          //     this.LastName,
                                          //     this.Contact,
                                          //     this.Email,
                                          //     this.ChildFirstName,
                                          //     this.ChildLastName,
                                          //     this.Age,
                                          //     this.Gender,
                                          //     this.Address,
                                          //     this.RoleType,
                                          //     this.Password);

print('i am running');
if(isAccepted) {
  // userDetails.FirstName = txtFirstName.text;
  // userDetails.LastName = txtLastName.text;
  // userDetails.ChildFirstName = txtChildFirstName.text;
  // userDetails.ChildLastName = txtChildLastName.text;
  // userDetails.Age = txtChildAge.text;
  // userDetails.Gender = txtChildGender.text;
  // userDetails.Address = txtAddress.text;
  // userDetails.Contact = txtContact.text;
  // await new UserAction().signUp(userDetails);
  //

}
else

  MessageBox.show("Please accept terms & conditions.");




                                          _loading = false;
                                          setState(() {});

                                        }
                                      },

                                      child: Text(
                                        "FINISH & REGISTER",style: TextStyle(color: Colors.white),
                                      )),
                                  SizedBox(height: 12),
                                ],
                              ))
                            ],
                          ),
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
                                  "assets/listPlus.png",
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                    inAsyncCall: _loading
                ));
          },
        );
      });
}
