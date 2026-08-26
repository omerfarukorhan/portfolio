import 'package:flutter/material.dart';
import 'package:portfolio/resource/colors.dart';

class RightPane extends StatelessWidget {
  const RightPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          const Spacer(flex: 5),
          Expanded(
            child: Container(
              width: 1,
              color: AppColors().textColor.withValues(alpha: .75),
            ),
          ),
        ],
      ),
    );
  }
}
