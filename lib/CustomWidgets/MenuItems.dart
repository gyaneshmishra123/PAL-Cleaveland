import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pal/CustomWidgets/MyAccountDialog.dart';
import 'package:pal/CustomWidgets/MyEventsDialog.dart';
import 'package:pal/Utilities/maya_app_icons.dart';
import 'package:pal/controller/UserAction.dart';
import 'package:pal/helpers/applicationvariables.dart';
import 'package:pal/views/AboutPal.dart';
import 'package:pal/views/ContactUs.dart';
import 'package:pal/views/Login.dart';
import 'package:pal/views/SignUp.dart';


Widget getAnonymousMenuItems(BuildContext context) {
  return Theme(
      data: Theme.of(context).copyWith(
        canvasColor:
        Color(0xFF040d22), //This will change the drawer background to blue.
        //other styles
      ),
      child: Drawer(
        // column holds all the widgets in the drawer
        child: Column(
          children: <Widget>[
            Expanded(
              // ListView contains a group of widgets that scroll inside the drawer
              child: ListView(
                children: <Widget>[
                  //SizedBox(height: 25),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFF0b193d),
                    ),

                  ),
                  SizedBox(height: 13),
                  Padding(
                    padding: const EdgeInsets.only(left:15 , right:15),
                    child: Center(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(

                            child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFa2753b))),

                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context)
                                    .push(new MaterialPageRoute(builder: (context) =>  SignUp(false)));
                              },
                              child: Text("Sign Up",
                                  style: TextStyle(color: Color(0xFFFFFFFF))),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(

                            child: ElevatedButton(

                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                  side: BorderSide(color:Color(0xFFc49a6c))
                                )),
                              ),


                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context)
                                    .push(new MaterialPageRoute(builder: (context) => new Login()));
                              },
                              child: Text("Sign In",
                                  style: TextStyle(color: Color(0xFFc49a6c))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 6),


                  Divider(
                    color: Color(0xFF31394a),
                  ),
                  ListTile(
                    trailing:
                    Icon(Icons.verified_user, color: Color(0xFFc49a6c)),
                    title: Text(
                      "About PAL",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Color(0xFFc49a6c)),
                    ),
                    onTap: () {
                      Navigator.pop(context);

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPal()));

                    },
                  ),
                  Divider(
                    color: Color(0xFF31394a),
                  ),
                  ListTile(
                    trailing:
                    Icon(MayaApp.contacts, color: Color(0xFFc49a6c)),
                    title: Text(
                      "Contact Us",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Color(0xFFc49a6c)),
                    ),
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
                    },
                  ),
                  Divider(
                    color: Color(0xFF31394a),
                  ),
                ],
              ),
            ),
            // This container holds the align
            Container(
              // This align moves the children to the bottom
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    // This container holds all the children that will be aligned
                    // on the bottom and should not scroll with the above ListView
                    child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Divider(),

                            Text('©2020 Cleveland PAL. All Rights Reserved.',
                                textAlign:TextAlign.left,
                                style:TextStyle(
                                  fontSize: 9,
                                  color:Color(0xFFc49a6c),
                                ))
                          ],
                        ))))
          ],
        ),
      ));
}



Widget getMenuItems(BuildContext context) {
  return Theme(
      data: Theme.of(context).copyWith(
        canvasColor:
            Color(0xFF040d22), //This will change the drawer background to blue.
        //other styles
      ),
      child: Drawer(
        // column holds all the widgets in the drawer
        child: Column(
          children: <Widget>[
            Expanded(
              // ListView contains a group of widgets that scroll inside the drawer
              child: ListView(
                children: <Widget>[
                  //SizedBox(height: 25),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFF0b193d),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 55.0,

                                backgroundImage:
                                ApplicationVariables.currentUser.ProfileImage == null ?  AssetImage("assets/profilepic.png"):
                                CachedNetworkImageProvider(
                                  ApplicationVariables.apiEndPoint + "UploadFiles/" + ApplicationVariables.currentUser.ProfileImage,
                                ),


                              ),
                            ],
                          ),
                          Text(
                            ApplicationVariables.currentUser.FirstName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  Center(

                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFa2753b))
                      ),

                      onPressed: () {
                        Navigator.pop(context);
                        myEventsDialog(context);
                      },
                      child: Text("My Events",
                          style: TextStyle(color: Color(0xFFFFFFFF))),
                    ),
                  ),
                  SizedBox(height: 6),
                  Divider(
                    color: Color(0xFF31394a),
                  ),

                  ListTile(
                    trailing:
                        Icon(MayaApp.heart, color: Color(0xFFc49a6c)),
                    title: Text(
                      "My Donations",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Color(0xFFc49a6c)),
                    ),
                    onTap: () {},
                  ),
                  Divider(
                    color: Color(0xFF31394a),
                  ),
                  ListTile(
                    trailing:
                        Icon(Icons.person_outline, color: Color(0xFFc49a6c)),
                    title: Text(
                      "My Account",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Color(0xFFc49a6c)),
                    ),
                    onTap: () {
                    //  Navigator.pop(context);
                      myAccountDialog(context);
                        // createSocialInjusticeDialog(context)       ;             //  Navigator.of(context).pop();
                    },
                  ),
                  Divider(
                    color: Color(0xFF31394a),
                  ),
                  ListTile(
                    trailing:
                        Icon(Icons.verified_user, color: Color(0xFFc49a6c)),
                    title: Text(
                      "About PAL",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Color(0xFFc49a6c)),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPal()));
                    },
                  ),
                  Divider(
                    color: Color(0xFF31394a),
                  ),
                  ListTile(
                    trailing:
                        Icon(MayaApp.contacts, color: Color(0xFFc49a6c)),
                    title: Text(
                      "Contact Us",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Color(0xFFc49a6c)),
                    ),
                    onTap: () {

                      Navigator.pop(context);

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
                    },
                  ),
                  Divider(
                    color: Color(0xFF31394a),
                  ),
                ],
              ),
            ),
            // This container holds the align
            Container(
                // This align moves the children to the bottom
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    // This container holds all the children that will be aligned
                    // on the bottom and should not scroll with the above ListView
                    child: Container(
                        child: Column(
  crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Divider(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 130,
                            alignment: Alignment.centerRight,

                            child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                  shape:MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
  side: BorderSide(color: Color(0xFFc49a6c))),) ),




                              onPressed: () {

                                new UserAction().logout();

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Sign Out  ",
                                      style: TextStyle(
                                        color: Color(0xFFc49a6c),
                                      )),
                                  Icon(
                                    MayaApp.logout,
                                    color: Color(0xFFc49a6c),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

SizedBox(height: 10),
                             Text('©2020 Cleveland PAL. All Rights Reserved.',
                                 textAlign:TextAlign.left,
                                 style:TextStyle(
                                   fontSize: 9,
                               color:Color(0xFFc49a6c),
                             ))
                      ],
                    ))))
          ],
        ),
      ));
}
