import 'dart:async';

import 'package:pal/Models/CMSMaster.dart';
import 'package:pal/controller/AppActions.dart';
import 'package:pal/helpers/applicationvariables.dart';

class StartUp{

  static void getCMSTypeMaster() {



    AppAction appAction = new AppAction();
    new AppAction().getBanners().then((value){
      ApplicationVariables.allBanners = value;
    });
    new AppAction().getNewsAndArticle().then((value){
      ApplicationVariables.allNewsAndArticle = value;
    });
    new AppAction().getQAndA().then((value){
      ApplicationVariables.allQAndA = value;
    });
    new AppAction().getMiscellaneous().then((value){
      ApplicationVariables.allMiscellaneous = value;
    });

    new AppAction().getPartnersAndDiscounts().then((value){
      ApplicationVariables.allGetAllActivePartners=value;
    });
    new AppAction().getClevelandPalEvents().then((value){
      ApplicationVariables.allGetCleaveLandPalEvents=value;
    });

    new AppAction().getBingoMaster().then((value){
      ApplicationVariables.allGetBingoMasters=value;
    });

    new AppAction().getAllActivePhotos().then((value){
      ApplicationVariables.allGetAllActivePhotos=value;
    });
   /* Timer.periodic(Duration(seconds: 30), (timer) {
      new AppAction().getBanners().then((value){
        ApplicationVariables.allBanners = value;
      });
      new AppAction().getNewsAndArticle().then((value){
        ApplicationVariables.allNewsAndArticle = value;
      });
      new AppAction().getQAndA().then((value){
        ApplicationVariables.allQAndA = value;
      });
      new AppAction().getMiscellaneous().then((value){
        ApplicationVariables.allMiscellaneous = value;
      });
    });

*/

    //   ApplicationVariables.allCMSTypeMaster =await new   AppAction().getCMSTypeMaster();
    // ApplicationVariables.allCMSTypeMaster.forEach((element) async {
    //   element .cmsMaster = await  getCMSMaster(element.cmsTypeID);
    // });
}

}