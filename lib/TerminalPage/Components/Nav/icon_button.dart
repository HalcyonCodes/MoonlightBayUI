import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Config/color.dart';

class IconButton extends StatefulWidget {
  final String iconPath;
  final Function()? onClick;
  const IconButton({super.key, required this.iconPath, required this.onClick});

  @override
  State<IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButton> {
  bool? isHover;
  String? iconPath;

  @override
  void initState() {
    super.initState();
    isHover = false;
    iconPath = widget.iconPath;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        isHover = value;
        refreshUi();
      },
      onTap: widget.onClick,
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isHover == true ? KColor.primaryColor : KColor.navIconColor),
        alignment: Alignment.center,
        child: SizedBox(
          height: 47,
          width: 47,
          child: SvgPicture.asset(iconPath!),
        ),
      ),
    );
  }

  void refreshUi() {
    setState(() {});
  }
}
