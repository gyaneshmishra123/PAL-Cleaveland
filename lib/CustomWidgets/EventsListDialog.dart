import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import 'package:pal/Models/CMSMaster.dart';
import 'package:pal/Models/GetAllActivePartners.dart';
import 'package:pal/Models/GetCleveLandPalEvents.dart';
import 'package:pal/Utilities/colorsUsing.dart';
import 'package:pal/helpers/applicationvariables.dart';
import 'package:pal/views/Login.dart';

import 'EventDetailsTwoDialog.dart';
import 'EventLoginDialog.dart';

eventListDialog(BuildContext context, GetCleaveLandPalEvents cmsMaster) {
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

                        child:Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [

                            Container(
                              width: double.infinity,
                              //height: _displayEmailBox ? 638:250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF263561)),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Column(
                                children: [
                                  Container(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            margin
                                                : EdgeInsets.fromLTRB(20, 10, 20, 8),
                                            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                            // width: double.infinity,
                                            decoration: BoxDecoration(
                                                color:Color(0xFFA9AFC0) ,
                                                borderRadius: BorderRadius.all(Radius.circular(30))
                                            ) ,
                                            child:Icon(Icons.arrow_back_rounded,color: Colors.black,)
                                        ),
                                      ),
                                    ],
                                  ),),

                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 30, 5, 5),
                                    child: Text(cmsMaster.fromDate+' - '+cmsMaster.fromDate+' | '+cmsMaster.uptoTime,
                                        style: TextStyle(
                                            fontSize: 16,

                                            color:  Color(0xFFb2b2b2)),
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Text(cmsMaster.location,
                                        style: TextStyle(
                                            fontSize: 16,

                                            color: Color(0xFFA9AFC0) ),
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(5, 3, 5, 5),
                                      child: Text(
                                        cmsMaster.title,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color:Colors.white),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(cmsMaster.subTitle,
                                        style: TextStyle(
                                            fontSize: 16,

                                            color: Color(0xFFA9AFC0) ),
                                        textAlign: TextAlign.center),
                                  ),




                                  SizedBox(height: 5),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          color: Colors.white,
                                        ),
                                        SizedBox(height: 20),



                                        Html(
                                          data: cmsMaster.about,
                                          style: {
                                            "html": Style(
                                              color: Colors.white,
                                            ),
                                          },
                                        ),








                                        Container(
                                          margin: EdgeInsets.only(top: 5),

                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          child: Text('REGISTER & PAY',style: TextStyle(color: Colors.white),),),
                                        Container(
                                          alignment:Alignment.center,
                                          margin: EdgeInsets.only(top: 5),

                                          child:InkWell(
                                            onTap:(){
                                              if (ApplicationVariables.currentUser != null) {
                                                Navigator.pop(context);
                                                eventDetailsTwoDialog(context, cmsMaster);
                                              } else {
                                                Navigator.pop(context);
                                                eventLoginDialog(context, cmsMaster);
                                              }

                                            },
                                            child: Container(
                                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),


                                                decoration: BoxDecoration(
                                                    color:themeColorBlue,
                                                    borderRadius: BorderRadius.all(Radius.circular(30))
                                                ) ,
                                                child:Image.asset('assets/rightArrowGolden.png')
                                            ),
                                          ), ),


                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -30,
                              child: Stack(

                                clipBehavior: Clip.hardEdge,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xFF0b183b),

                                    child: Text('\$'+cmsMaster.eventPrice,style: TextStyle(color: themeColor,
                                        fontWeight: FontWeight.w600),
                                    ),
                                    radius: 50.0,
                                    /*  child:  CachedNetworkImage(
            imageUrl:
            ApplicationVariables.apiEndPoint + cmsMaster.featuredImage,
            //height:136 ,
            fit: BoxFit.cover),*/

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        ),

                  ],
                ));
          },
        );
      });
}
