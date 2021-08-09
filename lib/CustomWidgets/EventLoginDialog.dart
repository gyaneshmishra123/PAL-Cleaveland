import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:pal/CustomWidgets/EventDetailsTwoDialog.dart';
import 'package:pal/Models/CMSMaster.dart';
import 'package:pal/Models/GetCleveLandPalEvents.dart';
import 'package:pal/controller/UserAction.dart';
import 'package:pal/helpers/applicationvariables.dart';
import 'package:pal/views/ForgotPassword.dart';
import 'package:pal/views/SignUp.dart';

eventLoginDialog(BuildContext context, GetCleaveLandPalEvents cmsMaster) {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
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
                      child: ModalProgressHUD(
                        child: Container(
                          width: double.infinity,
                          height:  638.250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF0b193d)),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            children: [

                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("SIGN IN",
                                            textAlign: TextAlign.left,
                                            textWidthBasis: TextWidthBasis.parent,
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Color(0xFF9b7745),
                                                fontWeight: FontWeight.bold))),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("    EMAIL *",
                                              style: TextStyle(
                                                color: Color(0xFF9b7745),
                                                fontWeight: FontWeight.w700,
                                              )),
                                          TextFormField(
                                              controller: txtUsername,
                                              keyboardType: TextInputType.emailAddress,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter email';
                                                }
                                                return null;
                                              },
                                              style: TextStyle(
                                                  color: Color(0xFF9b7745),
                                                  fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text("    PASSWORD *",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF9b7745),
                                              )),
                                          TextFormField(
                                              controller: txtPassword,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter password';
                                                }

                                                return null;
                                              },
                                              obscureText: true,
                                              style: TextStyle(
                                                  color: Color(0xFF9b7745),
                                                  fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF9b7745),
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,

                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();

                                                Navigator.of(context).push(
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                        new ForgotPassword()));
                                              },
                                              //padding:
                                              //EdgeInsets.only(right: 0.0),
                                              child: Text(
                                                'Forgot Password?',
                                                //style: styleLabel,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF9b7745),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: double.infinity,

                                            child: ElevatedButton(
                                                style: ButtonStyle(

                                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF9b7745)),

                                                ),



                                                onPressed: () async {
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    ApplicationVariables
                                                        .buildContext = context;
                                                    _loading = true;
                                                    setState(() {});
                                                    // Navigator.of(context).pop();

                                                  bool isValid =   await new UserAction().login(
                                                        txtUsername.text,
                                                        txtPassword.text);
                                                  if(isValid)
                                                    {
                                                      Navigator.pop(context);
                                                      eventDetailsTwoDialog(
                                                          context,

                                                          cmsMaster);
                                                     // registrationDialog(context,ApplicationVariables.currentUser,cmsMaster);
                                                    }

                                                    _loading = false;
                                                    setState(() {});
                                                  }
                                                },

                                                child: Text("SIGN IN",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w700,color:Color(0xFF101d40), ),)),
                                          ),
                                          SizedBox(height: 20),
                                          Center(
                                            child: Column(
                                              children: [
                                                Text("Sign In with",
                                                    style: TextStyle(
                                                        color:
                                                        Color(0xFF9b7745))),
                                                SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              'click on facebook');
                                                        },
                                                        child: Image(
                                                          image: AssetImage(
                                                              'assets/facebook.png'),
                                                          fit: BoxFit.cover,
                                                          height: 40,
                                                        )),
                                                    SizedBox(width: 8),
                                                    GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              'click on twitter');
                                                        },
                                                        child: Image(
                                                          image: AssetImage(
                                                              'assets/twitter.png'),
                                                          fit: BoxFit.cover,
                                                          height: 40,
                                                        )),
                                                    SizedBox(width: 8),
                                                    GestureDetector(
                                                        onTap: () {
                                                          print('click on gplus');
                                                        },
                                                        child: Image(
                                                          image: AssetImage(
                                                              'assets/googleplus.png'),
                                                          fit: BoxFit.cover,
                                                          height: 40,
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(height: 15),

                                                TextButton(
                                                  //   color: Color(0xFF101d40),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();

                                                      Navigator.of(context).push(
                                                          new MaterialPageRoute(
                                                              builder: (context) =>
                                                              new SignUp(true)));
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          'Don`t have an account? ',
                                                          //style: styleLabel,
                                                          style: TextStyle(
                                                            color:
                                                            Color(0xFF9b7745),
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            //fontFamily: 'Lato',
                                                          ),
                                                        ),
                                                        Text(
                                                          "SIGN UP",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF9b7745),
                                                              decoration:
                                                              TextDecoration
                                                                  .underline),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                          inAsyncCall: _loading
                      ),
                    )

                  ],
                ));
          },
        );
      });
}
