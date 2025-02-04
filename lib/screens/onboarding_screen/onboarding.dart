import 'package:bvua/screens/all_bloc/auth_flow_bloc.dart';
import 'package:bvua/screens/auth_section/login_screen.dart';
import 'package:bvua/utilities/colours.dart';
import 'package:bvua/utilities/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onBoardingList = [
    {
      "image": "assets/images/onboard1.png",
      "title": "Preserving Heritage, Empowering Artisans",
      "desc":
      "Welcome to the hub of Varanasi's rich textile and apparel industry! We're proud to represent artisans, master weavers, traders, entrepreneurs, family business owners, and enthusiasts who make our community vibrant",
    },
    {
      "image": "assets/images/onboard.png",
      "title": "Deeply Rooted in Tradition",
      "desc": "Established in [Year] by [Members], our association is a testament to Varanasi's history and culture. For generations, our city has been celebrated for its exquisite textiles, and we're here to preserve this legacy"
    },
    {
      "image": "assets/images/onboard2.png",
      "title": "Advancing the Textile Industry",
      "desc": "We're committed to supporting the growth and development of Varanasi's textile industry. Together, we aim to uphold the craftsmanship and innovation that make our community stand out."
    },
  ];

  void onNext() {
    if (currentIndex < onBoardingList.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => AuthFlowBloc()
              ,
              child: LogScreen(),
            )
        ),
      );
    }
  }

  @override
  void initState() {
    currentIndex = 0;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              itemCount: onBoardingList.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.r),
                          bottomRight: Radius.circular(25.r),
                        ),
                        child: Image(
                          image: AssetImage(onBoardingList[index]['image']!),
                          width: double.infinity,
                          height: mediaQuery.height * 0.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          onBoardingList[index]['title']!,
                          style: FTextStyle.aboutUsText2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          onBoardingList[index]['desc']!,
                          style: FTextStyle.Faqssubtitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onBoardingList.length,
                  effect: ExpandingDotsEffect(
                    paintStyle: PaintingStyle.fill,
                    dotColor: AppColors.dotColor,
                    dotWidth: 10.w,
                    dotHeight: 10.h,
                    activeDotColor: AppColors.activeDotColor,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: GestureDetector(
                    onTap: onNext,
                    child: Container(
                      width: double.infinity,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.drawerButton1Color,
                        borderRadius: BorderRadius.circular(mediaQuery.height),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currentIndex == onBoardingList.length - 1
                                  ? "Sign In"
                                  : "Next   ",
                              style: FTextStyle.loginBtnStyle,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                              size: 19.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex == onBoardingList.length - 1) {
                        // setState(() {
                        //   PrefUtils.setIsLogin(false);
                        // });
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => BlocProvider(
                        //       create: (context) => GuestUserBloc(),
                        //       child: Navigation(),
                        //     ),
                        //   ),
                        // );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              BlocProvider(
                                create: (context) => AuthFlowBloc(),
                                child: LogScreen(),
                              )

                          ),
                        );
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: Center(
                        child: Text(
                          currentIndex == onBoardingList.length - 1
                              ? ""
                              : "Skip",
                          style: FTextStyle.drawerText,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}