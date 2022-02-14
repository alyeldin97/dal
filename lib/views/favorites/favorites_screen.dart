import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/entities/post/comment.dart';
import 'package:projects_template/entities/post/like.dart';
import 'package:projects_template/entities/post/post.dart';
import 'package:projects_template/entities/post/reply.dart';
import 'package:projects_template/entities/post/review.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/favorites/widgets/favorite_post_item.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class FavoritesScreen extends StatelessWidget {
  final CategoryEntity category;
  const FavoritesScreen(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightBox(100),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 25.w),
            child: const PrimaryTextSemiBold(
              text: 'اعمالي المفضلة',
              fontSize: 20,
              color: AppColors.green,
            ),
          ),
          const HeightBox(20),
          const PrimaryTextLight(
            text: '        "استعن بالله ولا تعجز"',
            fontSize: 20,
            color: AppColors.green,
          ),
          Column(
            children: [
              FavoritePostItem(
                category: category,
                post: PostEntity(
                    id: '12',
                    address: 'address',
                    posterName: 'posterName',
                    posterId: 'posterId',
                    imageUrl: 'imageUrl',
                    categoryId: 'categoryId',
                    description: 'description',
                    likes: [
                      LikeEntity(
                          likerId: 'likerId',
                          imageUrl: 'imageUrl',
                          text: 'text',
                          name: 'name')
                    ],
                    comments: [
                      CommentEntity(
                          id: 'id',
                          commenterId: 'commenterId',
                          imageUrl: 'imageUrl',
                          text: 'text',
                          name: 'name',
                          reply: ReplyEntity(
                              replierId: 'replierId',
                              imageUrl: 'imageUrl',
                              text: 'text',
                              name: 'name'))
                    ],
                    reviews: [
                      ReviewEntity(
                          reviewerId: 'reviewerId',
                          imageUrl: 'imageUrl',
                          text: 'text',
                          name: 'name')
                    ],
                    posterImageUrl: 'posterImageUrl',
                    date: DateTime.now()),
              ),
            ],
            // children: state.posts
            //     .map((post) => FavoritePostItem(
            //           post: post,
            //           category: category,
            //         ))
            //     .toList(),
          ),
        ],
      ),
    );
  }
}
