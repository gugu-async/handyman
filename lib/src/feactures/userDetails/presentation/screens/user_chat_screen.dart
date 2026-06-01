import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/src/core/assets/app_assets.dart';
import 'package:handyman/src/core/theme/app_colors.dart';
import 'package:handyman/src/feactures/userDetails/presentation/painter/chat_painter.dart';
import 'package:handyman/src/feactures/userDetails/presentation/widget/send_comment_w.dart';

class UserChatScreen extends StatelessWidget {
  final String photo;
  final String name;
  final String status;
  const UserChatScreen({
    super.key,
    required this.photo,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: ChatPainter(),
          child: Padding(
            padding: .only(right: 10, top: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.66,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: SvgPicture.asset(
                              AppAssets.leftArrow,
                              colorFilter: .mode(AppColors.white, .srcIn),
                              height: 20,
                            ),
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                width: 38,
                                height: 38,
                                child: ClipRRect(
                                  borderRadius: .circular(100),
                                  child: Image.asset(photo, fit: .cover),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: .topRight,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: .circle,
                                      border: .all(
                                        color: AppColors.white,
                                        width: 1.5,
                                      ),
                                      color: status == "Available"
                                          ? AppColors.lightPrimaryColor
                                          : Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: .start,
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  name,
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: AppColors.white,
                                        fontWeight: .bold,
                                      ),
                                  maxLines: 1,
                                  overflow: .ellipsis,
                                ),
                                Text(
                                  'Online',
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 38,
                          width: 38,
                          padding: .all(9),
                          margin: .only(left: 5, right: 10),
                          decoration: BoxDecoration(
                            shape: .circle,
                            border: .all(width: 1, color: Colors.black87),
                          ),
                          child: SvgPicture.asset(
                            AppAssets.videoCall,
                            colorFilter: .mode(Theme.of(context).iconTheme.color!, .srcIn),
                          ),
                        ),
                        Container(
                          height: 38,
                          width: 38,
                          padding: .all(9),
                          decoration: BoxDecoration(
                            shape: .circle,
                            border: .all(width: 1, color: Colors.black87),
                          ),
                          child: SvgPicture.asset(
                            AppAssets.phone,
                            colorFilter: .mode(Theme.of(context).iconTheme.color!, .srcIn),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: ListView()),
                SendCommentW(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
