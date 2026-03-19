import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_fashion/core/color/colors.dart';

class AppTextStyle {

  static final bodyText40w700 = GoogleFonts.bodoniModa(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    color: AppColors.bodyGrey33Color.withAlpha(150),
    height: 1
  );

  static final textWhite16w400 = GoogleFonts.tenorSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  static final logo = GoogleFonts.playfairDisplay(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
    height: 0.8,
  );

  static final text33Grey16w400 = GoogleFonts.tenorSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyGrey33Color,
  );

  static final textBlack16w400 = GoogleFonts.tenorSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );

  static final text55Grey12w400 = GoogleFonts.tenorSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.divider55Color,
  );





}