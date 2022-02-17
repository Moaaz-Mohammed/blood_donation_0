import 'package:blood_donation/Screens/blood_donation_benefits.dart';
import 'package:blood_donation/Screens/contact_us.dart';
import 'package:blood_donation/Screens/history.dart';
import 'package:blood_donation/Screens/need_donation.dart';
import 'package:blood_donation/Screens/settings/settings.dart';
import 'package:blood_donation/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Styles/CustomColors.dart';
import '../../../services/auth.dart';
import '../../../shared/Functions.dart';
import '../new_home_screen.dart';
import 'drawer_header.dart';
import 'drawer_list_card.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final userData;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: CustomColors.primaryRedColor,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DrawerHead(userData: userData),
            DrawerListCard(
              icon: Icons.home,
              title: LocaleKeys.home.tr(),
              onTap: () {
                Functions.navigatorPush(
                  context: context,
                  screen: NewHomeScreen(),
                );
              },
            ),
            //Patients
            DrawerListCard(
              icon: Icons.sick,
              title: LocaleKeys.need_donation.tr(),
              onTap: () {
                Functions.navigatorPush(
                  context: context,
                  screen: NeedDonation(),
                );
              },
            ),
            //BloodType Info.
            DrawerListCard(
              icon: Icons.history,
              title: LocaleKeys.history.tr(),
              onTap: () {
                Functions.navigatorPush(
                  context: context,
                  screen: DonationsHistory(),
                );
              },
            ),
            //Info before donation
            DrawerListCard(
              icon: Icons.info,
              title: LocaleKeys.important_info.tr(),
              onTap: () {
                Functions.navigatorPush(
                  context: context,
                  screen: DonationBenefitsScreen(),
                );
              },
            ),
            //Mail
            DrawerListCard(
              icon: Icons.message,
              title: LocaleKeys.contact_us.tr(),
              onTap: () {
                Functions.navigatorPush(
                  context: context,
                  screen: Mail(),
                );
              },
            ),
            //Settings
            DrawerListCard(
              icon: Icons.settings,
              title: LocaleKeys.settings.tr(),
              onTap: () {
                Functions.navigatorPush(
                  context: context,
                  screen: SettingsScreen(
                    userData: userData,
                  ),
                );
              },
            ),

            //Exit App
            DrawerListCard(
                icon: Icons.logout,
                title: LocaleKeys.logout.tr(),
                onTap: () {
                  Auth auth = Auth();
                  auth.signOut(context: context);
                }),
          ],
        ),
      ),
    );
  }
}
