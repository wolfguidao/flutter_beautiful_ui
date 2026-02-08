import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/entity/session.dart';
import 'package:telegram_redesign/mock/mock_data.dart';
import 'package:telegram_redesign/presentation/chats/sections/session_bar.dart';
import 'package:telegram_redesign/presentation/chats/sections/session_edit_sheet.dart';
import 'package:telegram_redesign/presentation/chats/sections/session_selected_bar.dart';
import 'package:telegram_redesign/presentation/chats/widgets/session_item.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final List<String> _selectedSessionIds = [];
  bool _showSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title: _showSelected
            ? SessionSelectedBar(
                selectedSessionIds: _selectedSessionIds,
                onClose: () {
                  setState(() {
                    _showSelected = false;
                    _selectedSessionIds.clear();
                  });
                },
              )
            : SessionBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SessionEditSheet();
            },
          );
        },
        child: Icon(Icons.edit),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border(
            top: BorderSide(color: AppColors.borderColor),
            bottom: BorderSide(color: AppColors.borderColor),
          ),
        ),
        child: ListView.builder(
          itemCount: MockData.sessions.length,
          itemBuilder: (context, index) {
            final Session session = MockData.sessions[index];
            return Row(
              children: [
                if (_showSelected)
                  Checkbox(
                    value: _selectedSessionIds.contains(session.id),
                    onChanged: (value) {
                      setState(() {
                        value!
                            ? _selectedSessionIds.add(session.id)
                            : _selectedSessionIds.remove(session.id);
                      });
                    },
                  ),
                Expanded(
                  child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _showSelected = true;
                        _selectedSessionIds.add(session.id);
                      });
                    },
                    child: SessionItem(session: session),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
