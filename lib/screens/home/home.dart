import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wingman/screens/home/widgets/bottom_bar.dart';
import 'package:wingman/screens/home/widgets/carousel.dart';
import 'package:wingman/screens/home/widgets/destination_heading.dart';
import 'package:wingman/screens/home/widgets/explore_drawer.dart';
import 'package:wingman/screens/home/widgets/featured_heading.dart';
import 'package:wingman/screens/home/widgets/featured_tiles.dart';
import 'package:wingman/screens/home/widgets/floating_quick_access_bar.dart';
import 'package:wingman/screens/home/widgets/top_bar_contents.dart';
import 'package:wingman/utils/colors.dart';
import 'package:wingman/utils/textstyle.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();
    double scrollPosition = 0;
    double opacity = 0;

    scrollListener() {
      scrollPosition = scrollController.position.pixels;
    }

    scrollController.addListener(scrollListener);

    var screenSize = MediaQuery.of(context).size;
    opacity = scrollPosition < screenSize.height * 0.40
        ? scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: !kIsWeb
          ? AppBar(
              iconTheme: IconThemeData(
                color: purpleText2,
              ),
              backgroundColor: Colors.blueGrey.shade900.withOpacity(opacity),
              elevation: 0,
              title: Text(
                'EXPLORE',
                style: headerStyle,
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(opacity),
            ),
      drawer: const ExploreDrawer(),
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: screenSize.height * 0.45,
                  width: screenSize.width,
                  child: Image.asset(
                    'assets/cover.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    Column(
                      children: [
                        FeaturedHeading(
                          screenSize: screenSize,
                        ),
                        FeaturedTiles(screenSize: screenSize)
                      ],
                    ),
                  ],
                )
              ],
            ),
            DestinationHeading(screenSize: screenSize),
            const DestinationCarousel(),
            SizedBox(height: screenSize.height / 10),
            !kIsWeb ? const SizedBox.shrink() : const BottomBar(),
          ],
        ),
      ),
    );
  }
}
