import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/add_post/widgets/add_post_button.dart';
import 'package:projects_template/views/add_post/widgets/description_form_field.dart';
import 'package:projects_template/views/add_post/widgets/post_subject_form_field.dart';
import 'package:projects_template/views/add_post/widgets/upload_image_button.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';

class AddPostForm extends StatelessWidget {
  const AddPostForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 36.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostSubjectFormField(),
          const HeightBox(12),
          DescriptionFormField(),
          const HeightBox(27),
          UploadImageButton(),
          const HeightBox(33),
          const AddPostButton()
        ],
      ),
    );
  }
}
