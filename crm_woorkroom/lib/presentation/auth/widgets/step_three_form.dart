import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';

class StepThreeForm extends StatefulWidget {
  const StepThreeForm({super.key});

  @override
  State<StepThreeForm> createState() => _StepThreeFormState();
}

class _StepThreeFormState extends State<StepThreeForm> {
  final List<String> _teamScale = [
    "Only me",
    "2 - 5",
    "6 - 10",
    "11 - 20",
    "21 - 40",
    "41 - 50",
    "51 - 100",
    "101 - 500",
  ];

  int _activeTeamScale = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CusLabelTextfile(
          label: "Your Company's Name",
          hintText: "Company's Name",
        ),
        AppLayout.paddingLarge.heightBox,
        CusLabelTextfile(
          label: "Business Direction",
          hintText: "IT and programming",
        ),
        AppLayout.paddingLarge.heightBox,
        Text(
          "How many people in your team?",
          style: TextTheme.of(context).labelMedium,
        ),
        (AppLayout.paddingSmall * 0.5).heightBox,
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2.25 / 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: _teamScale.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _activeTeamScale = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppLayout.borderRadius / 1.5,
                    ),
                    color: _activeTeamScale == index
                        ? AppColor.primaryColor
                        : Colors.transparent,
                    border: Border.all(
                      color: _activeTeamScale == index
                          ? Colors.transparent
                          : AppColor.borderColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _teamScale[index],
                      style: TextStyle(
                        fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        color: _activeTeamScale == index
                            ? Colors.white
                            : AppColor.textColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
