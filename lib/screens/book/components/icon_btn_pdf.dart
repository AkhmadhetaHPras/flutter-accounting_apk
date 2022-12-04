import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/size_config.dart';
import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({
    Key? key,
    required this.icon,
    this.tap,
  }) : super(key: key);

  final IconData icon;
  final Function? tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: tap as void Function()?,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}
