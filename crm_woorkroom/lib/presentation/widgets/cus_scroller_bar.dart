import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class CusScrollerBar extends StatefulWidget {
  final ScrollController scrollController;
  final Color backgorundColor;
  final Color barColor;
  const CusScrollerBar({
    super.key,
    required this.scrollController,
    required this.backgorundColor,
    required this.barColor,
  });

  @override
  State<CusScrollerBar> createState() => _CusScrollerBarState();
}

class _CusScrollerBarState extends State<CusScrollerBar> {
  double _scrollProgress = 0.0;

  @override
  void initState() {
    widget.scrollController.addListener(_updateScrollProgress);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateScrollProgress);
    super.dispose();
  }

  void _updateScrollProgress() {
    if (widget.scrollController.hasClients) {
      final double maxScroll = widget.scrollController.position.maxScrollExtent;
      final double currentOffset = widget.scrollController.offset;
      if (maxScroll > 0) {
        setState(() {
          _scrollProgress = (currentOffset / maxScroll).clamp(0, 1);
        });
      }
    }
  }

  void _handleDragUpdate(
    DragUpdateDetails details,
    double maxMovableWidth,
  ) {
    double changeInProgress = details.delta.dx / maxMovableWidth;

    double newProgress = (_scrollProgress + changeInProgress).clamp(0.0, 1.0);

    double newOffset = newProgress * widget.scrollController.position.maxScrollExtent;

    widget.scrollController.jumpTo(newOffset);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double trackWidth = constraints.maxWidth;
        double thumWidth = trackWidth * 0.2;
        double maxMovableWidth = trackWidth - thumWidth;
        double leftOffset = _scrollProgress * maxMovableWidth;
        return Container(
          width: thumWidth,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
            color: widget.backgorundColor,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: leftOffset,
                child: GestureDetector(
                  onPanUpdate: (details) =>
                      _handleDragUpdate(details, maxMovableWidth),
                  child: Container(
                    width: thumWidth,
                    decoration: BoxDecoration(
                      color: widget.barColor,
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
