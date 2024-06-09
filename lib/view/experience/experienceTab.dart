import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/appClass.dart';

import '../../controller/generalController.dart';
import '../../model/experienceModel.dart';
import '../../resource/colors.dart';
import '../../resource/strings.dart';

class ExperienceTab extends StatefulWidget {
  List<ExperienceModel> experienceList;
  ExperienceTab(this.experienceList, {Key? key}) : super(key: key);

  @override
  State<ExperienceTab> createState() => _ExperienceTabState();
}

class _ExperienceTabState extends State<ExperienceTab> {
  @override
  Widget build(BuildContext context) {
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.experienceList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              ExperienceModel exp = widget.experienceList[index];
              return Container(
                width: AppClass().getMqWidth(context) * 0.8,
                margin: EdgeInsets.only(top: 30.0, left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Expanded(
                    //   flex: 2,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       InkWell(
                    //         onTap: () {},
                    //         child: Container(
                    //           padding: EdgeInsets.all(10.0),
                    //           decoration: BoxDecoration(
                    //               color: AppColors().cardColor,
                    //               border: Border(
                    //                   left: BorderSide(
                    //                       color: AppColors().neonColor,
                    //                       width: 2))),
                    //           child: Text(
                    //             exp.compName ?? "",
                    //             style: TextStyle(
                    //                 color: AppColors().neonColor,
                    //                 letterSpacing: 1,
                    //                 height: 1.5,
                    //                 fontSize: 12,
                    //                 fontFamily: 'sfmono'),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
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
                                    fontSize: 18),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '\n@${exp.compName}',
                                    style: GoogleFonts.roboto(
                                        color: AppColors().neonColor,
                                        fontSize: 18),
                                  )
                                ]),
                          ),
                          Text(
                            exp.duration.toString(),
                            style: TextStyle(
                                color: AppColors().textLight,
                                letterSpacing: 1,
                                height: 1.5,
                                fontSize: 13,
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
    );
  }
}
