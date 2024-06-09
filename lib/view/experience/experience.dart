import 'package:flutter/material.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:portfolio/resource/strings.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/view/experience/experienceMobile.dart';
import 'package:portfolio/view/experience/experienceTab.dart';

import '../../model/experienceModel.dart';
import 'experienceWeb.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    List<ExperienceModel> experienceList = [
      ExperienceModel(
        desig: Strings.expDesig2,
        compName: Strings.expCompName2,
        duration: Strings.expDur2,
        points: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.arrow_right,
                      color: AppColors().neonColor,
                      size: 20,
                    ),
                  ),
                  Container(
                    width: AppClass().getMqWidth(context) * 0.5,
                    child: Text(
                      Strings.expAbout2,
                      style: TextStyle(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 13,
                          fontFamily: 'sfmono'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ExperienceModel(
        desig: Strings.expDesig1,
        compName: Strings.expCompName1,
        duration: Strings.expDur1,
        points: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.arrow_right,
                      color: AppColors().neonColor,
                      size: 20,
                    ),
                  ),
                  Container(
                    width: AppClass().getMqWidth(context) * 0.5,
                    child: Text(
                      Strings.expAbout1,
                      style: TextStyle(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 13,
                          fontFamily: 'sfmono'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    return Responsive(
      webView: ExperienceWeb(experienceList),
      mobileView: ExperienceMobile(experienceList),
      tabView: ExperienceTab(experienceList),
    );
  }
}
