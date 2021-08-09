import 'package:flutter/material.dart';
import 'package:pal/views/ChangePassword.dart';

myAccountDialog(BuildContext context) {
  bool isSwitched =false;
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
                          color: Color(0xFF040d22)),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 70, 20, 8),
                            child: Text("John Smith",
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Icon(Icons.account_circle,  size: 18, color: Color(0xFFc49a6c),),
                                    Text("Account Info" ,style:TextStyle(color:Color(0xFFc49a6c),  fontSize: 18) ),
                                  ],
                                ),
                                Divider(
                                  color: Color(0xFF414858),
                                ),

                                TextButton(
                                  //padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Edit Profile" ,style:TextStyle(color:Color(0xFF7b7b7a),  fontSize: 18) ),
                                      Icon(Icons.arrow_forward_ios,  size: 18, color: Color(0xFF7b7b7a),),
                                    ],
                                  ),
                                ),

                                TextButton(
                                  //padding: EdgeInsets.zero,

                                  onPressed: () {

                                   // Navigator.of(ApplicationVariables.buildContext).pop();
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(builder: (context) => new ChangePassword()));


                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Change Password" ,style:TextStyle(color:Color(0xFF7b7b7a),  fontSize: 18) ),
                                      Icon(Icons.arrow_forward_ios,  size: 18, color: Color(0xFF7b7b7a),),
                                    ],
                                  ),
                                ),
                                TextButton(
                                 // padding: EdgeInsets.zero,

                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Billings/Credit Card" ,style:TextStyle(color:Color(0xFF7b7b7a),  fontSize: 18) ),
                                      Icon(Icons.arrow_forward_ios,  size: 18, color: Color(0xFF7b7b7a),),
                                    ],
                                  ),
                                ),

                                TextButton(
                                 // padding: EdgeInsets.zero,

                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Registered User Accounts" ,style:TextStyle(color:Color(0xFF7b7b7a),  fontSize: 18) ),
                                      Icon(Icons.arrow_forward_ios,  size: 18, color: Color(0xFF7b7b7a),),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Icon(Icons.notifications_none,  size: 18, color: Color(0xFFc49a6c),),
                                    Text("Notifications & Privacy" ,style:TextStyle(color:Color(0xFFc49a6c),  fontSize: 18) ),
                                  ],
                                ),
                                Divider(
                                  color: Color(0xFF414858),
                                ),


                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Notifications" ,style:TextStyle(color:Color(0xFF7b7b7a),  fontSize: 18) ),
                                    Switch(
                                      inactiveTrackColor: Color(0xFFa1753a),
                                      inactiveThumbColor: Color(0xFFddb385),
                                      activeTrackColor: Color(0xFFa1753a),
                                      activeColor: Color(0xFFddb385),
                                      value: isSwitched,
                                      onChanged: (value){
                                        setState(() {
                                          isSwitched=value;
                                          print(isSwitched);
                                        });
                                      },
                                    )
                                  ],
                                ),

                                TextButton(
                                  //padding: EdgeInsets.zero,

                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Privacy Settings" ,style:TextStyle(color:Color(0xFF7b7b7a),  fontSize: 18) ),
                                      Icon(Icons.arrow_forward_ios,  size: 18, color: Color(0xFF7b7b7a),),
                                    ],
                                  ),
                                ),
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
                              backgroundColor: Color(0xFF4f0b0c),
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage("assets/profilepic.png")),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child:
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Color(0xFFa2753b),
                              child: new IconButton(
                                  icon: new Icon(Icons.mode_edit,size: 16, color: Colors.white,),onPressed: null),
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
