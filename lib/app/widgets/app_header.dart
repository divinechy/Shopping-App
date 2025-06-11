import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/app/theme/svgs.dart';
import 'package:shopping_app/app/widgets/platform_svg.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final Size media = Get.mediaQuery.size;
  AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFF93C5FD),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Full Logo',
              style: TextStyle(color: Color(0xFF2563EB), fontSize: 12),
            ),
          ),
          SizedBox(width: media.width * 0.1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'DELIVERY ADDRESS',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 8),
              Text(
                'Umuezike Road, Oyo State',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        PlatformSvg.asset(BELL, width: 19, height: 20).paddingOnly(right: 32),
      ],
      toolbarHeight: 60,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
