import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:open_fashion/core/style/pajination.dart';
import 'package:open_fashion/features/widget/category/category_list_card.dart';
import 'package:open_fashion/features/widget/custom_appbar.dart';
import 'package:open_fashion/features/widget/footer.dart';

import '../../api/category_items.dart';
import '../../api/menu_data.dart';
import '../../core/color/colors.dart';
import '../../core/style/text_style.dart';
import '../widget/category/category_grid_card.dart';

class CategoryItemsScreen extends StatefulWidget {
  const CategoryItemsScreen({super.key});

  @override
  State<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  String? selectedValue;
  bool isGridViewStyle = true;

  @override
  void initState() {
    super.initState();
    selectedValue = menuData["women"]![0]['category'] as String;
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final List<String> chips = [
      args['tab'] ?? '',
      args['category'] ?? '',
      args['item'] ?? '',
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "4500 Apparel".toUpperCase(),
                        style: AppTextStyle.tabActive14w400,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 0,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.copyrightBgColor.withAlpha(50),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: DropdownButton<String>(
                              underline: SizedBox(),
                              dropdownColor: AppColors.whiteColor,
                              value: selectedValue,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              items: menuData["women"]!.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item['category'] as String,
                                  child: Text(
                                    item['category'] as String,
                                    style: AppTextStyle.textBlack14w400,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                                ;
                              },
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              setState(() {
                                isGridViewStyle = !isGridViewStyle;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                AppColors.copyrightBgColor.withAlpha(50),
                              ),
                            ),
                            icon: Icon(
                              isGridViewStyle
                                  ? LucideIcons.list
                                  : LucideIcons.grid2x2,
                              color: AppColors.iconColor,
                              size: 20,
                            ),
                          ),

                          IconButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                AppColors.copyrightBgColor.withAlpha(50),
                              ),
                            ),
                            icon: Icon(
                              LucideIcons.listFilter,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    children: chips.map((tag) {
                      return ChoiceChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(tag, style: AppTextStyle.tagTextDesign),
                            const SizedBox(width: 4),
                            const Icon(Icons.close, size: 14),
                          ],
                        ),
                        selected: false,
                        onSelected: (_) {},
                        backgroundColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: AppColors.divider55Color.withAlpha(40),
                          ),
                        ),
                        showCheckmark: false,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),

                  isGridViewStyle
                      ? GridView.builder(
                          key: const ValueKey('grid'),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.59,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 10,
                              ),
                          itemCount: productCategoryList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CategoryGridCard(
                              img: productCategoryList[index]['images'][0],
                              brand: productCategoryList[index]['brand'],
                              title: productCategoryList[index]['title'],
                              price: productCategoryList[index]['discountPrice']
                                  .toString(),
                              onPress: () {
                                Navigator.of(context).pushNamed("/category_items_details",
                                    arguments: productCategoryList[index]);
                              },
                            );
                          },
                        )
                      : ListView.builder(
                          key: const ValueKey('list'),
                          itemCount: productCategoryList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CategoryListCard(
                              img: productCategoryList[index]['images'][0],
                              brand: productCategoryList[index]['brand'],
                              title: productCategoryList[index]['title'],
                              price: productCategoryList[index]['discountPrice']
                                  .toString(),
                              rating: productCategoryList[index]['ratings'].toString(),
                              size: productCategoryList[index]['sizes'] as List<String>,
                              onPress: () {
                                Navigator.of(context).pushNamed("/category_items_details",
                                    arguments: productCategoryList[index]);
                              },
                            );
                          },
                        ),

                  SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Pajination(),
                  ),

                  SizedBox(height: 16),
                ],
              ),
            ),

            Footer(),
          ],
        ),
      ),
    );
  }
}
