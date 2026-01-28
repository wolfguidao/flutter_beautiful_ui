import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/calendar/widgets/request_event.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({super.key});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Dialog(
      backgroundColor: AppColor.secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: IntrinsicHeight(
        child: Container(
          width: width * 0.4,
          padding: AppLayout.paddingLarge.allPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add Event", style: TextTheme.of(context).displayMedium),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColor.backgroundColor,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),
              AppLayout.paddingMedium.heightBox,
              const CusLabelTextfile(
                label: "Event Name",
                hintText: "Katy's Birthday",
              ),
              AppLayout.paddingMedium.heightBox,
              const CusLabelTextfile(
                label: "Event Category",
                hintText: "Corporate Event",
              ),
              AppLayout.paddingMedium.heightBox,
              const CusLabelTextfile(label: "Priority", hintText: "Medium"),
              AppLayout.paddingMedium.heightBox,
              Row(
                children: [
                  Expanded(
                    child: const CusLabelTextfile(
                      label: "Date",
                      hintText: "Dec 20 ,2020",
                    ),
                  ),
                  AppLayout.paddingMedium.widthBox,
                  Expanded(
                    child: const CusLabelTextfile(
                      label: "Time",
                      hintText: "2:00 PM",
                    ),
                  ),
                ],
              ),
              AppLayout.paddingMedium.heightBox,
              const CusLabelTextfile(
                label: "Description",
                hintText: "Add some description of the task",
                minLines: 3,
              ),
              AppLayout.paddingMedium.heightBox,
              RequestEvent(width: width),
              const Spacer(),
              Align(
                alignment: AlignmentGeometry.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Save Event",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).labelMedium?.fontSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
