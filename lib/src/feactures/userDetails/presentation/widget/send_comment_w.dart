import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman/src/core/assets/app_assets.dart';
import 'package:handyman/src/core/theme/app_colors.dart';

class SendCommentW extends StatelessWidget {
  const SendCommentW({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              minLines: 1,
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.white, width: 2),
                  borderRadius: .circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.white, width: 2),
                  borderRadius: .circular(17),
                ),
                contentPadding: .all(15),
                fillColor: Theme.of(context).cardColor,
                hintText: 'Comment',
                hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge!.color,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            padding: .all(15.0),
            decoration: BoxDecoration(
              shape: .circle,
              color: Theme.of(context).cardColor,
            ),
            child: SvgPicture.asset(
              AppAssets.send,
              colorFilter: .mode(Color(0xFF6cbc58), .srcIn),
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
