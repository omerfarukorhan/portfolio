import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/appClass.dart';

import '../../controller/generalController.dart';
import '../../model/experienceModel.dart';
import '../../resource/colors.dart';
import '../../resource/strings.dart';

class ExperienceTab extends StatefulWidget {
  const ExperienceTab({Key? key}) : super(key: key);

  @override
  State<ExperienceTab> createState() => _ExperienceTabState();
}

class _ExperienceTabState extends State<ExperienceTab> {
  @override
  Widget build(BuildContext context) {
    List<ExperienceModel> experienceList = [
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

    return Container(
      height: AppClass().getMqHeight(context) - 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: "02.",
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 20,
                        fontFamily: 'sfmono'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ''' Where I've Worked''',
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
              ),
              Container(
                height: 0.5,
                margin: EdgeInsets.only(left: 15),
                width: AppClass().getMqWidth(context) * 0.2,
                color: AppColors().textLight,
              )
            ],
          ),
          Consumer(builder: (context, ref, child) {
            var data = ref.watch(selectedExpProvider);
            return Container(
              width: AppClass().getMqWidth(context) * 0.8,
              margin: EdgeInsets.only(top: 30.0, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            ref.read(selectedExpProvider.notifier).state = 0;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: data == 0
                                    ? AppColors().cardColor
                                    : Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: data == 0
                                            ? AppColors().neonColor
                                            : Colors.white,
                                        width: 2))),
                            child: Text(
                              'Destek Bilisim',
                              style: TextStyle(
                                  color: data == 0
                                      ? AppColors().neonColor
                                      : AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 12,
                                  fontFamily: 'sfmono'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: experienceList[data].desig,
                              style: GoogleFonts.roboto(
                                  color: AppColors().textColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\n@${experienceList[data].compName}',
                                  style: GoogleFonts.roboto(
                                      color: AppColors().neonColor,
                                      fontSize: 18),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          experienceList[data].duration.toString(),
                          style: TextStyle(
                              color: AppColors().textLight,
                              letterSpacing: 1,
                              height: 1.5,
                              fontSize: 13,
                              fontFamily: 'sfmono'),
                        ),
                        experienceList[data].points!
                      ],
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
