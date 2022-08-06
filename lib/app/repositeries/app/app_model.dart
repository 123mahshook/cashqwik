class AppModel {
  ///Singleton Settings
  static final AppModel _singleton = AppModel._internal();
  factory AppModel() {
    return _singleton;
  }
  AppModel._internal();

  List<dynamic> customerData = <Map<String, dynamic>>[];
  int total = 0;
}
