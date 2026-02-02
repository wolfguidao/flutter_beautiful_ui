import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_checkbox.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_widget.dart';
import 'package:flutter/material.dart';

class ProjectsFiltersButton extends StatefulWidget {
  final Project project;
  const ProjectsFiltersButton({super.key, required this.project});

  @override
  State<ProjectsFiltersButton> createState() => _ProjectsFiltersButtonState();
}

class _ProjectsFiltersButtonState extends State<ProjectsFiltersButton> {
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _openFilters() {
    _removeOverlay();
    final RenderBox? renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    double buttonWidth = renderBox.size.width;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return ProjectsFilters(
          project: widget.project,
          dxOffset: offset.dx + buttonWidth,
          removeOverlay: _removeOverlay,
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry == null) return;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: _key,
      onPressed: () {
        _openFilters();
      },
      icon: Icon(Icons.filter_list_outlined, size: 20),
    );
  }
}

class ProjectsFilters extends StatefulWidget {
  final Project project;
  final double dxOffset;
  final VoidCallback removeOverlay;
  const ProjectsFilters({
    super.key,
    required this.removeOverlay,
    required this.dxOffset,
    required this.project,
  });

  @override
  State<ProjectsFilters> createState() => _ProjectsFiltersState();
}

class _ProjectsFiltersState extends State<ProjectsFilters>
    with SingleTickerProviderStateMixin {
  final List<TaskGroup> _activeGroupList = [TaskGroup.design];
  final List<Employee> _reporterList = [];
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleRemove() async {
    await _controller.reverse();
    widget.removeOverlay();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () async => await _handleRemove(),
              child: ColoredBox(color: AppColor.barrierColor),
            ),
          ),
          Positioned(
            right: width - widget.dxOffset,
            top: AppLayout.paddingLarge,
            bottom: AppLayout.paddingLarge,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return FractionalTranslation(
                  translation: Offset(1.0 - _animation.value, 0),
                  child: Opacity(opacity: _animation.value, child: child),
                );
              },
              child: Container(
                width: width * 0.225,
                decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: AppLayout.paddingSmall.allPadding,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColor.borderColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Filters",
                            style: TextTheme.of(context).displaySmall,
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColor.backgroundColor,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () async => await _handleRemove(),
                            icon: const Icon(Icons.close, size: 15),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(
                          context,
                        ).copyWith(scrollbars: false),
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Container(
                                padding: AppLayout.paddingSmall.allPadding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColor.borderColor,
                                    ),
                                  ),
                                ),
                                child: CusLabelTextfile(
                                  label: "Period",
                                  hintText: "Selects Period",
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: AppLayout.paddingSmall.allPadding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColor.borderColor,
                                    ),
                                  ),
                                ),
                                child: CusLabelWidget(
                                  label: "Task Group",
                                  child: Column(
                                    children: TaskGroup.values.map((group) {
                                      return Padding(
                                        padding: (AppLayout.paddingSmall * 0.3)
                                            .verticalPadding,
                                        child: Row(
                                          children: [
                                            CusCheckbox(
                                              value: _activeGroupList.contains(
                                                group,
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  value
                                                      ? _activeGroupList.add(
                                                          group,
                                                        )
                                                      : _activeGroupList.remove(
                                                          group,
                                                        );
                                                });
                                              },
                                            ),
                                            AppLayout.paddingSmall.widthBox,
                                            Text(
                                              group.text,
                                              style: TextStyle(
                                                fontSize: TextTheme.of(
                                                  context,
                                                ).labelMedium?.fontSize,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: AppLayout.paddingSmall.allPadding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColor.borderColor,
                                    ),
                                  ),
                                ),
                                child: CusLabelWidget(
                                  label: "Reporter",
                                  child: Column(
                                    children: [
                                      ...widget.project.allReporter.take(5).map(
                                        (user) {
                                          return Padding(
                                            padding:
                                                (AppLayout.paddingSmall / 2)
                                                    .verticalPadding,
                                            child: Row(
                                              children: [
                                                CusCheckbox(
                                                  value: _reporterList.contains(
                                                    user,
                                                  ),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      value
                                                          ? _reporterList.add(
                                                              user,
                                                            )
                                                          : _reporterList
                                                                .remove(user);
                                                    });
                                                  },
                                                ),
                                                Padding(
                                                  padding: AppLayout
                                                      .paddingSmall
                                                      .horizontalPadding,
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      user.avatar,
                                                      width: 15,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  user.name,
                                                  style: TextStyle(
                                                    fontSize: TextTheme.of(
                                                      context,
                                                    ).labelMedium?.fontSize,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Text(
                                              "View All",
                                              style: TextStyle(
                                                fontSize: TextTheme.of(
                                                  context,
                                                ).labelMedium?.fontSize,
                                                color: AppColor.primaryColor,
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 15,
                                              color: AppColor.primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: AppLayout.paddingSmall.allPadding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColor.borderColor,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CusLabelTextfile(
                                      label: "Assignees",
                                      hintText: "Search",
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.start,
                                      children: widget.project.allAssignee
                                          .take(4)
                                          .map((user) {
                                            return Container(
                                              padding: 2.allPadding,
                                              margin:
                                                  (AppLayout.paddingSmall / 2)
                                                      .allPadding,
                                              decoration: BoxDecoration(
                                                color: AppColor.backgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      AppLayout.borderRadius,
                                                    ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ClipOval(
                                                    child: Image.asset(
                                                      user.avatar,
                                                      width: 15,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        (AppLayout.paddingSmall /
                                                                2)
                                                            .horizontalPadding,
                                                    child: Text(
                                                      user.name,
                                                      style: TextStyle(
                                                        fontSize: TextTheme.of(
                                                          context,
                                                        ).labelSmall?.fontSize,
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.close_rounded,
                                                    size: 12,
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: AppLayout.paddingSmall.allPadding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColor.borderColor,
                                    ),
                                  ),
                                ),
                                child: CusLabelTextfile(
                                  label: "Estimate",
                                  hintText: "Selects Duration",
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: AppLayout.paddingSmall.allPadding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColor.borderColor,
                                    ),
                                  ),
                                ),
                                child: CusLabelTextfile(
                                  label: "Priority",
                                  hintText: "Medium",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Padding(
                        padding: AppLayout.paddingSmall.allPadding,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Save Filters",
                            style: TextStyle(
                              fontSize: TextTheme.of(
                                context,
                              ).bodyMedium?.fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
