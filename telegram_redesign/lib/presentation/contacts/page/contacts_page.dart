import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/mock/mock_data.dart';
import 'package:telegram_redesign/presentation/contacts/widgets/contacts_item.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(decoration: InputDecoration(hintText: "Search")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border(
            top: BorderSide(color: AppColors.borderColor),
            bottom: BorderSide(color: AppColors.borderColor),
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: context.screenHeight * 0.1,
              backgroundColor: AppColors.backgroundColor,
              title: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          padding: AppLayout.paddingSmall.allPadding,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.group_outlined,
                            color: Colors.white,
                          ),
                        ),
                        (AppLayout.paddingSmall).heightBox,
                        Text("New Group", style: context.textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          padding: AppLayout.paddingSmall.allPadding,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.white,
                          ),
                        ),
                        (AppLayout.paddingSmall).heightBox,
                        Text("New Secret", style: context.textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          padding: AppLayout.paddingSmall.allPadding,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.wifi_channel, color: Colors.white),
                        ),
                        (AppLayout.paddingSmall).heightBox,
                        Text("New Channle", style: context.textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList.builder(
              itemCount: MockData.users.length,
              itemBuilder: (context, index) {
                return ContactsItem(user: MockData.users[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
