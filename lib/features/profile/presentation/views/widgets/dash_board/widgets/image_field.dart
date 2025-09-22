import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../core/utils/app_colors.dart';

class ImageField extends StatefulWidget {
  const ImageField({
    super.key,
    required this.onFileChanged,
  });
  final ValueChanged<File?> onFileChanged;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          try {
            await pickImage();
          } on Exception catch (e) {
            setState(() {
              isLoading = false;
            });
            log("Exception in ImageField: ${e.toString()}");
          }
          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              // height: 100,
              decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(fileImage!),
                    )
                  : Icon(
                      Icons.image_outlined,
                      size: 180,
                    ),
            ),
            fileImage != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        fileImage = null;
                        widget.onFileChanged(fileImage);
                      });
                    },
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.red,
                      size: 30,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(image!.path);
    widget.onFileChanged(fileImage);
  }
}
