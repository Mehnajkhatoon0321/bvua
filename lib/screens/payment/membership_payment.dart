import 'package:bvua/screens/payment/membership_partner_form.dart';
import 'package:bvua/utilities/colours.dart';
import 'package:bvua/utilities/font_text_Style.dart';
import 'package:flutter/material.dart';
class MembershipPayment extends StatefulWidget {
  const MembershipPayment({super.key});

  @override
  State<MembershipPayment> createState() => _MembershipPaymentState();
}

class _MembershipPaymentState extends State<MembershipPayment> {
  String selectedMembershipType = 'Annual'; // Default selection
  int selectedAmount = 1000; // Default amount for annual membership

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
          'BVUA Membership',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text("Banarasi Vastra Udyog Association", style: FTextStyle.preHeading16BoldStyle),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedMembershipType = 'Annual';
                  selectedAmount = 1000;
                });
              },
              child: MembershipOptionCard(
                title: "10% off on Textile",
                subtitle: "For Annual Membership",
                isSelected: selectedMembershipType == 'Annual',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedMembershipType = 'Lifetime';
                  selectedAmount = 4000;
                });
              },
              child: MembershipOptionCard(
                title: "30% off on Textile",
                subtitle: "For lifetime Membership",
                isSelected: selectedMembershipType == 'Lifetime',
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: AppColors.drawerButton1Color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.16,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedMembershipType == 'Annual' ? "Annual Membership" : "Lifetime Membership",
                          style: FTextStyle.nameProfile.copyWith(fontSize: 23),
                        ),
                        Text(
                          "₹$selectedAmount",
                          style: FTextStyle.nameProfile.copyWith(fontSize: 23, color: Colors.amber),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MembershipPartnerForm(
                              membershipType: selectedMembershipType,
                              amount: selectedAmount.toString(),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Proceed',
                        style: FTextStyle.loginBtnStyle.copyWith(color: AppColors.drawerButton1Color),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MembershipOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;

  const MembershipOptionCard({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.drawerButton1Color : Colors.grey[400],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height * 0.13,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? Colors.white70 : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}