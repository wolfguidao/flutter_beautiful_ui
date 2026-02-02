import 'package:crm_woorkroom/entity/project_folder.dart';
import 'package:crm_woorkroom/presentation/portal/sections/folder_detail.dart';
import 'package:crm_woorkroom/presentation/portal/sections/info_portal.dart';
import 'package:flutter/material.dart';

class PortalPage extends StatefulWidget {
  const PortalPage({super.key});

  @override
  State<PortalPage> createState() => _PortalPageState();
}

class _PortalPageState extends State<PortalPage> {
  ProjectFolder? _projectFolder;

  @override
  Widget build(BuildContext context) {
    return _projectFolder == null
        ? InfoPortal(
            onTap: (value) {
              setState(() {
                _projectFolder = value;
              });
            },
          )
        : FolderDetail(
            projectFolder: _projectFolder!,
            onBack: () {
              setState(() {
                _projectFolder = null;
              });
            },
          );
  }
}
