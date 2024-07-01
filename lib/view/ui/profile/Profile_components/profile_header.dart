import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/custom_form_button.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../editprofile/edit_profile_screen.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(30), // Image radius
                  child:
                      Image.asset(BaseAssets.profileImage, fit: BoxFit.cover),
                ),
              ),
              20.toHSB,
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView('Stefani Wong',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: BaseColors.blackColor)),
                  TextView('Lose a Fat Program',
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: BaseColors.primaryGreyColor)),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditProfileScreen(),
                  ));
                },
                child: SizedBox(
                  width: size.width * 0.20,
                  height: 30,
                  child: const Center(
                    child: CustomFormButton(
                      buttonText: BaseStrings.edit,
                      btnTextStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: BaseColors.whiteColor),
                    ),
                  ),
                ),
              )
            ],
          ),
          20.toVSB,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              cardData(
                  context: context,
                  title: BaseStrings.heightProfile,
                  name: '180cm'),
              10.toHSB,
              cardData(
                  context: context,
                  title: BaseStrings.weightProfile,
                  name: '65kg'),
              10.toHSB,
              cardData(context: context, title: BaseStrings.age, name: '22yo'),
            ],
          )
        ],
      ),
    );
  }

  Widget cardData({BuildContext? context, String? title, String? name}) {
    Size size = MediaQuery.of(context!).size;
    return Card(
      elevation: 0,
      child: Container(
        width: size.width * 0.25,
        decoration: BoxDecoration(
            color: BaseColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: BaseColors.lightGreyColor.withOpacity(1.0),
                offset: const Offset(0.2, 0.2),
                blurRadius: 10.0,
              ),
            ],
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextView('$name',
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: BaseColors.brandColorList[0])),
              TextView('$title',
                  textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: BaseColors.primaryGreyColor)),
            ],
          ),
        ),
      ),
    );
  }
}
