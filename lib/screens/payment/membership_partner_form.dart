import 'package:bvua/screens/all_bloc/auth_flow_bloc.dart';
import 'package:bvua/screens/auth_section/login_screen.dart';
import 'package:bvua/utilities/colours.dart';
import 'package:bvua/utilities/font_text_Style.dart';
import 'package:bvua/utilities/form_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MembershipPartnerForm extends StatefulWidget {
  final String membershipType;
  final String amount;

  const MembershipPartnerForm({
    required this.membershipType,
    required this.amount,

    Key? key,
  }) : super(key: key);

  @override
  State<MembershipPartnerForm> createState() => _MembershipPartnerFormState();
}

class _MembershipPartnerFormState extends State<MembershipPartnerForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _cardNumberController = TextEditingController();


  String _paymentMethod = 'Credit Card'; // Default payment method
  bool _isCreditCardSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        backgroundColor: AppColors.drawerButton1Color,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          'Membership Payment',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Wrap the form with the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bill Details Heading
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Bill Details", style: FTextStyle.preHeading16BoldStyle),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type of Membership",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            widget.membershipType,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(height: 1, color: Colors.grey),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total payable",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "₹${widget.amount}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Visibility(
                  visible: widget.membershipType=="Annual",
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiration Date",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Expiration Date",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "15/10/2025",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Divider(height: 1, color: Colors.grey),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Expire Date",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "15/10/2026",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                const SizedBox(height: 20),
                Text(
                  'Card Number:',
                  style: FTextStyle.formLabelTxtStyle,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _cardNumberController, // Use the correct controller
                  decoration: FormFieldStyle.cardInputDecoration.copyWith(
                    hintText: "Enter Card Number",

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter card number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _processPayment();
                      }
                    },
                    child: Text(
                      'Pay Now',
                      style: FTextStyle.loginBtnStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.drawerButton1Color,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dummy Payment Process Logic
  void _processPayment() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
          ),
          title: Column(
            children: [
              // Success Icon
              Center(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 60.0,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Payment Successful',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Container(
            height: 70.0.h, // Fixed height for consistent design
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Logo

                // Payment Details
                Text(
                  'Your payment of ₹1000 via $_paymentMethod was successful.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                    height: 1.5, // Line height for better readability
                  ),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          ),
          actions: [
            // OK Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
  create: (context) => AuthFlowBloc(),
  child: LogScreen(),
),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),
        ),
        backgroundColor:  AppColors.drawerButton1Color

        ),
                child: Text(
                  'OK',
                  style: FTextStyle.loginBtnStyle
                ),
              ),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

}


