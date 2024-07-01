import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:fitness_app/view/ui/profile/Profile_components/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Profile_components/account_card.dart';
import 'Profile_components/other_card.dart';
import 'Profile_components/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
        automaticallyImplyLeading: false,
        title: const TextView(
          BaseStrings.profile,
          textStyle: BaseTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              20.toVSB,
              const ProfileHeader(),
              20.toVSB,
              const AccountCard(),
              20.toVSB,
              const NotificationCard(),
              20.toVSB,
              const OtherCard(),
              20.toVSB,
            ],
          ),
        ),
      ),
    );
  }
}
