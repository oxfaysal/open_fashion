import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:open_fashion/api/trending_tag.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/core/style/headline_text.dart';
import 'package:open_fashion/core/style/text_style.dart';
import 'package:open_fashion/features/widget/custom_appbar.dart';
import 'package:open_fashion/features/widget/footer.dart';
import 'package:open_fashion/features/widget/home/accessible_items.dart';
import 'package:open_fashion/features/widget/home/arrival_grid_card.dart';
import 'package:open_fashion/features/widget/home/follow_us.dart';

import '../../api/arrival_json.dart';
import '../widget/divider.dart';
import '../widget/home/arrival_list_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedTab = 'All';
  List<dynamic> categoryList = arrival[0]['categories'];
  List<dynamic> itemList = arrival[0]['products'];

  List<dynamic> get filteredItems {
    return _selectedTab == 'All'
        ? arrival[0]['products']
        : arrival[0]['products']
              .where((item) => item['category'] == _selectedTab)
              .toList();
  }

  final ScrollController _scrollController = ScrollController();   // SingleChildScrollView এর জন্য
  final ScrollController _listScrollController = ScrollController(); // ListView এর জন্য
  int _currentPage = 0;
  final double _itemWidth = 276;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();

    // AppBar color change
    _scrollController.addListener(() {
      setState(() {
        _isScrolled = _scrollController.offset > 560;
      });
    });

    // Dot indicator
    _listScrollController.addListener(() {
      setState(() {
        _currentPage = (_listScrollController.offset / _itemWidth).round();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(bgColor: _isScrolled ? Colors.white : AppColors.secondaryColor,),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              height: 560,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home_header_img.png"),
                  fit: BoxFit.cover,
                  alignment: AlignmentGeometry.xy(-0.95, 0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 220),
                child: Column(
                  children: [
                    Text(
                      "Luxury \n  Fashion \n& Accessories".toUpperCase(),
                      style: AppTextStyle.bodyText40w700,
                    ),
                    Spacer(),

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blackColor.withAlpha(100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Explore Collection".toUpperCase(),
                        style: AppTextStyle.textWhite16w400,
                      ),
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            HeadlineText(text: "New Arrival",),
            SizedBox(height: 10),
            CustomDivider(width: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categoryList
                      .map((categoryName) => _buildTab(categoryName))
                      .toList(),
                ),
              ),
            ),

            SizedBox(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  key: ValueKey(_selectedTab),
                  itemCount: filteredItems.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: ArrivalGridCard(
                        img: filteredItems[index]['image_url'],
                        title: filteredItems[index]['title'],
                        price: filteredItems[index]['price'].toString(),
                        onPress: () {},
                      ),
                    );
                  },
                ),
              ),
            ),

            TextButton.icon(
              onPressed: () {},
              label: Text("Explore More", style: AppTextStyle.textBlack16w400),
              icon: Icon(
                LucideIcons.arrowRight,
                size: 24,
                color: AppColors.blackColor,
              ),
              iconAlignment: IconAlignment.end,
            ),
            SizedBox(height: 40),

            CustomDivider(width: 50),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/prada.png"),
                  Image.asset("assets/images/burberry.png"),
                  Image.asset("assets/images/boss.png"),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/catier.png"),
                  Image.asset("assets/images/gucci.png"),
                  Image.asset("assets/images/tiffany.png"),
                ],
              ),
            ),

            SizedBox(height: 10),

            CustomDivider(width: 50),

            SizedBox(height: 50),

            HeadlineText(text: "Collections",),

            SizedBox(height: 20),

            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,

                children: [
                  Image.asset(
                    'assets/images/colection_model.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Color(0x55C8C8C8), Colors.transparent],
                        stops: [0.0, 0.55],
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: Text('10', style: AppTextStyle.collection10Design),
                  ),

                  Positioned(
                    bottom: 45,
                    right: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'October',
                          style: AppTextStyle.collectionOctoberDesign,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Collection'.toUpperCase(),
                          style: AppTextStyle.collectionDesign,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Transform(
                        transform: Matrix4.identity()..scale(0.9),
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/images/autumn.png',
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          alignment: const Alignment(-1.25, 0.0),
                        ),
                      ),

                      Positioned(
                        top: 50,
                        right: 55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Autumn',
                              style: AppTextStyle.autumnText45Design,
                            ),
                            Text(
                              'Collection'.toUpperCase(),
                              style: AppTextStyle.collection15Design,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            AspectRatio(
              aspectRatio: 16 / 8,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/video_image.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.blackColor.withAlpha(100),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LucideIcons.play,
                      color: AppColors.whiteColor,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),
            HeadlineText(text: "Just for You",),

            SizedBox(height: 10),
            CustomDivider(width: 50),

            SizedBox(height: 30),

            SizedBox(
              height: 440,
              child: ListView.builder(
                controller: _listScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 16.0 : 8.0,
                      right: index == filteredItems.length - 1 ? 20.0 : 8.0,
                    ),
                    child: SizedBox(
                      width: 260,
                      child: ArrivalListCard(
                        img: filteredItems[index]['image_url'],
                        title: filteredItems[index]['title'],
                        price: filteredItems[index]['price'].toString(),
                        onPress: () {},
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(filteredItems.length, (index) {
                final bool isActive = index == _currentPage;
                return Transform.rotate(
                  angle: 45 * 3.14159 / 180,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: isActive ? 6 : 5,
                    height: isActive ? 6 : 5,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.black : Colors.transparent,
                      border: isActive
                          ? null
                          : Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 60),
            HeadlineText(text: "@Trending",),

            SizedBox(height: 20),

            Wrap(
              spacing: 8,
              children: trendingTag.map((tag) {
                return ChoiceChip(
                  label: Text(tag, style: AppTextStyle.tagTextDesign),
                  selected: false,
                  onSelected: (_) {},
                  backgroundColor: AppColors.capsulBgF9Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.transparent),
                  ),
                  showCheckmark: false,
                );
              }).toList(),
            ),

            SizedBox(height: 50),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColors.containerColor),
              child: Column(
                children: [
                  Text(
                    "Open \nFashion",
                    style: AppTextStyle.logo,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 16),

                  Text(
                    "Making a luxurious lifestyle accessible \nfor a generous group of women is our \ndaily drive.",
                    style: AppTextStyle.tabActive14w400,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 16),
                  CustomDivider(width: 50),

                  SizedBox(height: 30),

                  Row(
                    children: [
                      AccessibleItems(
                        img: "assets/images/accessible1.png",
                        title: "Fast shipping. \nFree on orders over \$25.",
                      ),
                      AccessibleItems(
                        img: "assets/images/accessible2.png",
                        title: "Sustainable process \nfrom start to finish.",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      AccessibleItems(
                        img: "assets/images/accessible3.png",
                        title: "Unique designs \nand high-quality materials.",
                      ),
                      AccessibleItems(
                        img: "assets/images/accessible4.png",
                        title: "Fast shipping. \nFree on orders over \$25.",
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Center(
                    child: Image.asset(
                      "assets/images/accessible_sign.png",
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),

            HeadlineText(text: "Follow Us",),

            SizedBox(height: 12),
            Center(child: Icon(LucideIcons.instagram200, color: AppColors.iconColor, size: 36,)),
            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                spacing: 16,
                children: [
                  FollowUs(img: "assets/images/follow1.png", title: "@_mia"),
                  FollowUs(img: "assets/images/follow2.png", title: "@_jihyn"),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                spacing: 16,
                children: [
                  FollowUs(img: "assets/images/follow3.png", title: "@_mia"),
                  FollowUs(img: "assets/images/follow4.png", title: "@_jihyn"),
                ],
              ),
            ),

            SizedBox(height: 40),

            Footer(),

          ],
        ),
      ),
    );
  }

  Widget _buildTab(String tab) {
    final bool isSelected = _selectedTab == tab;

    return GestureDetector(
      onTap: () => setState(() => _selectedTab = tab),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.only(right: 18, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tab,
              style: isSelected
                  ? AppTextStyle.tabActive14w400
                  : AppTextStyle.tabUnActive14w400,
            ),
            SizedBox(height: 2),
            if (isSelected)
              Transform.rotate(
                angle: 45 * 3.14159 / 180, // 45 ডিগ্রি rotate
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
