import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/src/core/constants/app_constants.dart';
import 'package:handyman/src/core/presentation/widgets/custom_appbar.dart';
import 'package:handyman/src/core/presentation/widgets/side_menu_w.dart';
import 'package:handyman/src/core/assets/app_assets.dart';
import 'package:handyman/src/core/theme/app_colors.dart';
import 'package:handyman/src/feactures/home/local/user_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    var userData = UserDataLocal();

    return Scaffold(
      key: scaffoldKey,
      drawer: const SideMenuW(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: .topCenter,
                child: Container(
                  width: .infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
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
            Column(
              children: [
                CustomAppbar(
                  title: AppConstants.appName,
                  function: () => scaffoldKey.currentState!.openDrawer(),
                ),
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        expandedHeight: 70.0,
                        backgroundColor: Colors.transparent,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Padding(
                            padding: .all(10),
                            child: Opacity(
                              opacity: 0.9,
                              child: Text(
                                AppConstants.appDescription,
                                textAlign: .center,
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: AppColors.white,
                                      fontWeight: .bold,
                                    ),
                                maxLines: 3,
                                overflow: .ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: userData.data.length,
                          (_, int index) {
                            var item = userData.data[index];
                            return Container(
                              padding: .all(8),
                              margin: .only(bottom: 13, left: 13, right: 13),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).shadowColor,
                                    blurRadius: 3,
                                    offset: const Offset(6, 0),
                                  ),
                                ],
                                borderRadius: .circular(10),
                                color: Theme.of(context).cardColor,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            width: 65,
                                            height: 65,
                                            child: ClipRRect(
                                              borderRadius: .circular(100),
                                              child: Image.asset(
                                                item.photo,
                                                fit: .cover,
                                              ),
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Align(
                                              alignment: .bottomRight,
                                              child: Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  shape: .circle,
                                                  border: .all(
                                                    color: AppColors.white,
                                                    width: 1.5,
                                                  ),
                                                  color:
                                                      item.status == "Available"
                                                      ? AppColors
                                                            .lightPrimaryColor
                                                      : Colors.redAccent,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            Text(
                                              item.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(fontWeight: .bold),
                                              maxLines: 2,
                                              overflow: .ellipsis,
                                            ),
                                            Padding(
                                              padding: .only(top: 5, bottom: 7),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: .symmetric(
                                                      horizontal: 6,
                                                      vertical: 1,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius: .circular(
                                                        5,
                                                      ),
                                                      color: Colors.orange,
                                                    ),
                                                    child: Text(
                                                      "${item.qualification}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                            color:
                                                                AppColors.white,
                                                            fontWeight: .bold,
                                                          ),
                                                    ),
                                                  ),
                                                  ...List.generate(
                                                    5,
                                                    (index) => Padding(
                                                      padding: .symmetric(
                                                        horizontal: 4,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        AppAssets.star,
                                                        height: 12,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                              item.qualification
                                                                          .toInt() >
                                                                      index
                                                                  ? Colors
                                                                        .orange
                                                                  : Theme.of(
                                                                      context,
                                                                    ).hintColor,
                                                              .srcIn,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Opacity(
                                                      opacity: 0.4,
                                                      child: Text(
                                                        "(${item.reviews} reviews)",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                        maxLines: 1,
                                                        overflow: .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 22,
                                              child: ListView.builder(
                                                itemCount:
                                                    item.categories.length,
                                                scrollDirection: .horizontal,
                                                itemBuilder:
                                                    (
                                                      BuildContext context,
                                                      int index,
                                                    ) {
                                                      var it = item
                                                          .categories[index];
                                                      return Container(
                                                        margin: .only(right: 5),
                                                        alignment: .center,
                                                        padding: .symmetric(
                                                          horizontal: 7,
                                                          vertical: 2,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                                  .circular(4),
                                                              color: Theme.of(
                                                                context,
                                                              ).hintColor,
                                                            ),
                                                        child: Text(
                                                          it.name,
                                                          style: Theme.of(
                                                            context,
                                                          ).textTheme.bodySmall,
                                                        ),
                                                      );
                                                    },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: .only(top: 5),
                                    child: Divider(thickness: 1.2),
                                  ),
                                  Row(
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppAssets.money,
                                            colorFilter: .mode(
                                              Theme.of(context).primaryColor,
                                              .srcIn,
                                            ),
                                            height: 17,
                                          ),
                                          const SizedBox(width: 10),
                                          Opacity(
                                            opacity: 0.7,
                                            child: Text(
                                              '${item.pricePerHour} USD/hour',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(fontWeight: .bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          padding: .symmetric(
                                            vertical: 6,
                                            horizontal: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            gradient: AppColors.greenGradient2,
                                            borderRadius: .circular(8),
                                          ),
                                          child: Text(
                                            'Choose',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: AppColors.white,
                                                  fontWeight: .bold,
                                                ),
                                          ),
                                        ),
                                        onTap: () => context.pushNamed(
                                          "userDetails",
                                          extra: item,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
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
    );
  }
}
