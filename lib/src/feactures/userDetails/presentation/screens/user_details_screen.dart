import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/src/core/presentation/widgets/custom_appbar.dart';
import 'package:handyman/src/core/assets/app_assets.dart';
import 'package:handyman/src/core/theme/app_colors.dart';
import 'package:handyman/src/feactures/home/local/user_data.dart';
import 'package:handyman/src/feactures/home/models/user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  final UsersModel data;
  const UserDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var tabs = ["About Me", "Services", "Portfolio", "Reviews"];
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: tabs.length,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Theme.of(context).cardColor,
                      title: CustomAppbar(
                        title: "Harry Edward",
                        color: Theme.of(context).textTheme.bodySmall!.color,
                        leftIcon: AppAssets.leftArrow,
                        function: () => context.pop(),
                      ),
                      pinned: true,
                      expandedHeight: MediaQuery.of(context).size.height * 0.56,
                      forceElevated: innerBoxIsScrolled,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: .topCenter,
                                child: SizedBox(
                                  width: .infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.27,
                                  child: ClipRRect(
                                    borderRadius: .only(
                                      bottomLeft: .circular(30),
                                      bottomRight: .circular(30),
                                    ),
                                    child: Image.asset(
                                      AppAssets.background,
                                      fit: .cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                ),
                                Container(
                                  width: 98,
                                  height: 98,
                                  decoration: BoxDecoration(
                                    shape: .circle,
                                    border: .all(width: 3, color: Colors.white),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: .circular(100),
                                    child: Image.asset(data.photo, fit: .cover),
                                  ),
                                ),
                                Text(
                                  data.name,
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(fontWeight: .bold),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: .center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.star,
                                      colorFilter: .mode(Colors.orange, .srcIn),
                                      height: 17,
                                    ),
                                    Padding(
                                      padding: .symmetric(horizontal: 5),
                                      child: Text(
                                        "${data.qualification}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontWeight: .bold),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Text(
                                        "(${data.reviews})",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              decoration: .underline,
                                              fontWeight: .bold,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    if (data.topRated) ...[
                                      Row(
                                        children: [
                                          Container(
                                            width: 1.8,
                                            height: 18,
                                            color: Theme.of(context).hintColor,
                                          ),
                                          Container(
                                            margin: .symmetric(horizontal: 9),
                                            padding: .symmetric(
                                              horizontal: 5,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(5),
                                              color: Colors.orange[50],
                                            ),
                                            child: Text(
                                              "Top rated",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                    color: Colors.orange,
                                                    fontWeight: .bold,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.8,
                                            height: 18,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ],
                                ),
                                Container(
                                  margin: .symmetric(
                                    vertical: 25,
                                    horizontal: 20,
                                  ),
                                  padding: .symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGreen,
                                    borderRadius: .circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: .center,
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.money,
                                        colorFilter: .mode(
                                          Theme.of(context).primaryColor,
                                          .srcIn,
                                        ),
                                        height: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${data.pricePerHour} USD / Hour',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).primaryColor,
                                              fontWeight: .bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: .fromHeight(47),
                        child: Container(
                          color: Theme.of(context).cardColor,
                          child: TabBar(
                            padding: .symmetric(horizontal: 20),
                            isScrollable: true,
                            tabs: tabs
                                .map((String name) => Tab(text: name))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
            body: Container(
              color: Theme.of(context).cardColor,
              child: TabBarView(
                children: tabs
                    .map(
                      (String name) => Builder(
                        builder: (BuildContext context) => CustomScrollView(
                          key: PageStorageKey<String>(name),
                          slivers: [
                            SliverOverlapInjector(
                              handle:
                                  NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context,
                                  ),
                            ),
                            name == "About Me"
                                ? SliverPadding(
                                    padding: .symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    sliver: SliverToBoxAdapter(
                                      child: Column(
                                        mainAxisAlignment: .start,
                                        crossAxisAlignment: .start,
                                        children: [
                                          Padding(
                                            padding: .symmetric(vertical: 10),
                                            child: Text(
                                              "About Me",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(fontWeight: .bold),
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.8,
                                            child: Text(
                                              "${UserDataLocal.aboutMe}...",
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodySmall!,
                                            ),
                                          ),
                                          Padding(
                                            padding: .symmetric(vertical: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Read More",
                                                  style: Theme.of(
                                                    context,
                                                  ).textTheme.titleSmall,
                                                ),
                                                const SizedBox(width: 10),
                                                SvgPicture.asset(
                                                  AppAssets.downArrow,
                                                  height: 6,
                                                  colorFilter: .mode(
                                                    Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .color!,
                                                    .srcIn,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(thickness: 1.8),
                                          Text(
                                            "Work Skills",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(fontWeight: .bold),
                                          ),
                                          const SizedBox(height: 10),
                                          Wrap(
                                            direction: .horizontal,
                                            spacing: 10,
                                            runSpacing: 10,
                                            children: data.categories
                                                .map(
                                                  (item) => Container(
                                                    margin: .only(right: 4),
                                                    padding: .symmetric(
                                                      horizontal: 7,
                                                      vertical: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius: .circular(
                                                        4,
                                                      ),
                                                      color: Theme.of(
                                                        context,
                                                      ).hintColor,
                                                    ),
                                                    child: Text(
                                                      item.name,
                                                      style: Theme.of(
                                                        context,
                                                      ).textTheme.bodySmall,
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SliverToBoxAdapter(
                                    child: Center(
                                      child: Text(
                                        name,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          onTap: () => context.pushNamed(
            "userChat",
            extra: {
              'photo': data.photo,
              "name": data.name,
              "status": data.status,
            },
          ),
          child: Container(
            height: 56,
            decoration: BoxDecoration(gradient: AppColors.greenGradient2),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                SvgPicture.asset(
                  AppAssets.comments,
                  height: 26,
                  colorFilter: .mode(AppColors.white, .srcIn),
                ),
                const SizedBox(width: 10),
                Text(
                  'CONTACT HANDYMAN',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
