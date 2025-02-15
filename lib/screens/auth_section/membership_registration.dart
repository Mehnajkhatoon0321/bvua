import 'package:bvua/screens/home_page/home_page.dart';
import 'package:bvua/screens/payment/membership_payment.dart';
import 'package:bvua/utilities/colours.dart';
import 'package:bvua/utilities/constant.dart';
import 'package:bvua/utilities/flutter_flow_animations.dart';
import 'package:bvua/utilities/font_text_Style.dart';
import 'package:bvua/utilities/form_field_style.dart';
import 'package:bvua/utilities/no_space_input_formatter.dart';
import 'package:bvua/utilities/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembershipRegistration extends StatefulWidget {
  const MembershipRegistration({super.key});

  @override
  State<MembershipRegistration> createState() => _MembershipRegistrationState();
}

class _MembershipRegistrationState extends State<MembershipRegistration> {

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

  int _selectedValue = 1;
  final List<String> _productCategories = ['Fabrics', 'Yarn Material ( Retail / Wholesale)', 'Sarees', 'Suits (unstitched)', 'Dupattas', 'Lehengas (unstitched)', 'Retail Store', 'Others'];
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _memberNumberController = TextEditingController();
  final TextEditingController _natureOfCompanyNameController = TextEditingController();
  final TextEditingController _registerContactNoController = TextEditingController();
  final TextEditingController _productCategoryNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool addVisibility = false;
  List<Map<String, dynamic>> itemList = [];
  List<Map<String, dynamic>> addressDetails = [];
  List<Map<String, dynamic>> contactNumberList = [];
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _companyFocusNode = FocusNode();
  final FocusNode _natureFocusNode = FocusNode();
  final FocusNode _memberShipFocusNode = FocusNode();
  final FocusNode _contactNumberFocusNode = FocusNode();
  final FocusNode _memberNumberShipFocusNode = FocusNode();
  bool isButtonEnabled = false;
  bool isEmailFieldFocused = false;
  bool isCompanyFieldFocused = false;
  bool isNatureFieldFocused = false;
  bool _contactErrorMessage = false;
  bool _addressErrorMessage = false;
  bool _contactNumberErrorMessage = false;
  bool _memberNumberErrorMessage = false;
  final GlobalKey<FormFieldState<String>> _emailKey =
  GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _companyKey =
  GlobalKey<FormFieldState<String>>();  final GlobalKey<FormFieldState<String>> _memberKey =
  GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _natureKey =
  GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _contactKey =
  GlobalKey<FormFieldState<String>>();


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1),),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Form(
                key: _formKey,
                  onChanged: () {
                    final isValidEmail = ValidatorUtils.isValidEmail(_emailController.text);
                    final isValidCompanyName =
                    ValidatorUtils.isValidCompanyName(_companyNameController.text);
                    final isValidMembershipNumber = ValidatorUtils.isValidMemberShipNumberData(
                        _memberNumberController.text);

                    final isContactNumber=ValidatorUtils.isValidPhone( _registerContactNoController.text);

                    bool isAllValid = _selectedValue == 2
                        ? isValidEmail && isValidCompanyName && isValidMembershipNumber && isContactNumber
                        : isValidEmail && isValidCompanyName && isContactNumber;

                    setState(() {
                      isButtonEnabled = isAllValid;
                    });

                    if (isEmailFieldFocused) {
                      _emailKey.currentState?.validate();
                    }
                    if (isCompanyFieldFocused) {
                      _companyKey.currentState?.validate();
                    }
                    if (isNatureFieldFocused) {
                      _natureKey.currentState?.validate();
                    }
                    if (_contactNumberFocusNode.hasFocus) {
                      _contactKey.currentState?.validate();
                    }
                    if (_memberShipFocusNode.hasFocus) {
                      _memberKey.currentState?.validate();
                    }
                  },



                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h), // Spacing between radio buttons
                    Image.asset(
                      'assets/images/appLogo.png',
                      height: 120.h,
                    ),
                    Text(
                      Constants.membershipRegistrationForm,
                      style: FTextStyle.HeadingTxtStyle.copyWith(
                        fontSize: 30,
                        // fontWeight: FontWeight.w900
                      ),
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                    SizedBox(height: 20.h), // Spacing between radio buttons

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio<int>(
                              value: 1,
                              groupValue: _selectedValue,
                              onChanged: (int? value) {
                                setState(() {
                                  _selectedValue = value!;
                                  itemList.clear();
                                  addressDetails.clear();
                                  contactNumberList.clear();


                                });
                              },
                            ),
                            Text(
                              "New Member",
                              style: FTextStyle.formLabelTxtStyle,
                            ),
                          ],
                        ),
                        SizedBox(width: 20), // Spacing between radio buttons
                        Row(
                          children: [
                            Radio<int>(
                              value: 2,
                              groupValue: _selectedValue,
                              onChanged: (int? value) {
                                setState(() {
                                  _selectedValue = value!;
                                  itemList.clear();
                                  addressDetails.clear();
                                  contactNumberList.clear();
                                });
                              },
                            ),
                            Text(
                              "Existing Member",
                              style: FTextStyle.formLabelTxtStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Visibility(
                      visible: _selectedValue == 2, // Show only if "Existing Member" is selected
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fill up existing Membership Number",
                            style: FTextStyle.formLabelTxtStyle,
                          ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!,
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            focusNode: _memberShipFocusNode,
                            key: _memberKey,
                            keyboardType: TextInputType.text,
                            decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                              hintText: "Enter Membership Number",
                            ),
                            controller: _memberNumberController,
                            validator: ValidatorUtils.memberShipValidator,
                            onTap: () {
                              _memberNumberErrorMessage=true;

                            },
                          ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "* Don't forget to mention your old membership number if applicable.",
                            style: FTextStyle.smallTextBlack.copyWith(
                              color: Colors.red,
                              fontSize: 13,
                            ),
                          ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!,
                          ),
                        ],
                      ),
                    ),




                    //company name
                    SizedBox(height: 20.h), // Spacing between radio buttons
                    Text(
                      Constants.companyNameLabel,
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 5),
                    TextFormField(
                      focusNode: _companyFocusNode,
                      key: _companyKey,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: Constants.nameCompanyHint,
                      ),
                      controller: _companyNameController,
                      validator: ValidatorUtils.companyNameValidator,
                      onTap: () {
                        isCompanyFieldFocused=true;
                      },
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),

                    //nature of business
                    SizedBox(height: 20.h), // Spacing between radio buttons
                    Text(
                      Constants.natureOfBusinessLabel,
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 5),
                    TextFormField(
                      focusNode: _natureFocusNode,
                      key: _natureKey,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: Constants.natureOfBusinessHint,
                      ),
                      controller: _natureOfCompanyNameController,
                      validator: ValidatorUtils.natureOfBusinessValidator,
                      onTap: () {
                        isNatureFieldFocused = true;
                      },
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),

                    //register contact no
                    SizedBox(height: 20.h), // Spacing between radio buttons
                    Text(
                      Constants.registerContactNoLabel,
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 5),
                    TextFormField(
                      focusNode: _contactNumberFocusNode,
                      key: _contactKey,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: Constants.registerContactNoHint,
                      ),
                      controller: _registerContactNoController,
                      validator: ValidatorUtils.contactNumberValidator,
                      onTap: () {

                      },
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),


                    //product category
                    SizedBox(height: 20.h), // Spacing between radio buttons
                    Text(
                      Constants.productCategoryLabel,
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 5),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: Constants.productCategoryHint,
                        suffixIcon: IconButton(
                          splashRadius: 0.1,
                          splashColor: Colors.transparent,
                          icon: Image.asset('assets/images/genderdropdown.png',height: 13,width: 13,),
                          onPressed: () {  _openCategoryBottomSheet(_productCategoryNoController); },
                        ),
                      ),
                      controller: _productCategoryNoController,
                      validator: ValidatorUtils.productCategoryValidator,
                      onTap: () {  _openCategoryBottomSheet(_productCategoryNoController); },
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),


                    //contact details
                    SizedBox(height: 20.h), // Spacing between radio buttons
                    Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: AppColors.selectGenderBg,

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Contact Details',
                              style: FTextStyle.formLabelTxtStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                _showContactDialog(context);
                                print('Add button pressed');
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  backgroundColor:  AppColors.drawerButton1Color

                              ),
                              child: Text('Add', style: FTextStyle.loginBtnStyle),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    if (_contactErrorMessage && itemList.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Please add atLeast one contact details',
                          style: TextStyle(
                            color: Color(0xFFA5332A),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    itemList.isNotEmpty
                        ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ListView.builder(
                        itemCount: itemList.length,
                        itemBuilder: (context, index) {
                          print(">>>ALLDATAITEMLOCAL$itemList");
                          final item = itemList[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              color: Colors.yellow[50],
                              border: Border.all(color: AppColors.yellow),
                            ),
                            padding: const EdgeInsets.all(7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Name: ",
                                          style: FTextStyle.listTitleSub,
                                          children: [
                                            TextSpan(
                                              text: item["Name"] ?? "--",
                                              style: FTextStyle.listTitle,
                                            ),
                                            const TextSpan(
                                              text: "\nGender ",
                                              style: FTextStyle.listTitleSub,
                                            ),
                                            TextSpan(
                                              text: item["gender"] ?? "--",
                                              style: FTextStyle.listTitle,
                                            ),
                                            const TextSpan(
                                              text: "\nNumber: ",
                                              style: FTextStyle.listTitleSub,
                                            ),
                                            TextSpan(
                                              text: item["number"] ?? "--",
                                              style: FTextStyle.listTitle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit, color: AppColors.primaryColourDark),
                                      onPressed: () {
                                        setState(() {
                                          _showContactDialog(context, item: item, index: index);
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 5),
                                    IconButton(
                                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          itemList.removeAt(index);
                                          if (itemList.isEmpty) {
                                            _contactErrorMessage = true;
                                          }// Removes the item from the list
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ):
                    //address details
                    SizedBox(height: 20.h), // Spacing between radio buttons
                    Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: AppColors.selectGenderBg,

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Address Details',
                              style: FTextStyle.formLabelTxtStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Add button logic here
                                _showAddressDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  backgroundColor:  AppColors.drawerButton1Color

                              ),
                              child: Text('Add', style: FTextStyle.loginBtnStyle),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    addressDetails.isNotEmpty
                        ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: ListView.builder(
                        itemCount: addressDetails.length,

                        itemBuilder: (context, index) {
                          print(">>>ALLDATAITEMLOCAL$addressDetails");
                          final item = addressDetails[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              border: Border.all(color: AppColors.primeRed),
                            ),
                            padding: const EdgeInsets.all(7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Address Type (ex.Branch/Head Office): ",
                                          style: FTextStyle.listTitleSub,
                                          children: [
                                            TextSpan(
                                              text: item["addTypeHead"] ?? "--",
                                              style: FTextStyle.listTitle,
                                            ),
                                            const TextSpan(
                                              text: "\nAddress ",
                                              style: FTextStyle.listTitleSub,
                                            ),
                                            TextSpan(
                                              text: item["address"] ?? "--",
                                              style: FTextStyle.listTitle,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit, color: AppColors.primaryColourDark),
                                      onPressed: () {
                                        setState(() {
                                          _showAddressDialog(context, item: item, index: index);
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 5),
                                    IconButton(
                                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          addressDetails.removeAt(index);
                                          if (addressDetails.isEmpty) {
                                            _addressErrorMessage = true;
                                          }// Rem// Removes the item from the list
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                              ],
                            ),
                          );
                        },
                      ),
                    ):
                    SizedBox(height: 10.h),
                    if (_addressErrorMessage  && addressDetails.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Please add address one contact details',
                          style: TextStyle(
                            color: Color(0xFFA5332A),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),

                    //company email
                    SizedBox(height: 20.h), // Spacing between radio buttons
                    Text(
                      Constants.companyEmailLabel,
                      style: FTextStyle.formLabelTxtStyle,
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 5),
                    TextFormField(
                      focusNode: _emailFocusNode,
                      key: _emailKey,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                      FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: Constants.companyEmailHint,
                      ),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: _emailController,
                      validator: ValidatorUtils.emailValidator,
                      onTap: () {
                        setState(() {
                          isEmailFieldFocused = true;

                        });
                      },
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),


                    //address details
                    SizedBox(height: 20.h), // Spacing between radio buttons
                    Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: AppColors.selectGenderBg,

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Other Contact (Optional)',
                              style: FTextStyle.formLabelTxtStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Add button logic here
                                _showContactNumberDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  backgroundColor:  AppColors.drawerButton1Color

                              ),
                              child: Text('Add', style: FTextStyle.loginBtnStyle),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    contactNumberList.isNotEmpty
                        ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: ListView.builder(
                        itemCount: contactNumberList.length,

                        itemBuilder: (context, index) {
                          print(">>>ALLDATAITEMLOCAL$contactNumberList");
                          final item = contactNumberList[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              border: Border.all(color: AppColors.primeRed),
                            ),
                            padding: const EdgeInsets.all(7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Contact Number : ",
                                          style: FTextStyle.listTitleSub,
                                          children: [
                                            TextSpan(
                                              text: item["contactNumber"] ?? "--",
                                              style: FTextStyle.listTitle,
                                            ),


                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit, color: AppColors.primaryColourDark),
                                      onPressed: () {
                                        setState(() {
                                          _showContactNumberDialog(context, item: item, index: index);
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 5),
                                    IconButton(
                                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          contactNumberList.removeAt(index);
                                          if (contactNumberList.isEmpty) {
                                            _contactNumberErrorMessage = true;
                                          }// Rem// Removes the item from the list
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                              ],
                            ),
                          );
                        },
                      ),
                    ):
                    SizedBox(height: 10.h),
                    if (_contactNumberErrorMessage  && contactNumberList.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Please add  one contact number',
                          style: TextStyle(
                            color: Color(0xFFA5332A),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),


                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h), // Spacing between radio buttons

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (itemList.isEmpty) {
                      setState(() {
                        _contactErrorMessage = true;
                      });

                    }
                    else {
                      setState(() {
                        _contactErrorMessage = false;
                      });


                    }

                    if (addressDetails.isEmpty) {
                      setState(() {
                        _addressErrorMessage = true;
                      });

                    }
                    else {
                      setState(() {
                        _addressErrorMessage = false;
                      });


                    } if (contactNumberList.isEmpty) {
                      setState(() {
                        _contactNumberErrorMessage = true;
                      });

                    }
                    else {
                      setState(() {
                        _contactNumberErrorMessage = false;
                      });


                    }



                    // Removes the item from the list
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid, proceed with submission

                      if  ( _selectedValue == 2){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const HomePage (),
                          ),
                        );
                      }
                      else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const MembershipPayment(),
                          ),
                        );

                      }
                      // Determine whether to update or create a vendor

                    } else {
                      // If any field is invalid, trigger validation error display
                      _formKey.currentState!.validate();
                    }
                  },

                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      backgroundColor:  AppColors.drawerButton1Color

                  ),
                  child: Text(
                      "Submit", style: FTextStyle.loginBtnStyle),
                ),
              ),
            )
          ],
        )
      ),
    );
  }

