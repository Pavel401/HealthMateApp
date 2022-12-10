import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/Screens/Auth/constants.dart';
import 'package:medica/Screens/Auth/widgets/widgets.dart';
import 'package:medica/Screens/Profile/sub%20pages/controller/addTimelineController.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:simple_chips_input/simple_chips_input.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sizer/sizer.dart';

class AddTimeLine extends StatefulWidget {
  AddTimeLine({super.key});

  @override
  State<AddTimeLine> createState() => _AddTimeLineState();
}

class _AddTimeLineState extends State<AddTimeLine> {
  AddTimeLineController addTimeLineController =
      Get.put(AddTimeLineController());
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: HealthMateColors.happyGreen,
        title: Text(
          "Track your medical visit",
          style: context.heading1.copyWith(
            color: HealthMateColors.shyGreen,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Track your medical visit",
            //       style: context.heading1.copyWith(
            //         fontWeight: FontWeight.bold,
            //         color: HealthMateColors.shyGrey,
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Doctor",
              style: context.heading2.copyWith(
                fontWeight: FontWeight.bold,
                color: HealthMateColors.shyGrey,
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                controller: addTimeLineController.doctorController,
                cursorColor: kPrimaryColor,
                validator: (password) {},
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: "Doctor",
                    hintStyle: TextStyle(fontFamily: 'OpenSans'),
                    // suffixIcon: InkWell(
                    //   onTap: () {},
                    //   child: Icon(
                    //     Icons.visibility,
                    //     color: kPrimaryColor,
                    //   ),
                    // ),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Hospital",
              style: context.heading2.copyWith(
                fontWeight: FontWeight.bold,
                color: HealthMateColors.shyGrey,
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                controller: addTimeLineController.hospitalController,
                cursorColor: kPrimaryColor,
                validator: (password) {},
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.place,
                      color: kPrimaryColor,
                    ),
                    hintText: "Sakra",
                    hintStyle: TextStyle(fontFamily: 'OpenSans'),
                    // suffixIcon: InkWell(
                    //   onTap: () {},
                    //   child: Icon(
                    //     Icons.visibility,
                    //     color: kPrimaryColor,
                    //   ),
                    // ),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Type",
              style: context.heading2.copyWith(
                fontWeight: FontWeight.bold,
                color: HealthMateColors.shyGrey,
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                controller: addTimeLineController.typeController,
                cursorColor: kPrimaryColor,
                validator: (password) {},
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.type_specimen,
                      color: kPrimaryColor,
                    ),
                    hintText: "Type",
                    hintStyle: TextStyle(fontFamily: 'OpenSans'),
                    // suffixIcon: InkWell(
                    //   onTap: () {},
                    //   child: Icon(
                    //     Icons.visibility,
                    //     color: kPrimaryColor,
                    //   ),
                    // ),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Problem",
              style: context.heading2.copyWith(
                fontWeight: FontWeight.bold,
                color: HealthMateColors.shyGrey,
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                controller: addTimeLineController.commentController,
                cursorColor: kPrimaryColor,
                validator: (password) {},
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: "Doctor",
                    hintStyle: TextStyle(fontFamily: 'OpenSans'),
                    border: InputBorder.none),
              ),
            ),
            Text(
              "Add Drugs prescribed",
              style: context.heading2.copyWith(
                fontWeight: FontWeight.bold,
                color: HealthMateColors.shyGrey,
              ),
            ),
            SimpleChipsInput(
              separatorCharacter: ",",
              focusNode: focusNode,
              // validateInput: true,
              autoFocus: true,
              // textFormFieldStyle: context.caption,
              // validateInputMethod: (String value) {
              //   final phoneNumberRegExp =
              //       RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
              //   if (!phoneNumberRegExp.hasMatch(value)) {
              //     return 'Enter a valid phone number';
              //   }
              // },
              onSubmitted: (drug) {
                addTimeLineController.drugs.add(drug);
                print(addTimeLineController.drugs);
              },
              onChipDeleted: (p0, p1) {
                addTimeLineController.drugs.removeAt(p1);
                print(addTimeLineController.drugs);
              },
              onSaved: ((drug) {
                addTimeLineController.drugs.add(drug);
                print(addTimeLineController.drugs);
              }),
              chipTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              deleteIcon: Icons.delete,
              deleteIconColor: Colors.black,
              widgetContainerDecoration: BoxDecoration(
                color: HealthMateColors.bgColor,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: HealthMateColors.dullGrey),
              ),
              chipContainerDecoration: BoxDecoration(
                color: HealthMateColors.happyGreen,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(50),
              ),
              placeChipsSectionAbove: false,
            ),

