import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman/src/core/assets/app_assets.dart';
import 'package:handyman/src/core/theme/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Color? color;
  final String? leftIcon;
  final VoidCallback? function;
  const CustomAppbar({
    super.key,
    required this.title,
    this.color,
    this.leftIcon,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(left: 2, right: 10, top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          IconButton(
            onPressed: function,
            icon: SvgPicture.asset(
              leftIcon ?? AppAssets.menu,
              colorFilter: ColorFilter.mode(color ?? AppColors.white, .srcIn),
              height: 20,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color ?? AppColors.white,
              fontWeight: .bold,
            ),
          ),
          Stack(
            children: [
              SvgPicture.asset(
                AppAssets.notification,
                colorFilter: ColorFilter.mode(color ?? AppColors.white, .srcIn),
                height: 20,
              ),
              Positioned.fill(
                child: Align(
                  alignment: .topRight,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: color ?? AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
