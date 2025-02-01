import 'package:bvua/screens/side_menu/profile_edit_screen.dart';
import 'package:bvua/utilities/colours.dart';
import 'package:bvua/utilities/common_function.dart';
import 'package:bvua/utilities/font_text_Style.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  Map<String, dynamic> profileData = {
    "Name": "Ms Mehnaj Khatoon",
    "Sex": "Female",
    "Date of Birth": "2003-08-01",
    "Email": "mehnaj0321@gmail.com",
    "Address for Correspondence": "DLF my pad India",
    "Mobile": "9695844884",

  };

  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor:AppColors.drawerButton1Color, // Customize app bar color
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 28,
              ), // Menu icon
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'My Profile',
              style: FTextStyle.HeadingTxtWhiteStyle,
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: (displayType == 'desktop' || displayType == 'tablet')
                      ? 70
                      : 37,
                  child: ElevatedButton(
                      onPressed: () async {


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditProfile()       ),

                        );

                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          backgroundColor: Colors.white),
                      child: Icon(Icons.edit_calendar_rounded,color: AppColors.primaryColour,)),
                ),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Container(
                        width: height * 0.15, // Adjust width as needed
                        height: height * 0.15, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200, // Background color for placeholder
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile.png'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child:
                    Column(
                      children: profileData.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "${entry.key}:",
                                  style: FTextStyle.Faqssubtitle,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  entry.value.toString(),
                                  style: FTextStyle.formhintTxtStyle,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )

                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 23.0),
                //   child: SizedBox(
                //     height: (displayType == 'desktop' || displayType == 'tablet') ? 70 : 40,
                //     child: ElevatedButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const EditProfile(),
                //           ),
                //         );
                //       },
                //       style: ElevatedButton.styleFrom(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(12),
                //         ),
                //         backgroundColor: AppColors.primaryColour,
                //       ),
                //       child: Text(
                //         "Edit Profile",
                //         style: FTextStyle.loginBtnStyle,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          )

// Helper function to build rows for information display


      ),
    );
  }

}