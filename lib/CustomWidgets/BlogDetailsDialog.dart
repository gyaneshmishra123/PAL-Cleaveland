import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import 'package:pal/Models/NewsAndArticle.dart';

blogDetailsDialog(BuildContext context, NewsAndArticle cmsMaster) {
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
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(cmsMaster.title,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Html(
                                data: cmsMaster.body,
                                style: {
                                  "html": Style(
                                    color: Colors.white,
                                  ),
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ));
          },
        );
      });
}
