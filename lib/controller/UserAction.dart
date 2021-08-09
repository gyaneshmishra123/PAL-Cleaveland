
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pal/CustomWidgets/EventDetailsTwoDialog.dart';
import 'package:pal/CustomWidgets/EventLoginDialog.dart';
import 'package:pal/CustomWidgets/EventsListDialog.dart';
import 'package:pal/CustomWidgets/Registration.dart';
import 'package:pal/Models/GetCleveLandPalEvents.dart';
import 'package:pal/Models/UserInformation.dart';
import 'package:pal/helpers/applicationvariables.dart';
import 'package:pal/helpers/appstorage.dart';
import 'package:pal/helpers/messagebox.dart';
import 'package:pal/views/Home.dart';
import 'package:pal/views/Login.dart';

class UserAction {

  Future<void> logout() async {
    await AppStorage.putString("UserInformation", '');
    ApplicationVariables.currentUser = null;
    Navigator.of(ApplicationVariables.buildContext).pop();
    Navigator.of(ApplicationVariables.buildContext)
        .push(new MaterialPageRoute(builder: (context) => new HomeScreen()));
  }

  Future<bool> login(String username, String password) async {
    var url = ApplicationVariables.apiEndPoint +
        '/Api/User/Login?username=' +
        username +
        '&password=' +
        password;
    print(url);
    var response = await http.post(url);

    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return false;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);
        UserInformation userInformation =
        UserInformation.fromMap(parse["Data"]);
        ApplicationVariables.currentUser =
       userInformation;
        String temp = json.encode(ApplicationVariables.currentUser);
        await AppStorage.putString("UserInformation", temp);



        // Navigator.of(ApplicationVariables.buildContext).pop();
        // Navigator.of(ApplicationVariables.buildContext).push(
          //  new MaterialPageRoute(builder: (context) => new HomeScreen()));
        return true;
      } else
        MessageBox.show(parse["Error"]);
      return false;
    }
  }

  Future<bool> updateProfile(int userID) async {
    var url = ApplicationVariables.apiEndPoint +
        '/Api/User/Profile?userid=' +
        userID.toString();
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return false;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);
        UserInformation userInformation =
        UserInformation.fromMap(parse["Data"]);
        ApplicationVariables.currentUser =
            userInformation;
        String temp = json.encode(ApplicationVariables.currentUser);
        await AppStorage.putString("UserInformation", temp);



        // Navigator.of(ApplicationVariables.buildContext).pop();
        // Navigator.of(ApplicationVariables.buildContext).push(
        //     new MaterialPageRoute(builder: (context) => new HomeScreen()));
        return true;
      } else
        MessageBox.show(parse["Error"]);
      return false;
    }
  }

  Future<bool> signUp(String firstName,String lastName ,String email, String password,BuildContext context,bool check) async {
    var url = ApplicationVariables.apiEndPoint +
        '/api/USer/NewUserSignUp?FirstName='+firstName+'&LastName='+lastName+'&Email='+email+'&Password='+password;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      print(response.body);
      MessageBox.show("Something went wrong please try again later");
      return false;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);
        print('sign up successful==>');
        if(check){
          GetCleaveLandPalEvents cmsMaster;
          eventLoginDialog(context,  cmsMaster);
        }
        else{
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
        }


        return true;
      } else
        MessageBox.show(parse["Error"]);
      return false;
    }
  }


  /*Future<void> signUp(UserInformation signUp) async {
    var url = ApplicationVariables.apiEndPoint + '/api/User/SignUp';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    if (signUp.ProfileImage != null && signUp.ProfileImage != "")
      request.files.add(
          await http.MultipartFile.fromPath('profileImage', signUp.ProfileImage));

    request.fields['details'] = json.encode(signUp);

    var response = await request.send();
    //return res.reasonPhrase;

    print(url);
    if (response.statusCode != 200) {
      print(response.statusCode);
      MessageBox.show("Something went wrong please try again later");
    } else {
      String _ret = await response.stream.bytesToString();

      final parse = json.decode(_ret);
      print(parse);
      //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        MessageBox.show(parse["Data"]);
        Navigator.of(ApplicationVariables.buildContext).pop();
        Navigator.of(ApplicationVariables.buildContext)
            .push(new MaterialPageRoute(builder: (context) => new Login()));
      } else
        MessageBox.show(parse["Error"]);
    }
  }*/


  Future<bool> addChild(Child newChild)async {
//PAddress=janakpuri&HouseNo=16/21&Location=veer nagar&City=kerla&State=Thiruvan&Zip=118989
    var url = ApplicationVariables.apiEndPoint +
        '/Api/User/AddChild?userid=' + ApplicationVariables.currentUser.UserID.toString() +
        '&FirstName=' + newChild.FirstName +
        '&Lastname=' + newChild.LastName +
        '&Gender=' + newChild.Gender +
        '&Age=' + newChild.Age +
        '&PFirstName=' + newChild.PFirstName +
        '&PLastName=' + newChild.PLastName +
        '&PEmail=' + newChild.PEmail +
        '&PContact=' + newChild.PContact +
        '&PAddress=' + newChild.PHouseNumber +
        '&Location=' + newChild.PLocation +
        '&City=' + newChild.PCity +
        '&State=' + newChild.PState +
        '&Zip=' + newChild.PZip ;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return false;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);

       await updateProfile(ApplicationVariables.currentUser.UserID);


        return true;
      } else
        MessageBox.show(parse["Error"]);
      return false;
    }


  }


  Future<bool> changePassword(String oldPassword,String newPassword)async{

//
    var url = ApplicationVariables.apiEndPoint +
        '/Api/User/ChangePassword?oldpassword=' + oldPassword  +
        '&newpassword=' + newPassword +
        '&userid=' + ApplicationVariables.currentUser.UserID.toString();
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return false;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);

        //updateProfile(ApplicationVariables.currentUser.UserID);


        return true;
      } else
        MessageBox.show(parse["Error"]);
      return false;
    }



  }


}