import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/appClass.dart';

import '../../model/experienceModel.dart';
import '../../resource/colors.dart';

class ExperienceWeb extends StatefulWidget {
  final List<ExperienceModel> experienceList;
  const ExperienceWeb(this.experienceList, {super.key});

  @override
  State<ExperienceWeb> createState() => _ExperienceWebState();
}

class _ExperienceWebState extends State<ExperienceWeb> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: AppClass().getMqHeight(context) - 70,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 72),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: AppClass().getMqWidth(context) * 0.6,
              child: Row(
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
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 0.5,
                      color: AppColors().textLight,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.experienceList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                ExperienceModel exp = widget.experienceList[index];
                return Container(
                  width: AppClass().getMqWidth(context) * 0.6,
                  margin: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: AppColors().cardColor,
                                    border: Border(
                                        left: BorderSide(
                                            color: AppColors().neonColor,
                                            width: 2))),
                                child: Text(
                                  exp.compName ?? "",
                                  style: TextStyle(
                                      color: AppColors().neonColor,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontSize: 14,
                                      fontFamily: 'sfmono'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: exp.desig,
                                  style: GoogleFonts.roboto(
                                      color: AppColors().textColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' @${exp.compName}',
                                      style: GoogleFonts.roboto(
                                          color: AppColors().neonColor,
                                          fontSize: 20),
                                    )
                                  ]),
                            ),
                            Text(
                              exp.duration.toString(),
                              style: TextStyle(
                                  color: AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 14,
                                  fontFamily: 'sfmono'),
                            ),
                            exp.points!
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
