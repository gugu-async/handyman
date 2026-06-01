import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handyman/src/core/presentation/widgets/side_menu_item_w.dart';
import 'package:handyman/src/core/assets/app_assets.dart';
import 'package:handyman/src/core/theme/app_colors.dart';
import 'package:handyman/src/feactures/home/state/theme_provider.dart';
import 'package:handyman/src/feactures/home/local/user_data.dart';

class SideMenuW extends StatelessWidget {
  const SideMenuW({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: .topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    gradient: AppColors.greenGradient,
                    borderRadius: .only(
                      bottomLeft: .circular(30),
                      bottomRight: .circular(30),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: .all(20),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Consumer(
                          builder: (ctx, ref, _) => GestureDetector(
                            child: Container(
                              width: 85,
                              height: 85,
                              margin: .only(top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                shape: .circle,
                                border: .all(width: 3, color: Colors.white),
                              ),
                              child: ClipRRect(
                                borderRadius: .circular(100),
                                child: Image.asset(
                                  AppAssets.perfil,
                                  fit: .cover,
                                ),
                              ),
                            ),
                            onTap: () => ref
                                .read(isDarkModeProvider.notifier)
                                .update((state) => !state),
                          ),
                        ),
                        Text(
                          'Marrie Anna',
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                fontWeight: .bold,
                                color: AppColors.white,
                              ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.location,
                              colorFilter: .mode(AppColors.white, .srcIn),
                              height: 18,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Melbourne, Australia",
                              style: Theme.of(context).textTheme.labelLarge!
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: .bottomRight,
                    child: Container(
                      margin: .only(right: 30),
                      padding: .all(10),
                      decoration: BoxDecoration(
                        shape: .circle,
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            blurRadius: 3,
                            offset: const Offset(3, 3),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        AppAssets.powerOff,
                        height: 20,
                        colorFilter: .mode(
                          Theme.of(
                            context,
                          ).textTheme.bodyLarge!.color!.withValues(alpha: 0.6),
                          .srcIn,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: UserDataLocal.menuData.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = UserDataLocal.menuData[index];
                        return SideMenuItemW(icon: item.icon, name: item.name);
                      },
                    ),
                  ),
                  SideMenuItemW(icon: AppAssets.contact, name: 'Contact Us'),
                  SideMenuItemW(icon: AppAssets.settings, name: 'Settings'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
