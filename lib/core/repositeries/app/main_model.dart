class MainModel{
      ///Singleton Settings
      static final MainModel _singleton = MainModel._internal();
      factory MainModel() {
        return _singleton;
      }
      MainModel._internal();
      String userTokken="";
      String userId="";
      String userName="";
      bool userAuth=false;
  
}
