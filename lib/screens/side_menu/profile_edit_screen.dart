import 'dart:convert';
import 'dart:io';

import 'package:bvua/screens/side_menu/profile_screen.dart';
import 'package:bvua/utilities/colours.dart';
import 'package:bvua/utilities/common_function.dart';
import 'package:bvua/utilities/flutter_flow_animations.dart';
import 'package:bvua/utilities/font_text_Style.dart';
import 'package:bvua/utilities/form_field_style.dart';
import 'package:bvua/utilities/no_space_input_formatter.dart';
import 'package:bvua/utilities/validator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final formKey = GlobalKey<FormState>();
// Controllers
  late final TextEditingController nameController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController mobileController = TextEditingController();
  late final TextEditingController dobController = TextEditingController();
  late final TextEditingController addressController = TextEditingController();
  late final TextEditingController genderController = TextEditingController();

// Keys for FormFieldStates
  late final GlobalKey<FormFieldState<String>> _nameKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _emailKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _mobileKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _dobKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _addressKey = GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _genderKey = GlobalKey<FormFieldState<String>>();

// Focus Nodes
  late final FocusNode _nameNode = FocusNode();
  late final FocusNode _emailNode = FocusNode();
  late final FocusNode _mobileNode = FocusNode();
  late final FocusNode _dobNode = FocusNode();
  late final FocusNode _addressNode = FocusNode();
  late final FocusNode _genderNode = FocusNode();

// Focus state variables
  bool isNameFieldFocused = false;
  bool isEmailFieldFocused = false;
  bool isMobileFieldFocused = false;
  bool isDobFieldFocused = false;
  bool isAddressFieldFocused = false;
  bool isGenderFieldFocused = false;

// Button enable state
  bool isButtonEnabled = false;

// Product categories and selection
  String? selectedGender; // Use a list for gender selection like ["Male", "Female", "Other"]
  List<String> genderList = ["Male", "Female", "Other"]; // Add gender options to the list

// Profile update flag
  var profileUpdate = false;