            SizedBox(
              height: 2.h,
            ),
            // assets != null && assets!.length > 0
            //     ? Image(
            //         fit: BoxFit.cover,
            //         height: 20.h,
            //         width: 100.w,
            //         image:
            //             AssetEntityImageProvider(assets![0], isOriginal: true))
            // : SizedBox(),
            OutlinedButton.icon(
              onPressed: () {
                // pickMedia();
                imagePicker(ImageSource.gallery);
              },
              label: Text('Upload reports'),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(Icons.upload),
            ),
            RoundedButton(
                text: 'Upload Data',
                press: () async {
                  // print(addTimeLineController.drugs.toSet());
                  if (addTimeLineController.doctorController.text.isNotEmpty ||
                      addTimeLineController
                          .hospitalController.text.isNotEmpty ||
                      addTimeLineController.typeController.text.isNotEmpty ||
                      addTimeLineController.commentController.text.isNotEmpty ||
                      addTimeLineController.drugs.isNotEmpty) {
                    // addTimeLineController.uploadFile(assets![0].file);

                    // returns url pointing to S3 file
                    // Future<File?> originFile = assets![0].originFile; // Original files.

                    // SimpleS3 _simpleS3 = SimpleS3();
                    // String result = await _simpleS3.uploadFile(
                    //   originFile,
                    //   "bucketName",
                    //   "poolID",
                    //   AWSRegions.apSouth1,
                    // );

                    final cloudinary = Cloudinary.full(
                      apiKey: "373438153978379",
                      apiSecret: "bv1GrPNPWuK1dZX-zLz7tRuhDwo",
                      cloudName: "dc0tfxkph",
                    );
                    //upload data
                    final response = await cloudinary
                        .uploadResource(CloudinaryUploadResource(
                            filePath: image!.path,
                            fileBytes: File(image!.path).readAsBytesSync(),
                            resourceType: CloudinaryResourceType.image,
                            folder: "Files",
                            fileName: image!.path.toString() + "Hackathon",
                            progressCallback: (count, total) {
                              print(
                                  'Uploading image from file with progress: $count/$total');
                            }));
                    if (response.statusCode == 200) {
                      addTimeLineController
                          .getallData(response.secureUrl.toString());
                    }
                    // print(response.statusCode==200){};
                  } else {
                    final snackBar = SnackBar(
                      /// need to set following properties for best effect of awesome_snackbar_content
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Fill all details',
                        message: 'Make sure you are adding all requested data',

                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.failure,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                }),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }

  //profile page image picker
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  File? imageTemporary;
  File? mediaTemporary;
  Future imagePicker(ImageSource source) async {
    try {
      image = await _picker.pickImage(source: source);
      if (image == null) {
        return;
      }
      setState(() {
        imageTemporary = File(image!.path);
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // void pickMedia() async {
  //   const AssetPickerTextDelegate textDelegate = AssetPickerTextDelegate();

  //   assets = await AssetPicker.pickAssets(
  //     context,
  //     pickerConfig: AssetPickerConfig(
  //       pickerTheme: AssetPicker.themeData(
  //         HealthMateColors.happyGreen,
  //         light: true,
  //       ),

  //       //maximum media limit
  //       maxAssets: 1,
  //       //gridCount: 3,
  //       requestType: RequestType.image,
  //       selectedAssets: assets,
  //       specialItemPosition: SpecialItemPosition.prepend,
  //       specialItemBuilder: (
  //         BuildContext context,
  //         AssetPathEntity? path,
  //         int length,
  //       ) {
  //         if (path?.isAll != true) {
  //           return null;
  //         }
  //         return Semantics(
  //           label: textDelegate.sActionUseCameraHint,
  //           button: true,
  //           onTapHint: textDelegate.sActionUseCameraHint,
  //           maxValueLength: 1,
  //           child: GestureDetector(
  //             behavior: HitTestBehavior.opaque,
  //             onTap: () async {
  //               final AssetEntity? result = await _pickFromCamera(context);
  //               if (result == null) {
  //                 return;
  //               }
  //               final AssetPicker<AssetEntity, AssetPathEntity> picker =
  //                   context.findAncestorWidgetOfExactType()!;
  //               final DefaultAssetPickerBuilderDelegate builder =
  //                   picker.builder as DefaultAssetPickerBuilderDelegate;
  //               final DefaultAssetPickerProvider p = builder.provider;
  //               await p.switchPath(
  //                 PathWrapper<AssetPathEntity>(
  //                   path: await p.currentPath!.path.obtainForNewProperties(),
  //                 ),
  //               );
  //               p.selectAsset(result);
  //             },
  //             child: const Center(
  //               child: Icon(Icons.camera_alt_outlined, size: 42.0),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  //   if (assets == null) return;
  //   print(assets!.length);
  //   setState(() {});
  // }

  // Future<AssetEntity?> _pickFromCamera(BuildContext c) {
  //   return CameraPicker.pickFromCamera(
  //     c,
  //     pickerConfig: const CameraPickerConfig(
  //         textDelegate: EnglishCameraPickerTextDelegate(),
  //         enableRecording: false,
  //         enablePinchToZoom: true),
  //   );
  // }

  // List<AssetEntity>? assets = [];
}
