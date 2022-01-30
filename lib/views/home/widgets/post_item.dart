import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/entities/post/post.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/home/widgets/icon_with_number.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/convertors.dart';
import 'package:projects_template/views/utils/textstyles.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePostItem extends StatelessWidget {
  final PostEntity post;
  final CategoryEntity category;
  late   String dateString;
   HomePostItem({Key? key, required this.post, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
     dateString = timeago.format(post.date, locale: 'ar');
    dateString = Convertors.convertToArabicNumbers(dateString);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(10.w),
          child: SizedBox(
            height: 340.h,
            child: Column(
              children: [
                const HeightBox(20),
                headerRow(),
                const HeightBox(20),
                image(context),
                const HeightBox(10),
                text(),
                const HeightBox(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120.w,
                      padding: EdgeInsets.only(top: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const WidthBox(10),
                          HomeIconAndNumber(
                              Icons.rate_review_sharp, post.reviews.length),
                          HomeIconAndNumber(
                              Icons.comment, post.comments.length),
                          HomeIconAndNumber(Icons.favorite, post.likes.length),
                        ],
                      ),
                    ),
                    Container(
                      width: 110.w,
                      height: 25.h,
                      color: AppColors.green,
                      child: Center(
                          child: PrimaryTextSemiBold(
                        text: 'فرع ${category.name}',
                        fontSize: 11,
                        color: AppColors.white,
                      )),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget headerRow() {
    return Row(
      children: [
        const WidthBox(20),
        PrimaryTextMedium(
          text: dateString,
          fontSize: 9,
          color: Colors.grey,
        ),
        const Spacer(),
        PrimaryTextMedium(
          text: post.posterName,
          fontSize: 14,
          color: AppColors.green,
        ),
        const WidthBox(15),
        SizedBox(
          width: 40.w,
          height: 40.h,
          child: CircleAvatar(
            backgroundImage: NetworkImage(post.posterImageUrl),
          ),
        ),
        const WidthBox(25),
      ],
    );
  }

  Widget image(BuildContext context) {
    return Container(
      height: 170.h,
      width: 330.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.w),
      ),
      child: Image.network(
        post.imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget text() {
    return SizedBox(
      height: 30.h,
      width: 300.w,
      child: PrimaryTextLight(
        text: post.description,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
