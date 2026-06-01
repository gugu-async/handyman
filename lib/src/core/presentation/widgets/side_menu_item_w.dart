import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman/src/core/theme/app_colors.dart';

class SideMenuItemW extends StatelessWidget {
  final String icon;
  final String name;
  const SideMenuItemW({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .only(top: 10, bottom: 10, right: 26, left: 5),
      decoration: BoxDecoration(
        color: name == "Message" ? Theme.of(context).canvasColor : null,
        borderRadius: .circular(name == "Message" ? 5 : 0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 24,
            colorFilter: .mode(
              name == "Message"
                  ? Theme.of(context).primaryColor
                  : Theme.of(
                      context,
                    ).textTheme.titleLarge!.color!.withValues(alpha: 0.6),
              .srcIn,
            ),
          ),
          const SizedBox(width: 30),
          Opacity(
            opacity: 0.8,
            child: Text(
              name,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: .bold),
            ),
          ),
          if (name == "Message") ...[
            Expanded(
              child: Align(
                alignment: .centerRight,
                child: Container(
                  padding: .symmetric(horizontal: 3, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: .circular(4),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    "15 New",
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
