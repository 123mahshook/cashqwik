import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cashqwik/screens/home_screen/HomeBgView.dart';
import 'package:cashqwik/screens/home_screen/home_screen_vm.dart';
import 'package:cashqwik/utility/components/custom_circular_loader.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/custom_sliver_delegate.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/scroll_behaviour.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:cookee_common/Services/convert_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  HomeScreenVM viewModel = HomeScreenVM();
  final GlobalKey<HomeBgViewState> _bgViewKey = GlobalKey();
  double _opacity = 1;
  int selectedPack = 0;
  ScrollController _scrollController = ScrollController();

  _scrollcontroll() {
    _scrollController.addListener(() async {
      _opacity = 1 - (_scrollController.offset / 80);
      _opacity = _opacity <= 0 ? 0 : _opacity;

      _bgViewKey.currentState!.setOpacity(_opacity);

      //lazyloading
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await viewModel.loadMoreData();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollcontroll();
  }

  List<Color> colordt = [
    AppColors.tileHalfGreyColor,
    AppColors.tileGreenColor,
    AppColors.tileOrangeColor,
    AppColors.tileHalfBlueColor,
  ];

  List<Color> pickedColors = [];

  Color changeIndex() {
    int index = 0;
    Random random = Random();

    index = random.nextInt(5);
    return colordt[index];
  }

  setCategoryColors(int categoryLength) {
    do {
      for (var color in colordt) {
        if (pickedColors.length < categoryLength) {
          pickedColors.add(color);
        }
      }
    } while (pickedColors.length < categoryLength);
  }

  List<String> subCatIcons = <String>[
    "f_c_plus",
    "f_topright-arrow",
    "f_bottomright-arrow",
    "f_grid"
  ];

  List<String> subCatName = <String>["NEW", "PAY OFF", "LEND", "MORE"];
  @override
  void dispose() {
    // TODO: implement dispose
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    return Container(
      height: SizeUtils.getScreenHeight(),
      width: SizeUtils.getScreenWidth(),
      //color: AppColors.gradiantTwoColor,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.gradientOneColor, AppColors.gradiantTwoColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      padding: EdgeInsets.only(top: SizeUtils.getHeight(8)),
      child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: RefreshIndicator(
            onRefresh: () async {},
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: SliverAppBarDelegate(
                        minHeight: SizeUtils.getHeight(60),
                        maxHeight: SizeUtils.getHeight(60),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.gradiantTwoColor
                                    .withOpacity(0.08)),
                            child: appBar()))),
                /*SliverPersistentHeader(
                    pinned: true,
                    floating: false,
                  
                    delegate: SliverAppBarDelegate(
                        minHeight: SizeUtils.getHeight(150),
                        maxHeight: SizeUtils.getHeight(235),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.gradiantTwoColor
                                    .withOpacity(0.08)),
                            child: Stack(
                              children: [
                                // categoryListView(),
                                HomeBgView(
                                  key: _bgViewKey,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: SizeUtils.getHeight(110)),
                                  child: subCategoryListView(),
                                ),
                              ],
                            )))),*/
                SliverList(
                    delegate: SliverChildListDelegate([
                  verticalSpace(24),
                  Stack(
                    children: [
                      // categoryListView(),
                      HomeBgView(
                        key: _bgViewKey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: SizeUtils.getHeight(110)),
                        child: subCategoryListView(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: SizeUtils.getHeight(248)),
                        child: Container(
                          color: AppColors.white.withOpacity(0.7),
                          child: recentMembers(),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: AppColors.white.withOpacity(0.7),
                    child: StreamBuilder<bool>(
                        stream: viewModel.getLoaderStream,
                        initialData: false,
                        builder: (context, snapshot) {
                          return snapshot.data!
                              ? const CustomCircularLoader()
                              : const SizedBox();
                        }),
                  ),
                ]))
              ],
            ),
          )),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(SizeUtils.getRadius(5)),
              bottomRight: Radius.circular(SizeUtils.getRadius(5)),
              bottomLeft: Radius.circular(SizeUtils.getRadius(8)),
              topLeft: Radius.circular(SizeUtils.getRadius(8)))),
      height: SizeUtils.getHeight(50),
      width: SizeUtils.getScreenWidth(),
      padding: EdgeInsets.only(
          left: SizeUtils.getWidth(24), right: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: SizeUtils.getHeight(32),
            width: SizeUtils.getHeight(32),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              Utils.getAssetPng("profile_dummy"),
              fit: BoxFit.contain,
            ),
          ),
          Spacer(),
          Text(
            "Home",
            style: FontUtils.getFont14Style(
                color: AppColors.black, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          horizontalSpace(10),
          Container(
            height: SizeUtils.getHeight(22),
            width: SizeUtils.getHeight(22),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              Utils.getAssetPng("f_notification"),
              height: SizeUtils.getHeight(12),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryListView() {
    return SizedBox(
      height: SizeUtils.getHeight(180),
      width: SizeUtils.getScreenWidth(),
      child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: ListView.builder(
              padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(18), right: SizeUtils.getWidth(12)),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                setCategoryColors(5);
                return categoryTile(index);
              })),
    );
  }

  Widget categoryTile(
    int index,
  ) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(right: SizeUtils.getWidth(10)),
      height: SizeUtils.getHeight(180),
      width: SizeUtils.getWidth(140),
      decoration: BoxDecoration(
          color: AppColors.white, //pickedColors[index - 1],
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(18))),
      child: TextButton(
        style: TextButton.styleFrom(
            primary: pickedColors[index],
            padding: EdgeInsets.only(
                right: SizeUtils.getWidth(12),
                top: SizeUtils.getHeight(12),
                left: SizeUtils.getWidth(12)),
            backgroundColor: pickedColors[index].withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: SizeUtils.getHeight(6)),
                  child: AutoSizeText(
                    index % 2 != 0 ? "Owe me" : "I owe",
                    minFontSize: 9,
                    maxLines: 2,
                    style: FontUtils.getFont12Style(
                        color: AppColors.white.withOpacity(0.5)),
                  ),
                ),
                Spacer(),
                Container(
                  height: SizeUtils.getHeight(48),
                  width: SizeUtils.getWidth(48),
                  decoration: BoxDecoration(
                      // color: AppColors.black.withOpacity(0.5),
                      shape: BoxShape.circle),
                  child: Image.asset(
                    Utils.getAssetPng(index % 2 == 0
                        ? "f_top_right_arrow"
                        : "f_bottom_right_arrow"),
                    color: AppColors.white.withOpacity(
                        0.18), //pickedColors[index].withOpacity(0.3),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            AutoSizeText(
              index % 2 != 0 ? "\$ 1 250" : "\$ 1 130",
              minFontSize: 9,
              maxLines: 2,
              style: FontUtils.getFont24Style(
                  color: AppColors.white, fontWeight: FontWeight.w400),
            ),
            verticalSpace(8),
            AutoSizeText(
              "2 debts",
              minFontSize: 9,
              maxLines: 2,
              style: FontUtils.getFont12Style(
                  color: AppColors.white.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
    // );
  }

  Widget userImage(String img) {
    String imgUr = img;
    //"${viewModel.appModel!.storeCategoryImageBaseUrl + img}";
    return img != "" && img.isNotEmpty
        ? CachedNetworkImage(
            errorWidget: (context, url, error) => Image.asset(
                  Utils.getAssetPng("profile_placeholder"),
                  fit: BoxFit.contain,
                ),
            fadeInDuration: const Duration(seconds: 0),
            fadeOutDuration: const Duration(seconds: 0),
            placeholderFadeInDuration: const Duration(seconds: 0),
            placeholder: (context, url) => Image.asset(
                  Utils.getAssetPng("profile_placeholder"),
                  fit: BoxFit.contain,
                ),
            fit: BoxFit.contain,
            imageUrl: imgUr)
        : Image.asset(
            Utils.getAssetPng("profile_placeholder"),
            fit: BoxFit.contain,
          );
  }

  Widget subCategoryListView() {
    return SingleChildScrollView(
      child: SizedBox(
        height: SizeUtils.getHeight(200),
        width: SizeUtils.getScreenWidth(),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeUtils.getHeight(63)),
              child: Container(
                height: SizeUtils.getHeight(75),
                width: SizeUtils.getScreenWidth(),
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
              ),
            ),
            SizedBox(
              height: SizeUtils.getHeight(150),
              width: SizeUtils.getScreenWidth(),
              child: ScrollConfiguration(
                  behavior: NoGlowScrollBehaviour(),
                  child: ListView.builder(
                      padding: EdgeInsets.only(
                          left: SizeUtils.getWidth(18),
                          right: SizeUtils.getWidth(12)),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return subCategoryTile(index);
                      })),
            ),
          ],
        ),
      ),
    );
  }

  Widget subCategoryTile(
    int index,
  ) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(right: SizeUtils.getWidth(1)),
      height: SizeUtils.getHeight(100),
      width: SizeUtils.getWidth(80),
      decoration: BoxDecoration(
          // color: AppColors.readytoDeliverColor, //pickedColors[index - 1],
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: SizeUtils.getHeight(80),
            width: SizeUtils.getWidth(80),
            child: Align(
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: SizeUtils.getHeight(100),
                width: SizeUtils.getWidth(95),
                padding: EdgeInsets.all(SizeUtils.getHeight(11)),
                decoration: BoxDecoration(
                    color: AppColors.white
                        .withOpacity(0.6), //pickedColors[index - 1],
                    shape: BoxShape.circle),
                child: TextButton(
                  clipBehavior: Clip.antiAlias,
                  style: TextButton.styleFrom(
                      primary: AppColors.white,
                      alignment: Alignment.center,
                      backgroundColor: AppColors.black,
                      shape: CircleBorder()),
                  onPressed: () {},
                  child: Image.asset(
                    Utils.getAssetPng(subCatIcons[index]),
                    height: SizeUtils.getHeight(16),
                  ),
                ),
              ),
            ),
          ),
          // verticalSpace(4),
          AutoSizeText(
            // "2 debts",
            subCatName[index],
            minFontSize: 9,
            maxLines: 2,
            style: FontUtils.getFont12Style(
                color: AppColors.black.withOpacity(0.8)),
          ),
          verticalSpace(24),
        ],
      ),
    );
    // );
  }

  Widget recentMembers() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24),
        ),
        child: Row(
          children: [
            AutoSizeText(
              // "2 debts",
              "My debts",
              minFontSize: 9,
              maxLines: 2,
              style: FontUtils.getFont18Style(
                  color: AppColors.black.withOpacity(0.8)),
            ),
            Spacer(),
            InkWell(
              child: AutoSizeText(
                // "2 debts",
                "See All",
                minFontSize: 9,
                maxLines: 2,
                style: FontUtils.getFont14Style(
                    color: AppColors.black.withOpacity(0.3)),
              ),
            ),
          ],
        ),
      ),
      verticalSpace(14),
      StreamBuilder<List<Map<String, dynamic>>>(
          initialData: viewModel.listtData, //resultData,
          stream: viewModel.memStream,
          builder: (context, snapshot) {
            if (snapshot.data!.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(
                    top: SizeUtils.getHeight(100),
                    bottom: SizeUtils.getHeight(1560)),
                child: Center(
                  child: Text(
                    "No Accounts Found",
                    style: FontUtils.getFont12Style(
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: SizeUtils.getHeight(110),
                  top: SizeUtils.getHeight(24),
                  left: SizeUtils.getWidth(24),
                  right: SizeUtils.getWidth(24),
                ),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return memberTile(index, snapshot.data![index]);
                },
              );
            }
          }),
    ]);
  }

  Widget memberTile(
    index,
    Map<String, dynamic> user,
  ) {
    return InkWell(
        splashColor: AppColors.transparent,
        focusColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        onTap: () {},
        child: Container(
          // height: SizeUtils.getHeight(105),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))),
          margin: EdgeInsets.only(bottom: SizeUtils.getHeight(10)),
          padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.getWidth(12),
              vertical: SizeUtils.getRadius(12)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: SizeUtils.getHeight(48),
                    width: SizeUtils.getHeight(48),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.circular(SizeUtils.getRadius(6))),
                    child: /* Image.asset(
                    Utils.getAssetPng("welcome"),
                    fit: BoxFit.cover,
                  ),*/
                        userImage(ConvertService.convertString(user["Img"]))),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(
                    left: SizeUtils.getWidth(8),
                    right: SizeUtils.getWidth(8),
                    bottom: SizeUtils.getHeight(12),
                  ),
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: SizeUtils.getWidth(170),
                                child: Text(
                                  //"jhone",
                                  ConvertService.convertString(user["Name"]),
                                  maxLines: 1,
                                  style: FontUtils.getFont14Style(
                                      color: AppColors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              verticalSpace(7),
                              SizedBox(
                                width: SizeUtils.getWidth(80),
                                child: Text(
                                  "Untill 20/03/22",
                                  maxLines: 1,
                                  style: FontUtils.getFont10Style(
                                      color:
                                          AppColors.fonttGrey.withOpacity(0.4),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //  const Spacer(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$ 100",
                                maxLines: 1,
                                style: FontUtils.getFont14Style(
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              ),
                              verticalSpace(7),
                              Text(
                                "out of \$ 300",
                                maxLines: 1,
                                style: FontUtils.getFont10Style(
                                    color: AppColors.fonttGrey.withOpacity(0.4),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ))
              ],
            ),
          ]),
        ));
  }
}
