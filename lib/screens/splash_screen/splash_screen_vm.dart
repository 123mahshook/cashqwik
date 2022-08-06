import 'package:cashqwik/app/contracts/base_view_model.dart';
import 'package:cashqwik/app/services/app/get_home_data_service.dart';
import 'package:cashqwik/utility/common/common_navigate.dart';

class SplashScreenVM extends BaseViewModel {
  // final _fcmService = FcmService();
  @override
  void dispose() {
    // TODO: implement dispose
  }

  SplashScreenVM() {
    checkAuth();
  }

  checkAuth() async {
    await GetHomeDataService().get("1");
    await Future.delayed(const Duration(seconds: 4));
    CommonNavigate(parentContext: parentContext!).navigateWelcomeScreen();
  }

  /* _initialiseNotification() async {
    try {
      _fcmService.initialize();
    } catch (_) {}
  }*/
}
