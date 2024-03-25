part of '../form.dart';

class _UploadContainer extends StatefulWidget {
  @override
  _UploadContainerState createState() => _UploadContainerState();
}

class _UploadContainerState extends State<_UploadContainer> {
  File? _image;

  Future getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(
                        Icons.photo_library_outlined,
                        color: ColorManager.blackTextColor,
                      ),
                      title:
                          Text(Strings.gallery.tr(), style: AppTextStyle.h3),
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.photo_camera_outlined,
                        color: ColorManager.blackTextColor,
                      ),
                      title:
                          Text(Strings.camera.tr(), style: AppTextStyle.h3),
                      onTap: () {
                        getImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
        child: Stack(
          children: [
            Container(
              height: 100.h,
              width: 1.sw,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.primaryColor.withOpacity(.5),
                  width: 1.w,
                ),
                color: ColorManager.primaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
              ),
              child: _image == null
                  ? Column(
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
                    )
                  : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  ),
                  child: Image.file(_image!)),
            ),
            if (_image != null)
              Positioned(
                right: 0,
                child: IconButton(
                  icon: CircleAvatar(
                      radius: 10.r,
                      backgroundColor:
                          ColorManager.primaryColor.withOpacity(.5),
                      child: Icon(
                        Icons.close,
                        color: ColorManager.whiteTextColor,
                        size: 15.sp,
                      )),
                  onPressed: () {
                    setState(() {
                      _image = null;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
