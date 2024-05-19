import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_constants.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../login/form.dart';
import 'utils/page_model01.dart';
import 'utils/page_model02.dart';
import 'utils/page_model03.dart';

import '../../core/constants/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handlePageChange);
    _controller.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _currentPage = _controller.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pagesEN = [
      PageModel2(
        controller: _controller,
      ),
      PageModel3(
        controller: _controller,
      ),
      PageModel1(
        controller: _controller,
      ),
    ];
    PageController controller = PageController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: InkWell(
              onTap: () {
                // hide keyboard when user taps outside the text field
                MagicRouter.navigateTo(const LoginView());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '.',
                    style: AppTextStyle.titleStyle.copyWith(
                      color: ColorManager.primaryColor,
                      fontFamily: AppConstants.englishFont,
                    ),
                  ),
                  Text(
                    AppConstants.appName,
                    style: AppTextStyle.titleStyle.copyWith(
                      fontFamily: AppConstants.englishFont,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            height: 6.h,
            width: 1.sw,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              controller: controller,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Container(
                    height: 1.h,
                    width: .3.sw,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? ColorManager.greyTextColor
                          : ColorManager.greyTextColor.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: .83.sh,
            width: 1.sw,
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: _controller,
                itemCount: pagesEN.length,
                itemBuilder: (context, index) {
                  return pagesEN[index];
                }),
          ),
        ],
      ),
    );
  }
}
