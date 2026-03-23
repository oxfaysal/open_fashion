import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:open_fashion/features/widget/divider.dart';

import '../../api/menu_data.dart';
import '../../core/color/colors.dart';
import '../../core/style/text_style.dart';

class MenuExpandScreen extends StatefulWidget {
  const MenuExpandScreen({super.key});

  @override
  State<MenuExpandScreen> createState() => _MenuExpandScreenState();
}

class _MenuExpandScreenState extends State<MenuExpandScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() {})); // ✅
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Close Button
              Padding(
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 24),
                ),
              ),
              const SizedBox(height: 16),

              // ✅ TabBar
              TabBar(
                isScrollable: false,
                tabAlignment: TabAlignment.fill,
                controller: _tabController,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: [
                  _buildTab("WOMEN", 0),
                  _buildTab("MEN", 1),
                  _buildTab("KIDS", 2),
                ],
              ),

              const SizedBox(height: 8),

              // ✅ Menu List
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildMenuList("women"),
                    _buildMenuList("men"),
                    _buildMenuList("kids"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                spacing: 15,
                children: [
                  Icon(Icons.call, size: 20),
                  Text("(786) 713-8616", style: AppTextStyle.text33Grey16w400),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                spacing: 15,
                children: [
                  Icon(Icons.location_pin, size: 20),
                  Text("Store locator", style: AppTextStyle.text33Grey16w400),
                ],
              ),

              const SizedBox(height: 30),

              CustomDivider(width: 60),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.twitter,
                        size: 22,
                        color: AppColors.iconColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.instagram,
                        size: 22,
                        color: AppColors.iconColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.youtube,
                        size: 22,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Tab _buildTab(String label, int index) {
    bool isActive = _tabController.index == index;
    return Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: isActive
                ? AppTextStyle.tabActive18w400
                : AppTextStyle.tabUnActive18w400,
          ),
          const SizedBox(height: 6),
          isActive
              ? _buildDiamondIndicator()
              : Container(
                  margin: EdgeInsets.only(top: 3, bottom: 3),
                  height: 1,
                  width: double.infinity,
                  color: AppColors.divider55Color.withAlpha(40),
                ),
        ],
      ),
    );
  }

  Widget _buildMenuList(String key) {
    final list = menuData[key] ?? [];
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final items = list[index]['items'] as List<String>; // ✅ cast
        return Column(
          children: [
            ExpansionTile(
              shape: Border(),
              title: Text(
                list[index]['category'] as String, // ✅ cast
                style: AppTextStyle.textBlack16w400,
              ),
              iconColor: Colors.black,
              collapsedIconColor: Colors.black,
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    dense: true,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/category_items',
                        arguments: {
                          'tab': key[0].toUpperCase() + key.substring(1),
                          'category': list[index]['category'] as String,
                          'item': item,
                        },
                      );
                    },
                    title: Text(item, style: AppTextStyle.text33Grey16w400),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDiamondIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 1, width: 30, color: AppColors.primaryColor),
        const SizedBox(width: 2),
        Transform.rotate(
          angle: 45 * 3.14159 / 180,
          child: Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              border: Border.all(color: AppColors.primaryColor, width: 0.5),
            ),
          ),
        ),
        const SizedBox(width: 2),
        Container(height: 1, width: 30, color: AppColors.primaryColor),
      ],
    );
  }
}
