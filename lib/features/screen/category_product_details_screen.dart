import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/core/style/text_style.dart';
import 'package:open_fashion/features/widget/custom_appbar.dart';
import 'package:open_fashion/features/widget/footer.dart';

import '../../api/category_items.dart';
import '../../core/style/headline_text.dart';
import '../widget/blog/slider_listView.dart';
import '../widget/category/category_grid_card.dart';
import '../widget/category/policy_section.dart';
import '../widget/divider.dart';

class CategoryProductDetailsScreen extends StatefulWidget {
  const CategoryProductDetailsScreen({super.key});

  @override
  State<CategoryProductDetailsScreen> createState() =>
      _CategoryProductDetailsScreenState();
}

class _CategoryProductDetailsScreenState
    extends State<CategoryProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
                  ImageSlider(images: product['images']),

                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['brand'],
                        maxLines: 1,
                        style: AppTextStyle.textBlack16w400,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(LucideIcons.share, size: 18),
                      ),
                    ],
                  ),

                  Text(
                    product['title'],
                    maxLines: 1,
                    style: AppTextStyle.text55Grey16w400,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\$ ${product['price'].toString()}",
                    maxLines: 1,
                    style: AppTextStyle.textPrimary18w400,
                  ),

                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Text("Colors", style: AppTextStyle.text55Grey12w400),
                          Wrap(
                            spacing: 5,
                            children: (product['colors'] as List<String>).map((
                              clr,
                            ) {
                              final colorValue = int.parse(
                                clr.toString().replaceAll('#', ''),
                                radix: 16,
                              );
                              return Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.bodyGrey33Color,
                                    width: 0.5,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF000000 + colorValue),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Text("Size", style: AppTextStyle.text55Grey12w400),
                          Wrap(
                            spacing: 5,
                            children: (product['sizes'] as List<String>)
                                .map(
                                  (s) => Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.bodyGrey33Color,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        s,
                                        style: AppTextStyle.text55Grey12w400,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
            
            Container(
              height: 70,
              padding: EdgeInsets.only(left: 15, right: 25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.blackColor,
                shape: BoxShape.rectangle,
              ), child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 15,
                  children: [
                    Icon(LucideIcons.plus, color: AppColors.whiteColor, size: 24,),
                    Text("Add to Basket".toUpperCase(), style: AppTextStyle.textWhite14w400,)
                  ],
                ),
                Icon(LucideIcons.heart, color: AppColors.whiteColor, size: 24,),
              ],
            ),
            ),

            SizedBox(height: 12,),

            Padding(
              padding: EdgeInsets.all(16), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("MATERIALS".toUpperCase(), style: AppTextStyle.textBlack14w400,),
                SizedBox(height: 10,),
                Text(product['materials'], style: AppTextStyle.textBlack14w400,),
                SizedBox(height: 22,),
                Text("CARE".toUpperCase(), style: AppTextStyle.textBlack14w400,),
                SizedBox(height: 10,),
                Text(product['care'], style: AppTextStyle.textBlack14w400,),
                SizedBox(height: 22,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (product['careIcons'] as List).map<Widget>((care) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            getCareIcon(care['icon']),
                            size: 22,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            care['label'],
                            style: AppTextStyle.textBlack14w400,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 22,),
                Text("Info".toUpperCase(), style: AppTextStyle.textBlack14w400,),
                PolicySection(product: product),
                SizedBox(height: 30),
                Center(child: HeadlineText(text: "You may also like")),
                SizedBox(height: 10),
                CustomDivider(width: 50),
                SizedBox(height: 30),
                GridView.builder(

                  key: const ValueKey('grid'),
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.59,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: productCategoryList.reversed.take(4).length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CategoryGridCard(
                      img: productCategoryList.reversed.toList()[index]['images'][0],
                      brand: productCategoryList.reversed.toList()[index]['brand'],
                      title: productCategoryList.reversed.toList()[index]['title'],
                      price: productCategoryList.reversed.toList()[index]['discountPrice']
                          .toString(),
                      onPress: () {
                        Navigator.of(context).pushNamed("/category_items_details",
                            arguments: productCategoryList.reversed.toList()[index]);
                      },
                    );
                  },
                )

              ],
            ),),
            SizedBox(height: 22,),
            Footer(),

          ],
        ),
      ),
    );
  }

  IconData getCareIcon(String iconKey) {
    switch (iconKey) {
      case 'no_bleach':
        return Icons.do_not_touch;
      case 'no_tumble_dry':
        return Icons.dry_cleaning;
      case 'dry_clean':
        return Icons.local_laundry_service;
      case 'iron':
        return Icons.iron;
      default:
        return Icons.info_outline;
    }
  }

}