// Reset function to clear focus states
  void resetFocusFields() {
    isNameFieldFocused = false;
    isEmailFieldFocused = false;
    isMobileFieldFocused = false;
    isDobFieldFocused = false;
    isAddressFieldFocused = false;
    isGenderFieldFocused = false;
  }



  String cameraSelectedImage = '';
  String gallerySelectedImage = '';
  String selectionImageType = '';
  final ImagePicker _imagePicker = ImagePicker();
  String? userImage = '';
  var isRemarkEnabled = true;
  var selfiImgBase64 = '';
  var selfiImg = '';
  List<int> profileImage = [];
  List<int> Images = [];

  List<String> productCategories = ["Male", "Female", "Other"];

  bool isLoading = false;

  String productCategoryText = "";

  File? _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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

  void _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null && selectedDate != currentDate) {
      // Format the date to dd-MM-yyyy
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

      setState(() {
        dobController.text = formattedDate;  // Update dobController instead of remark
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    var height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.drawerButton1Color,
          // Customize app bar color
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
            'Edit Profile',
            style: FTextStyle.HeadingTxtWhiteStyle,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 15, left: 20, right: 20),
                child: Form(
                  key: formKey,
                  onChanged: () {
                    bool isFormValid = selectedGender != null &&
                        selectedGender!.isNotEmpty &&
                        ValidatorUtils.isValidCommon(nameController.text) && // Validate name
                        ValidatorUtils.isValidEmail(emailController.text) && // Validate email
                        ValidatorUtils.isValidPhone(mobileController.text) && // Validate mobile number
                        ValidatorUtils.isValidCommon(addressController.text) && // Validate address
                        ValidatorUtils.isValidDate(dobController.text); // Validate date of birth

                    setState(() {
                      isButtonEnabled = isFormValid;
                    });

                    // Trigger validation for focused fields
                    if (isNameFieldFocused) {
                      _nameKey.currentState?.validate();
                    }

                    if (isEmailFieldFocused) {
                      _emailKey.currentState?.validate();
                    }

                    if (isMobileFieldFocused) {
                      _mobileKey.currentState?.validate();
                    }

                    if (isDobFieldFocused) {
                      _dobKey.currentState?.validate();
                    }

                    if (isAddressFieldFocused) {
                      _addressKey.currentState?.validate();
                    }

                    if (isGenderFieldFocused) {
                      _genderKey.currentState?.validate();
                    }
                  },


                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 20.0),
                            child: (profileImage.isNotEmpty && !profileUpdate)
                                ? Stack(
                                    children: [
                                      ClipOval(
                                        child: SizedBox(
                                          height: (displayType == 'desktop' ||
                                                  displayType == 'tablet')
                                              ? 70.w
                                              : 110,
                                          width: (displayType == 'desktop' ||
                                                  displayType == 'tablet')
                                              ? 70.w
                                              : 110,
                                          child: profileImage.isNotEmpty
                                              ? Image.memory(
                                                  Uint8List.fromList(
                                                      profileImage),
                                                  fit: BoxFit.cover,
                                                )
                                              : null,
                                        ),
                                      ),
                                      if (profileImage.isNotEmpty)
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                _image = null;
                                                profileUpdate = true;
                                              });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF0E8F0),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(45),
                                                ),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFFE1D2E0),
                                                  // Change to your desired border color
                                                  width:
                                                      1.0, // Change to your desired border width
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColors.primaryColour,
                                                size: (displayType ==
                                                            'desktop' ||
                                                        displayType == 'tablet')
                                                    ? 20.w
                                                    : 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                : Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _showPicker(context);
                                        },
                                        child: ClipOval(
                                          // borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            'assets/images/profile.png',
                                            fit: BoxFit.cover,
                                            height: (displayType == 'desktop' ||
                                                    displayType == 'tablet')
                                                ? 70.w
                                                : 100,
                                            width: (displayType == 'desktop' ||
                                                    displayType == 'tablet')
                                                ? 70.w
                                                : 100,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: InkWell(
                                          onTap: () {
                                            _showPicker(context);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF0E8F0),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(45),
                                              ),
                                              border: Border.all(
                                                color: const Color(0xFFE1D2E0),
                                                // Change to your desired border color
                                                width:
                                                    1.0, // Change to your desired border width
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.edit,
                                              color:
                                                  AppColors.drawerButton1Color,
                                              size: (displayType == 'desktop' ||
                                                      displayType == 'tablet')
                                                  ? 20.w
                                                  : 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                      ),
                      Text(
                        "Name",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _nameKey,
                          focusNode: _nameNode,
                          keyboardType: TextInputType.text,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter name"),
                          controller: nameController,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            setState(() {
                              resetFocusFields();
                              isNameFieldFocused = true;
                            });
                          },
                        ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                      ),
                      Text(
                        "Select Gender",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: DropdownButtonFormField<String>(
                          key: _genderKey,
                          focusNode: _genderNode,
                          value: selectedGender,
                          hint: const Text("Select Gender", style: FTextStyle.formhintTxtStyle),
                          items: genderList.map((gender) {
                            return DropdownMenuItem(value: gender, child: Text(gender));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedGender = newValue;
                              resetFocusFields();
                              isGenderFieldFocused = true;
                            });
                          },
                          decoration: FormFieldStyle.dropDown,
                          validator: ValidatorUtils.model,
                        ),
                      ),
                      Text(
                        "Email",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _emailKey,
                          focusNode: _emailNode,
                          keyboardType: TextInputType.emailAddress,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter email"),
                          inputFormatters: [NoSpaceFormatter()],
                          controller: emailController,
                          validator: ValidatorUtils.emailValidator,
                          onTap: () {
                            setState(() {
                              resetFocusFields();
                              isEmailFieldFocused = true;
                            });
                          },
                        ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                      ),
                      Text(
                        "Mobile Number",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _mobileKey,
                          focusNode: _mobileNode,
                          keyboardType: TextInputType.number,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter mobile number"),
                          inputFormatters: [NoSpaceFormatter()],
                          controller: mobileController,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            setState(() {
                              resetFocusFields();
                              isMobileFieldFocused = true;
                            });
                          },
                        ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                      ),
                      Text(
                        "Date Of Birth",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _dobKey,
                          focusNode: _dobNode,
                          keyboardType: TextInputType.datetime,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                            hintText: "dd-mm-yyyy",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today, color: Colors.grey),
                              onPressed: () => _selectDate(context),
                            ),
                          ),
                          inputFormatters: [NoSpaceFormatter()],
                          controller: dobController,
                          validator: ValidatorUtils.dateValidator,
                          onTap: () {
                            setState(() {
                              resetFocusFields();
                              isDobFieldFocused = true;
                            });
                          },
                        ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                      ),
                      Text(
                        "Address",
                        style: FTextStyle.formLabelTxtStyle,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation2']!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          key: _addressKey,
                          focusNode: _addressNode,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter address"),
                          inputFormatters: [NoSpaceFormatter()],
                          controller: addressController,
                          validator: ValidatorUtils.model,
                          onTap: () {
                            setState(() {
                              resetFocusFields();
                              isAddressFieldFocused = true;
                            });
                          },
                        ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.only(top: 23.0),
                child: SizedBox(
                  height: (displayType == 'desktop' || displayType == 'tablet')
                      ? 70
                      : 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // All fields are valid, proceed with submission

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyProfile(),
                          ),
                        );
                      } else {
                        // If any field is invalid, trigger validation error display
                        formKey.currentState!.validate();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.drawerButton1Color,
                    ),
                    child: Text(
                      "Update",
                      style: FTextStyle.loginBtnStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: () {
                          _imgFromCamera();
                          Navigator.pop(context);
                        },
                      ),
                      const Text('Take a Photo')
                    ],
                  ),
                  const SizedBox(width: 24),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.photo_library),
                        onPressed: () {
                          _imgFromGallery();
                          Navigator.pop(context);
                        },
                      ),
                      const Text('Choose from Gallery')
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _imgFromCamera() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        profileUpdate = false;
        profileImage = [];
        selectionImageType = 'CAMERA';
        _image = File(image.path);
        final bytes = _image?.readAsBytesSync();
        cameraSelectedImage = base64Encode(bytes!);
        profileImage = base64Decode(cameraSelectedImage);
      });
    }
  }

  void _imgFromGallery() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectionImageType = 'GALLERY';
      setState(() {
        profileUpdate = false;
        profileImage = [];
        _image = File(image.path);
        final bytes = _image?.readAsBytesSync();
        gallerySelectedImage = base64Encode(bytes!);
        profileImage = base64Decode(gallerySelectedImage);
      });
    }
  }
}