// Function to open the bottom sheet to select gender
  void _openCategoryBottomSheet(TextEditingController productCategoryNoController) {
    FocusManager.instance.primaryFocus?.unfocus(); // Force close keyboard before opening bottom sheet

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows bottom sheet to resize properly with keyboard
      builder: (BuildContext context) {
        List<bool> _selectedCategories = List<bool>.filled(_productCategories.length, false);
        final TextEditingController otherController = TextEditingController();
        final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
        bool _showValidationMessage = false;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus(); // Hide keyboard when tapping outside
              },
              behavior: HitTestBehavior.opaque, // Ensures the tap is detected anywhere
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: double.infinity,
                          color: AppColors.selectGenderBg,
                          child: Center(
                            child: Text(
                              'Choose category',
                              style: FTextStyle.formLabelTxtStyle,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _productCategories.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: _selectedCategories[index],
                                          onChanged: (bool? value) {
                                            setState(() {
                                              if (_productCategories[index] == "Others") {
                                                _selectedCategories = List<bool>.filled(_productCategories.length, false);
                                                _selectedCategories[index] = value ?? false;
                                              } else {
                                                _selectedCategories[_productCategories.indexOf("Others")] = false;
                                                _selectedCategories[index] = value ?? false;
                                              }
                                              _showValidationMessage = false; // Hide validation message on selection
                                            });
                                          },
                                        ),
                                        Text(
                                          _productCategories[index],
                                          style: FTextStyle.formLabelTxtStyle.copyWith(
                                            color: AppColors.headingTxtColour,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_productCategories[index] == "Others" && _selectedCategories[index])
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: TextFormField(
                                        controller: otherController,
                                        decoration: InputDecoration(
                                          hintText: 'Please specify...',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (index != _productCategories.length - 1) Divider(),
                                ],
                              );
                            },
                          ),
                        ),
                        if (_showValidationMessage)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Please select at least one category!',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus(); // Dismiss keyboard on confirm
                                // Validate selection
                                if (!_selectedCategories.contains(true)) {
                                  setState(() {
                                    _showValidationMessage = true;
                                  });




                                  return;
                                }

                                List<String> selected = [];
                                for (int i = 0; i < _productCategories.length; i++) {
                                  if (_selectedCategories[i]) {
                                    selected.add(_productCategories[i]);
                                  }
                                }
                                productCategoryNoController.text = selected.join(', ');
                                Navigator.pop(context); // Close the bottom sheet
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                backgroundColor: AppColors.drawerButton1Color,
                              ),
                              child: Text("Confirm", style: FTextStyle.loginBtnStyle),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }



  void _showContactDialog(BuildContext context, {Map<String, dynamic>? item, int? index}) {
    final _formKey = GlobalKey<FormState>();
    String? _selectedGender = item?["gender"];
    final _companyNameController = TextEditingController(text: item?["Name"]);
    final _registerContactNoController = TextEditingController(text: item?["number"]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final double dialogWidth = MediaQuery.of(context).size.width * 0.9; // 80% of screen width
        final double dialogHeight = MediaQuery.of(context).size.height * 0.38;
        return AlertDialog(
          title: Text(item == null ? 'Add Contact Details' : 'Edit Contact Details', style: FTextStyle.preHeading16BoldStyle),
          content: Form(
            key: _formKey,
            child: Container(
              width: dialogWidth,
              height: dialogHeight,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Person Name", style: FTextStyle.formLabelTxtStyle),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _companyNameController,
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: "Enter Contact Person Name",
                      ),
                      validator: ValidatorUtils.nameValidator,
                    ),

                    SizedBox(height: 20),
                    Text("Gender", style: FTextStyle.formLabelTxtStyle),
                    const SizedBox(height: 5),
                    DropdownButtonFormField<String>(
                      value: _selectedGender,
                      items: [
                        DropdownMenuItem(value: 'Male', child: Text('Male')),
                        DropdownMenuItem(value: 'Female', child: Text('Female')),
                        DropdownMenuItem(value: 'Other', child: Text('Other')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: "Select Gender",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a gender';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),
                    Text("Contact Person No.", style: FTextStyle.formLabelTxtStyle),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _registerContactNoController,
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: "Enter Contact Person Number",
                      ),
                      validator: ValidatorUtils.contactNumberValidator,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cancel the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() {
                    if (item == null) {
                      // Add new contact
                      itemList.add({
                        "Name": _companyNameController.text,
                        "gender": _selectedGender,
                        "number": _registerContactNoController.text,
                      });
                    } else {
                      // Update existing contact
                      itemList[index!] = {
                        "Name": _companyNameController.text,
                        "gender": _selectedGender,
                        "number": _registerContactNoController.text,
                      };
                    }
                  });

                  Navigator.of(context).pop(); // Close the dialog
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showAddressDialog(BuildContext context, {Map<String, dynamic>? item, int? index}) {
    final _formKey = GlobalKey<FormState>();
    final _companyNameController = TextEditingController(text: item?["Name"]);
    final _registerContactNoController = TextEditingController(text: item?["number"]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final double dialogWidth = MediaQuery.of(context).size.width * 0.9; // 90% of screen width
        final double dialogHeight = MediaQuery.of(context).size.height * 0.28;
        return AlertDialog(
          title: Text(
            item == null ? 'Add Address Details' : 'Edit Address Details',
            style: FTextStyle.preHeading16BoldStyle,
          ),
          content: Form(
            key: _formKey,
            child: Container(
              color: AppColors.gray_2,
              width: dialogWidth,
              height: dialogHeight,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Address Type Input
                    Text("Address Type (ex. Branch/Head Office)", style: FTextStyle.formLabelTxtStyle),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _companyNameController,
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: "Enter Address Type (ex. Branch/Head Office)",
                      ),
                      validator: ValidatorUtils.addressValidator,
                    ),

                    SizedBox(height: 20),
                    // Address Input
                    Text("Address", style: FTextStyle.formLabelTxtStyle),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _registerContactNoController,
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: "Enter Address",
                      ),
                      validator: ValidatorUtils.addressValidator,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cancel the dialog
              },
              child: Text('Cancel'),
            ),
            // Save Button
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() {
                    if (item == null) {
                      // Add new address to the list
                      addressDetails.add({
                        "addTypeHead": _companyNameController.text,
                        "address": _registerContactNoController.text,
                      });
                    } else {
                      // Update the existing address
                      addressDetails[index!] = {
                        "addTypeHead": _companyNameController.text,
                        "address": _registerContactNoController.text,
                      };
                    }
                  });
                  Navigator.of(context).pop(); // Close the dialog after saving
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showContactNumberDialog(BuildContext context, {Map<String, dynamic>? item, int? index}) {
    final _formKey = GlobalKey<FormState>();
    final _registerContactNoController = TextEditingController(text: item?["contactNumber"]);

    showDialog(

      context: context,
      builder: (BuildContext context) {
        final double dialogWidth = MediaQuery.of(context).size.width * 0.9;
        final double dialogHeight = MediaQuery.of(context).size.height * 0.11;

        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            item == null ? 'Add Contact Number' : 'Edit Contact Number',
            style: FTextStyle.preHeading16BoldStyle,
          ),
          content: Form(
            key: _formKey,
            child: Container(
              color: Colors.white,
              width: dialogWidth,
              height: dialogHeight,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Number", style: FTextStyle.formLabelTxtStyle),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _registerContactNoController,
                      decoration: FormFieldStyle.defaultemailDecoration.copyWith(
                        hintText: "Enter Contact Number",
                      ),
                      validator: ValidatorUtils.addressValidator,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() {
                    if (item == null) {
                      // Adding a new contact number
                      contactNumberList.add({"contactNumber": _registerContactNoController.text});
                    } else {
                      // Updating an existing contact number
                      contactNumberList[index!] = {"contactNumber": _registerContactNoController.text};
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }



}

