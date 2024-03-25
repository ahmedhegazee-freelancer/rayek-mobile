part of'../form.dart';


class _UploadContainer extends StatefulWidget {
  @override
  _UploadContainerState createState() => _UploadContainerState();
}

class _UploadContainerState extends State<_UploadContainer> {
  Future<void>? _uploadFuture;

  Future<void> uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      // Image Profile
      child: GestureDetector(
        onTap: () {
          setState(() {
            _uploadFuture = uploadImage();
          });
        },
        child: FutureBuilder<void>(
          future: _uploadFuture,
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                baseColor: ColorManager.primaryColor.withOpacity(.1),
                highlightColor: ColorManager.primaryColor.withOpacity(.2),
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.primaryColor.withOpacity(.5),
                      width: 1.w,
                    ),
                    color: ColorManager.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  ),
                ),
              );
            } else {
              return Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.primaryColor.withOpacity(.5),
                    width: 1.w,
                  ),
                  color: ColorManager.primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        IconManager.uploadImage,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      Strings.uploadImage.tr(),
                      style: AppTextStyle.h3,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}