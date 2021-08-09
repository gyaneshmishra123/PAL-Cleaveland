import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pal/helpers/applicationvariables.dart';

pastGalleryDialog(BuildContext context) {
  int _currentSlide = 0;
  bool isSwitched = false;

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
                      ),
                      // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                                height:
                                    MediaQuery.of(context).size.height * (0.7),
                                enlargeCenterPage: false,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentSlide = index;
                                  });
                                }),
                            items: ApplicationVariables.allCMSMaster.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Stack(
                                    fit: StackFit.loose,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.asset(
                                            i.image,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0.0,
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                (0.7123),
                                            child: Stack(

                                              clipBehavior: Clip.none,
                                              children: [Padding(
                                                padding: const EdgeInsets.only(top: 10.0),
                                                child: Text(i.sDesc,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                        color: Color(0xFFc3c6cf))),
                                              ),

                                                Positioned(
                                                  top:-30,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      GestureDetector(
                                                          onTap: () {
                                                            print(
                                                                'click on facebook');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                'assets/facebookGreen.png'),
                                                            fit: BoxFit.cover,
                                                            height: 40,
                                                          )),
                                                      SizedBox(width: 8),
                                                      GestureDetector(
                                                          onTap: () {
                                                            print('click on twitter');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                'assets/twitterGreen.png'),
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
                                                                'assets/uploadGreen.png'),
                                                            fit: BoxFit.cover,
                                                            height: 40,
                                                          )),
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0xFF0c1021)
                                                    .withOpacity(0.8),
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15))),
                                          ))
                                    ],
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                    Positioned(
                      top: -65,
                      child: Stack(

                        clipBehavior: Clip.none,
                        children: [
                          SizedBox.fromSize(
                            size: Size(56, 56), // button width and height
                            child: ClipOval(
                              child: Material(
                                color: Color(0xFFa2753b), // button color
                                child: InkWell(
                                  splashColor: Colors.green, // splash color
                                  onTap: () {}, // button pressed
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.close), // icon
                                      Text("Close"), // text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
          },
        );
      });
}
