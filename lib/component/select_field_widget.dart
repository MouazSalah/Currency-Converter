import 'package:cached_network_image/cached_network_image.dart';
import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:contactcars_app_retail/core/extensions/ext_images.dart';
import 'package:contactcars_app_retail/core/extensions/extensions.dart';
import 'package:contactcars_app_retail/db/shared/shared_pref.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectFieldWidget extends StatefulWidget {
  String? title;
  String? hint;
  String? name;
  dynamic logo;
  bool? showError;
  bool? isShowArrow;
  final VoidCallback onPressed;
  bool isIgnore;

  SelectFieldWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.name,
      required this.logo,
      required this.hint,
      this.isIgnore = false,
      this.isShowArrow,
      this.showError});

  @override
  State<SelectFieldWidget> createState() => _SelectFieldWidgetState();
}

class _SelectFieldWidgetState extends State<SelectFieldWidget> {
  @override
  Widget build(BuildContext buildContext) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              widget.title.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.ibmSemiBold,
                color: AppColors.colorBlue700,
              ),
            ),
          ),
          verticalSpace(6),
          Opacity(
            opacity: widget.isIgnore ? .5 : 1,
            child: IgnorePointer(
              ignoring: widget.isIgnore,
              child: InkWell(
                onTap: () => widget.onPressed.call(),
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.colorDarkBlue100,
                    ),
                    color: AppColors.colorWhite900,
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Row(
                    children: [
                      Visibility(
                        visible: widget.logo == null ? false : true,
                        child: Row(
                          children: [
                            if (widget.logo
                                is String) // Check if widget.logo is a String
                              CachedNetworkImage(
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                                imageUrl: getFullImageURL(widget.logo ?? "",
                                    size: ImageSize.Small),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            if (widget.logo is Widget) widget.logo as Widget,
                            horizontalSpace(6),
                          ],
                        ),
                      ),
                      Text(
                          widget.name != null
                              ? widget.name.toString()
                              : widget.hint.toString(),
                          style: TextStyle(
                              color: widget.name == null
                                  ? AppColors.colorDarkBlue400
                                  : AppColors.colorBlue800,
                              fontSize: 14,
                              fontFamily: widget.name == null
                                  ? AppFonts.ibmRegular
                                  : AppFonts.ibmBold)),
                      const Spacer(),
                      Visibility(
                        visible: widget.isShowArrow ?? true,
                        child: Transform.rotate(
                          angle: (SharedPref.getLang() == "en")
                              ? 180 * (3.14159 / 180)
                              : 0,
                          child: SizedBox(
                            width: 11,
                            height: 11,
                            child:
                                Image.asset("assets/icons/ic_arrow_left.png"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(6),
          Visibility(
            visible: widget.showError ?? false,
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "${'please_select'.tr()} ${widget.title}",
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontFamily: AppFonts.ibmRegular,
                    fontSize: 13,
                    color: AppColors.colorError500Base),
              ),
            ),
          )
        ],
      ),
    );
  }
}
