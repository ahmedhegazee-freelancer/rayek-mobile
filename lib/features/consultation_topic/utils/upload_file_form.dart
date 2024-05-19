part of '../form.dart';

class _UploadFileForm extends StatefulWidget {
  const _UploadFileForm({Key? key}) : super(key: key);

  @override
  _UploadFileFormState createState() => _UploadFileFormState();
}

class _UploadFileFormState extends State<_UploadFileForm> {
  final List<FilePickerResult> _pickedFiles = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.consultationTopic.tr(),
              style: AppTextStyle.h1,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          heightOfTextField: 150.h,
          hasPrefix: false,
          maxLines: 5,
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Text(
              Strings.uploadFile.tr(),
              style: AppTextStyle.h1,
            ),
            SizedBox(width: 5.w),
            Text(
              "(${Strings.ifFound.tr()})",
              style: AppTextStyle.h4Grey,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        ..._pickedFiles.map((file) => ListTile(
              title: Text(file.files.single.name),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _pickedFiles.remove(file);
                  });
                },
              ),
            )),
        InkWell(
          onTap: () async {
            final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: [
                  'pdf',
                  'doc',
                  'docx',
                  'ppt',
                  'pptx',
                  'xls',
                  'xlsx',
                  'txt',
                  'jpg',
                  'jpeg',
                  'png'
                ]);
            try {
              if (result != null) {
                setState(() {
                  _pickedFiles.add(result);
                });
              }
            } catch (e) {
              debugPrint(e.toString());
            }
          },
          child: Container(
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
                  Strings.uploadFile.tr(),
                  style: AppTextStyle.h3,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5.h),
        // Text for supported file types
        Text(
          "PDF, DOC, DOCX, PPT, PPTX, XLS, XLSX, TXT, JPG, JPEG, PNG",
          style: AppTextStyle.h6,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
