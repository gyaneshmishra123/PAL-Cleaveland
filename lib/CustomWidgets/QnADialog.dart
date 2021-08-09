import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pal/Utilities/colorsUsing.dart';
final _qnaFormKey=GlobalKey<FormState>();
TextEditingController _email=TextEditingController();
TextEditingController _message=TextEditingController();


qnaDialog(BuildContext context) {
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
                              color: Color(0xFFc29a6a)),
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                                child: Text("HAVE A QUESTION?",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                    textAlign: TextAlign.center),
                              ),
                              Text("Use the form below to send us your question.",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFFFFFFFF)),
                                  textAlign: TextAlign.center),
                              SizedBox(height: 20),
                              Text("CHOOSE AN AMOUNT TO GIVE",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xFFFFFFFF)),
                                  textAlign: TextAlign.center),
                              SizedBox(height: 10),
                              _qnaForm(),
                              _submitButton(context),

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
                              child: Image.asset(
                                "assets/qna2.png",height: 70,
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
Widget _qnaForm(){
  return Form(
    key: _qnaFormKey,
    child: Column(

      children: [

        Container(
          padding: EdgeInsets.all(5),
          child:  TextFormField(



              cursorColor: Color(0xFF9b7745),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Color(0xFF9b7745),
              ),
              decoration: InputDecoration(hintText: "Your Email(optional)",
                hintStyle: TextStyle(color: Color(0xFF9b7745)),


                focusColor: Colors.white,hoverColor: Colors.white,
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
        ),

        Container(
          padding: EdgeInsets.all(5),
          child: TextFormField(

              controller: _message,

              maxLines: 5,
              validator: (value) {
                if (value.isEmpty) {
                  return 'required';
                }
                return null;
              },
              cursorColor: Color(0xFF9b7745),
              //  keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Color(0xFF9b7745),
              ),
              decoration: InputDecoration(hintText: "What is your question?",
                hintStyle: TextStyle(color: Color(0xFF9b7745)),
                filled: true,
                focusColor: Colors.white,
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
        ),
      ],
    ),
  );

}
Widget _submitButton(context){
  return InkWell(
    onTap: (){
      if(_qnaFormKey.currentState.validate())

      {
          Navigator.pop(context);
      }
    },
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 5,bottom: 5),
      alignment: Alignment.center,

      color: themeColorBlue,
      child: Text('SUBMIT YOUR QUESTION',style: TextStyle(color: Colors.white),),
    ),
  );
}
