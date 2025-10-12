import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_progress_hud.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/repos/images_repo/images_repo.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/repos/products_repo.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/widgets/is_organic_product.dart';
import 'package:gap/gap.dart';
// import 'package:path/path.dart';

import '../../../../../../../core/service/get_it_service.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_text_style.dart';
// import '../../../../../../../core/widgets/custom_check_box.dart';
// import '../../../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../../../core/widgets/custom_snack_bar.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../domain/entities/add_product_input_entity.dart';
import 'image_field.dart';
import 'is_feature_product.dart';

class DashBoardBody extends StatefulWidget {
  DashBoardBody({super.key});
  static const routName = 'dashBoardBody';

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productDiscreptionController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController expMonthController = TextEditingController();
  TextEditingController caloriesNumController = TextEditingController();
  TextEditingController unitAmountController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late bool isFeature = false;
  late bool isOrganic = false;
  File? fileImage;
  // String ?imageUrl;
  AddProductInputEntity? inputEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: appBarBuild(
          context,
          title: "اضافة بيانات",
        ),
        body: BlocProvider(
            create: (context) => DashBoardCubit(
                  getIt<ImagesRepo>(),
                  getIt<ProductsRepo>(),
                ),
            child: BlocConsumer<DashBoardCubit, DashBoardStates>(
              listener: (context, state) {
                if (state is AddProductSuccessState) {
                  customSuccessBar(context, "تم اضافة المنتج بنجاح");
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pop(context);
                  });
                }
                if (state is AddProductErrorState) {
                  customSnackBar(context, state.errorMsg);
                }
              },
              builder: (context, state) {
                var cubit = DashBoardCubit.get(context);
                return CustomProgressHud(
                  isLoading: state is DashBoardLoadingState,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: autovalidateMode,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: hrAppPadding, vertical: vrAppPadding),
                      child: ListView(
                        children: [
                          CustomTextFormField(
                            hintText: "اسم المنتج",
                            keyboardType: TextInputType.name,
                            controller: productNameController,
                          ),
                          Gap(16),
                          CustomTextFormField(
                            hintText: "سعر المنتج",
                            keyboardType: TextInputType.number,
                            controller: productPriceController,
                          ),
                          Gap(16),
                          CustomTextFormField(
                            hintText: "كود المنتج",
                            keyboardType: TextInputType.number,
                            controller: productCodeController,
                            onSaved: (value) {
                              productCodeController.text = value!.toLowerCase();
                            },
                          ),
                          Gap(16),
                          CustomTextFormField(
                            hintText: "وصف المنتج",
                            keyboardType: TextInputType.name,
                            controller: productDiscreptionController,
                            maxLines: 4,
                          ),
                          Gap(16),
                          CustomTextFormField(
                            hintText: "صلاحية المنتج",
                            keyboardType: TextInputType.name,
                            controller: expMonthController,
                          ),
                          Gap(16),
                          CustomTextFormField(
                            hintText: "الكالوريز",
                            keyboardType: TextInputType.name,
                            controller: caloriesNumController,
                          ),
                          Gap(16),
                          CustomTextFormField(
                            hintText: "الوحدة",
                            keyboardType: TextInputType.name,
                            controller: unitAmountController,
                          ),
                          Gap(16),
                          ImageField(
                            onFileChanged: (image) {
                              setState(() {
                                fileImage = image;
                              });
                            },
                          ),
                          Gap(16),
                          //check box
                          IsFeatureProduct(
                            onChecked: (value) {
                              isFeature = value;
                              setState(() {});
                            },
                          ),
                          Gap(16),
                          IsOrganicProduct(
                            onChecked: (value) {
                              isOrganic = value;
                              setState(() {});
                            },
                          ),
                          Gap(16),
                          CustomButton(
                            buttonText: "اضافة المنتج",
                            onPressed: () {
                              if (fileImage != null) {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  inputEntity = AddProductInputEntity(
                                    productName: productNameController.text,
                                    productPrice: productPriceController.text,
                                    productCode: productCodeController.text,
                                    productDescription:
                                        productDiscreptionController.text,
                                    productImageFile: fileImage!,
                                    productisFeatured: isFeature,
                                    imageUrl: fileImage!.path,
                                    expMonth: expMonthController.text,
                                    calories: caloriesNumController.text,
                                    unitMount: unitAmountController.text,
                                    isOrganic: isOrganic,
                                    reviews: [],
                                  );
                                  cubit.addProducts(inputEntity!);
                                  // showSuccess(context);
                                  // Navigator.pop(context);
                                } else {
                                  setState(() {
                                    autovalidateMode = AutovalidateMode.always;
                                  });
                                }
                              } else {
                                showError(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.containerColor,
        content: Text(
          "يرجى اختيار صورة المنتج",
          style: AppTextStyle.bold13.copyWith(color: Colors.red),
        ),
      ),
    );
  }

  void showSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.containerColor,
        content: Text(
          "تم اضافة المنتج بنجاح",
          style: AppTextStyle.bold13.copyWith(color: Colors.green),
        ),
      ),
    );
  }
}
