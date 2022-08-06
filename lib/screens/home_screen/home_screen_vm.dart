import 'dart:async';

import 'package:cashqwik/app/contracts/base_view_model.dart';
import 'package:cashqwik/app/services/app/get_home_data_service.dart';
import 'package:cookee_common/Services/convert_service.dart';

class HomeScreenVM extends BaseViewModel {
  @override
  void dispose() {
    // TODO: implement dispose
    _memController.close();
  }

  int pageCount = 1;
  int itemCount = 10;
  int apiPage = 1;
  List<Map<String, dynamic>> resultData = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> listtData = <Map<String, dynamic>>[];

  final _memController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  StreamSink<List<Map<String, dynamic>>> get _memSink => _memController.sink;
  Stream<List<Map<String, dynamic>>> get memStream => _memController.stream;

  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get getLoaderStream => _loaderController.stream;

  HomeScreenVM() {
    getData();
  }

  getData() async {
    //await GetHomeDataService().get();
    for (var element in appModel!.customerData) {
      resultData.add(element);
    }
    listtData = resultData;
    print(appModel!.customerData.length);
  }

  /*Future<void> swipeRefresh() async {
    await GetHomeDataService().get();
  }*/

  loadMoreData() async {
    pageCount++;
    List<Map<String, dynamic>> currentData =
        resultData.skip(pageCount * itemCount).take(itemCount).toList();
    if (currentData.isNotEmpty) {
      listtData.addAll(currentData);

      _memSink.add(listtData);
    } else {
      _paginateApiCall();
    }
  }

  _paginateApiCall() async {
    if (resultData.length < appModel!.total) {
      _loaderSink.add(true);
      // pageCount++;

      await GetHomeDataService().get(ConvertService.convertString(pageCount));
      for (var element in appModel!.customerData) {
        resultData.add(element);
      }
      _loaderSink.add(false);
      List<Map<String, dynamic>> currentData =
          resultData.skip((pageCount - 1) * itemCount).take(itemCount).toList();
      if (currentData.isNotEmpty) {
        listtData.addAll(currentData);

        _memSink.add(listtData);
      }
    }
  }
}
