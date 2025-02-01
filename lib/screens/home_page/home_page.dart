import 'package:bvua/screens/auth_section/login_screen.dart';
import 'package:bvua/screens/side_menu/profile_screen.dart';
import 'package:bvua/utilities/colours.dart';
import 'package:bvua/utilities/common_function.dart';
import 'package:bvua/utilities/flutter_flow_animations.dart';
import 'package:bvua/utilities/font_text_Style.dart';
import 'package:bvua/utilities/pref_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLogoutDialogVisible = false;

  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> listItem = [
    {'subtitle': 'Profile', 'icon': Icons.person},
    {'subtitle': 'Login', 'icon': Icons.login},
    {'subtitle': 'Logout', 'icon': Icons.logout},
  ];

  int currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  final List<Map<String, String>> bannerData = [
    {
      "image": "assets/images/onboard.png",
      "text": "Explore our latest offerings for unmatched experiences."
    },
    {
      "image": "assets/images/textile.png",
      "text": "Discover new horizons with our curated services."
    },
    {
      "image": "assets/images/onboard.png",
      "text": "Empowering your journey with quality and innovation."
    },
  ];


  final List<Map<String, String>> cardData = [
    {
      "title": "Leadership",
      "subtitle":
          "An opportunity to Lead, Network, Develop personally and professionally and support for navigating the changing demands of leadership and excelling within and outside the community."
    },
    {
      "title": "Growth & Mentoring",
      "subtitle":
          "An opportunity to be mentored, get access to policy & advocacy processes, engage & connect for personal and professional growth."
    },
    {
      "title": "Networking & Connectivity",
      "subtitle":
          "Facilitating global connectivity & a widespread exposure, we aim to give an opportunity to all members to grow & flourish together."
    },
    {
      "title": "Business & Promotions",
      "subtitle":
          "Focus on enhancing work skills & competencies, giving opportunities to promote & support each other’s business ventures and initiatives."
    },
  ];

  final List<Map<String, String>> focusData = [
    {
      "images": "assets/images/focus.png",
      "subtitle":
          "To co-create ecosystems that enable professionals, individuals & business owners to live up to their full economic & social potential."
    },
    {
      "images": "assets/images/focus2.png",
      "subtitle":"Providing both inspiration and direction through success stories, workshops and expert advice & business network"

    } ,
    {
      "images": "assets/images/focuse3.png",
      "subtitle":"Engaging in interactive sessions and masterclasses with industry stalwarts"

    }  ,
    {
      "images": "assets/images/focus4.png",
      "subtitle":"Developing capabilities to get on to the boards of companies"

    }


  ];

  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.drawerButton1Color,
          // Customize app bar color
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 32,
            ), // Menu icon
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer(); // Open the drawer
            },
          ),
          title: Text(
            'Home Page',
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),
          // Title of the app bar
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 180,
                child: UserAccountsDrawerHeader(
                  accountName: Text("", style: FTextStyle.nameProfile),
                  accountEmail: Text(
                    "Banarasi Vastra Udyog Association",
                    style: FTextStyle.nameProfile,
                    maxLines: 2,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.drawerButton1Color,
                  ),
                ),
              ),
              ...listItem.map((item) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        item['icon'],
                        color: AppColors.aboutUsHeadingColor,
                      ),
                      title: Text(item['subtitle'],
                          style: FTextStyle.FaqsTxtStyle),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer

                        switch (item['subtitle']) {
                          case 'Login':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogScreen()),
                            );
                            break;

                          case 'Profile':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyProfile()),
                            );
                            break;

                          case 'Logout':
                            _showLogDialog(-1);
                            break;
                          default:
                            // Handle default case if needed
                            break;
                        }
                      },
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.drawerButton1Color,
                      thickness: 0.5,
                    ), // Add a divider after each ListTile
                  ],
                );
              }),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
         children: [
           Padding(
               padding:
               const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
               child:
               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                 // Banner Carousel
                 Stack(
                 alignment: Alignment.bottomCenter,
                 children: [
                   CarouselSlider(
                     items: bannerData.map((data) {
                       return Stack(
                         children: [
                           // Banner Image
                           ClipRRect(
                             borderRadius: BorderRadius.circular(10.0),
                             child: Image.asset(
                               data["image"]!,
                               fit: BoxFit.cover,
                               width: double.infinity,
                             ),
                           ),
                           // Text Overlay
                           Positioned(
                             bottom: 20,
                             left: 20,
                             right: 20,
                             child: Container(
                               padding: const EdgeInsets.symmetric(
                                 vertical: 8,
                                 horizontal: 12,
                               ),
                               decoration: BoxDecoration(
                                 color: Colors.black.withOpacity(0.5),
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               child: Text(
                                 data["text"]!,
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500,
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                           ),
                         ],
                       );
                     }).toList(),
                     options: CarouselOptions(
                       height: MediaQuery.of(context).size.height * 0.3,
                       autoPlay: true,
                       enlargeCenterPage: true,
                       onPageChanged: (index, reason) {
                         setState(() {
                           currentIndex = index;
                         });
                       },
                     ),

                   ),
                   // Smooth Page Indicator
                   Positioned(
                     bottom: 10,
                     child: AnimatedSmoothIndicator(
                       activeIndex: currentIndex,
                       count: bannerData.length,
                       effect: ExpandingDotsEffect(
                         activeDotColor: Colors.white,
                         dotColor: Colors.white.withOpacity(0.5),
                         dotHeight: 8,
                         dotWidth: 8,
                         expansionFactor: 2,
                         spacing: 8,
                       ),
                     ),
                   ),
                 ],
               ),
                 SizedBox(height: 20),

                 // Horizontal Scrollable Cards
                 Container(

                     height: MediaQuery.of(context).size.height * 0.24,
                     child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: cardData.length,
                         itemBuilder: (context, index) {
                           return Padding(
                             padding:
                             const EdgeInsets.symmetric(horizontal: 4.0),
                             child: Card(
                               elevation: 4.0,
                               color:  Color(0x9DFF6B8E),
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10.0),
                               ),
                               child: Container(
                                 width: MediaQuery.of(context).size.height * 0.34,
                                 padding: EdgeInsets.all(16.0),
                                 child: Column(
                                   crossAxisAlignment:
                                   CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                         cardData[index]["title"]!,
                                         style: FTextStyle.emailProfile.copyWith(color: Color(
                                             0xFFFDDC7C),fontSize: 18,    fontFamily: "Outfit-SemiBold",fontWeight: FontWeight.w500)
                                     ),
                                     SizedBox(height: 10),
                                     Text(
                                       cardData[index]["subtitle"]!,
                                       style: FTextStyle.nameProfile.copyWith(fontSize: 15,  fontWeight: FontWeight.w400,  fontFamily: "Outfit-Regular",)
                                       ,
                                       textAlign: TextAlign.justify,
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           );
                         })),



                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 5.0,),
                   child: Container(
                     height: MediaQuery.of(context).size.height * 0.68,
                     color: Color(0x94FAFAF9),
                     child: Padding(
                       padding: const EdgeInsets.all(18.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           Text(
                               "About",
                               style: FTextStyle.listTitle.copyWith(fontSize: 22,    fontFamily: "Outfit-SemiBold",fontWeight: FontWeight.w500)
                           ),

                           SizedBox(height: 10,),

                           ClipRRect(
                           borderRadius: BorderRadius.circular(10.0),
                           child: Image.asset(
                           "assets/images/about.png",
                           fit: BoxFit.cover,
                           width: double.infinity,
                             height: 220,
                           ),
                           ),
                           SizedBox(height: 10,),
                           Text(
                               "Banarasi Vastra Udyog Association is the hub of Varanasi's textile and apparel industry. We represent artisans, master weavers, traders, entrepreneurs, individuals, family business owners and enthusiasts in this sector and community. Established in [Year] by [Members], our association is deeply rooted in Varanasi's history and legacy for good work and culture. For generations, our city has been renowned for its exquisite textiles, and we're committed to preserving and advancing this unique industry.",
                               style: FTextStyle.smallTextBlack.copyWith(   fontFamily: "Outfit-SemiBold",fontWeight: FontWeight.w500)
                           ),

                         ],
                       ),
                     ),

                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 18.0),
                   child: Container(
                     height: MediaQuery.of(context).size.height * 0.25,
                     decoration: BoxDecoration(
                       color: Color(0xFFFDDC7C),
                       borderRadius: BorderRadius.circular(16),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withOpacity(0.1),
                           blurRadius: 10,
                           offset: Offset(0, 5),
                         ),
                       ],
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "Vision",
                             style: TextStyle(
                               fontSize: 22,
                               fontWeight: FontWeight.w600,
                               fontFamily: "Outfit-SemiBold",
                               color: Colors.black,
                             ),
                           ),
                           SizedBox(height: 10),
                           Text(
                             "We aim to ensure the success of the community in an ever-changing world. Our commitment is to the well-being of our members, the promotion of Varanasi textiles, several business owners, and the economic growth of the region.",
                             style: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w400,
                               fontFamily: "Outfit-SemiBold",
                               color: Colors.black87,
                             ),
                             textAlign: TextAlign.justify,
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                 SizedBox(height: 10),

                 // Mission Container
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 18.0),
                   child: Container(
                     height: MediaQuery.of(context).size.height * 0.25,
                     decoration: BoxDecoration(
                       color: Color(0xFFF6B8CB),
                       borderRadius: BorderRadius.circular(16),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withOpacity(0.1),
                           blurRadius: 10,
                           offset: Offset(0, 5),
                         ),
                       ],
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "Mission",
                             style: TextStyle(
                               fontSize: 22,
                               fontWeight: FontWeight.w600,
                               fontFamily: "Outfit-SemiBold",
                               color: Colors.black,
                             ),
                           ),
                           SizedBox(height: 10),
                           Text(
                             "Our mission is to offer a unified platform for everyone involved in Varanasi's textile industry. This involves supporting weavers in the villages, linking traders in the markets, and partnering with entrepreneurs who share our passion for this craft.",
                             style: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w400,
                               fontFamily: "Outfit-SemiBold",
                               color: Colors.black87,
                             ),
                             textAlign: TextAlign.justify,
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                 SizedBox(height: 20),
Container(height: MediaQuery.of(context).size.height * 0.5,
  decoration: BoxDecoration(
  color: AppColors.disableButtonColor,
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
),
child: Column(
  children: [
Padding(
  padding: const EdgeInsets.symmetric(vertical: 20.0,),
  child: Text("Focus area",style: FTextStyle.nameProfile.copyWith(fontSize: 20,fontWeight: FontWeight.w800),),
),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Text("To co-create ecosystems that enable professionals, individuals "
          "& business owners to live up to their full economic & social potential"
        ,style: FTextStyle.nameProfile.copyWith(fontSize: 16,fontWeight: FontWeight.w500),),
    )

   ,
    SizedBox(height: 30,),

    CarouselSlider(
      items: focusData.map((data) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    data['images']!,
                    fit: BoxFit.fill,
                    height: 80,
                    width: 100,

                  ),
                ),
                SizedBox(height: 20),
                Text(
                  data['subtitle']!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.28,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    ),

  ],
),


),
                 SizedBox(height: 20),
               ],
               ),


    ),
    ])
    );




  }

  void _showLogDialog(int index) {
    if (_isLogoutDialogVisible) return; // Prevent showing multiple dialogs

    _isLogoutDialogVisible = true; // Set the flag when showing the dialog

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Are you sure you want to logout?",
                      style: FTextStyle.preHeadingStyle),
                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.formFieldBackColour,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.black)),
                        onPressed: () {
                          Navigator.of(context).pop();
                          _isLogoutDialogVisible =
                              false; // Reset the flag when closed
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.drawerButton1Color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: const Text("OK",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          PrefUtils.setIsLogin(false);
                          PrefUtils.setToken("");
                          // Save user
                          PrefUtils.setUserEmailLogin("");
                          // Save  role
                          // PrefUtils.setUserId(0);

                          PrefUtils.setUserPassword("");
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogScreen()),
                            (route) =>
                                false, // This will remove all previous routes
                          ); // Close the dialog
                          _isLogoutDialogVisible = false; // Reset the flag
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _isLogoutDialogVisible =
          false; // Reset the flag when the dialog is closed
    });
  }
}
