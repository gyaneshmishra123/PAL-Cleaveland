import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pal/Models/Banner.dart';
import 'package:pal/Models/BingoMaster.dart';
import 'package:pal/Models/CMSMaster.dart';
import 'package:pal/Models/CMSTypeMaster.dart';
import 'package:pal/Models/GetAllActivePartners.dart';
import 'package:pal/Models/GetAllActivePhotos.dart';
import 'package:pal/Models/GetCleveLandPalEvents.dart';
import 'package:pal/Models/Miscellaneous.dart';
import 'package:pal/Models/NewsAndArticle.dart';
import 'package:pal/Models/QAndA.dart';
import 'package:pal/helpers/applicationvariables.dart';
import 'package:pal/helpers/messagebox.dart';

class AppAction {
  Future<List<BannerItem>> getBanners() async{
    var url = ApplicationVariables.apiEndPoint +
        '/api/Banners/GetAllActiveBanners?LUD=' + ApplicationVariables.bannerLUD;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return null;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
            print(parse);

        ApplicationVariables.bannerLUD = parse["Data"]["LUD"];
        return parse["Data"]["bannerList"]
            .cast<Map<String, dynamic>>()
            .map<BannerItem>((item) => BannerItem.fromJson(item))
            .toList();
      } else
      {
        MessageBox.show(parse["Error"]);
        return null;
      }
    }
  }

  Future<List<NewsAndArticle>> getNewsAndArticle() async{
    var url = ApplicationVariables.apiEndPoint +
        '/api/NewsAndArticle/GetAllActiveNewsAndArticle?LUD=' + ApplicationVariables.newsAndArticleLUD;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return null;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);

        ApplicationVariables.newsAndArticleLUD = parse["Data"]["LUD"];
        return parse["Data"]["newsAndArticleList"]
            .cast<Map<String, dynamic>>()
            .map<NewsAndArticle>((item) => NewsAndArticle.fromJson(item))
            .toList();
      } else
      {
        MessageBox.show(parse["Error"]);
        return null;
      }
    }
  }


  Future<List<GetAllActivePartners>> getPartnersAndDiscounts() async{
    var url = ApplicationVariables.apiEndPoint +
        '/api/Partner/GetAllActivePartner?LUD=' + ApplicationVariables.getAllActivePartnersLUD;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return null;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);

        ApplicationVariables.getAllActivePartnersLUD = parse["Data"]["LUD"];
        return parse["Data"]["parnetList"]
            .cast<Map<String, dynamic>>()
            .map<GetAllActivePartners>((item) => GetAllActivePartners.fromJson(item))
            .toList();
      } else
      {
        MessageBox.show(parse["Error"]);
        return null;
      }
    }
  }

  Future<List<GetCleaveLandPalEvents>> getClevelandPalEvents() async{
    var url = ApplicationVariables.apiEndPoint +
        '/api/PALEvents/GetAllActivePALEvents?LUD=' + ApplicationVariables.getCleaveLandPalEventsLUD;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return null;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);

        ApplicationVariables.getCleaveLandPalEventsLUD = parse["Data"]["LUD"];
        return parse["Data"]["eventList"]
            .cast<Map<String, dynamic>>()
            .map<GetCleaveLandPalEvents>((item) => GetCleaveLandPalEvents.fromJson(item))
            .toList();
      } else
      {
        MessageBox.show(parse["Error"]);
        return null;
      }
    }
  }

  Future<List<GetAllActivePhotos>> getAllActivePhotos() async{
    var url = ApplicationVariables.apiEndPoint +
        '/api/PastEventPhotos/GetAllActivePhotos?LUD=' + ApplicationVariables.getAllActivePhotosLUD;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return null;
    } else {
      print('inside else ');
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print("Get all Active Photos==> "+parse.toString());

        ApplicationVariables.getAllActivePhotosLUD = parse["Data"]["LUD"];
        return parse["Data"]["imageList"]
            .cast<Map<String, dynamic>>()
            .map<GetAllActivePhotos>((item) => GetAllActivePhotos.fromJson(item))
            .toList();
      } else
      {
        MessageBox.show(parse["Error"]);
        return null;
      }
    }
  }

  Future<List<BingoMaster>> getBingoMaster() async{
    var url = ApplicationVariables.apiEndPoint +
        '/api/bingo/getAllActiveBingoMaster?LUD=' + ApplicationVariables.bingoMasterLUD;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return null;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);

        ApplicationVariables.bingoMasterLUD = parse["Data"]["LUD"];
        return parse["Data"]["bingoList"]
            .cast<Map<String, dynamic>>()
            .map<BingoMaster>((item) => BingoMaster.fromJson(item))
            .toList();
      } else
      {
        MessageBox.show(parse["Error"]);
        return null;
      }
    }
  }

  Future<List<QAndA>> getQAndA() async{
    var url = ApplicationVariables.apiEndPoint +
        '/api/QAndA/GetAllActiveQAndA?LUD=' + ApplicationVariables.qAndALUD;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return null;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);

        ApplicationVariables.qAndALUD = parse["Data"]["LUD"];
        return parse["Data"]["qAndAList"]
            .cast<Map<String, dynamic>>()
            .map<QAndA>((item) => QAndA.fromJson(item))
            .toList();
      } else
      {
        MessageBox.show(parse["Error"]);
        return null;
      }
    }
  }


  Future<List<Miscellaneous>> getMiscellaneous() async{
    var url = ApplicationVariables.apiEndPoint +
        '/api/Miscellaneous/GetAllActiveMiscellaneous?LUD=' + ApplicationVariables.miscellaneousLUD;
    print(url);
    var response = await http.post(url);
    if (response.statusCode != 200) {
      MessageBox.show("Something went wrong please try again later");
      return null;
    } else {
      final parse = json.decode(response.body); //.cast<Map<String, dynamic>>();
      if (parse["Result"] == "Success") {
        print(parse);

        ApplicationVariables.miscellaneousLUD = parse["Data"]["LUD"];
        return parse["Data"]["biscellaneou"]
            .cast<Map<String, dynamic>>()
            .map<Miscellaneous>((item) => Miscellaneous.fromJson(item))
            .toList();
      } else
      {
        MessageBox.show(parse["Error"]);
        return null;
      }
    }
  }





}
