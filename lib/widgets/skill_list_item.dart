import 'package:biodata/theme.dart';
import 'package:flutter/cupertino.dart';

class SkillListItem extends StatefulWidget {
  final List<MySkillListItem> skills;
  final double height;
  final bool showIcon;
  final double iconSize;
  final double viewportFraction;
  final int initialPage;

  const SkillListItem(
      {required this.skills,
      this.height = 35,
      this.showIcon = false,
      this.iconSize = 20,
      this.viewportFraction = 0.5,
      this.initialPage = 100,
      super.key});

  @override
  State<SkillListItem> createState() => _SkillListItemState();
}

class _SkillListItemState extends State<SkillListItem> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: widget.initialPage,
    );

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          _controller.jumpToPage(99);
        } else {
          _controller.jumpToPage(101);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.skills.length * 1000,
        itemBuilder: (context, index) {
          final item = widget.skills[index % widget.skills.length];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.showIcon)
                  Image.asset(
                    item.iconUrl ?? '',
                    width: widget.iconSize,
                    height: widget.iconSize,
                  ),
                if (widget.showIcon)
                  const SizedBox(width: 10),
                Text(
                  item.title,
                  style: whiteTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


class MySkillListItem {
  String ? iconUrl;
  final String title;
  final Color color;

  MySkillListItem({
    this.iconUrl,
    required this.title,
    required this.color, 
  });
}
