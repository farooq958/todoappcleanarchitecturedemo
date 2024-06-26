
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/colors_pallete.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';


class CustomTextFieldWithOnTap extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color? filledColor;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool isValid;
  final bool isBorderRequired;
  final String? titleText;
  final int? maxline;
  final TextStyle? hintStyle;
  final String? validateText;
  final bool? isShadowRequired;
  final Color? titleTextColor;
  final double? suffixWidth;
  final double? suffixHeight;
  final ValueChanged? onChanged;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Color? hintTextColor;
  final double? height;
  final bool? isState;

  final EdgeInsets? contentPadding;

  const CustomTextFieldWithOnTap(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      required this.textInputType,
      this.suffixIcon,
      this.validator,
      this.prefixIcon,
      this.isValid = false,
      this.isBorderRequired = true,
      this.titleText = "",
      this.maxline = 1,
      this.validateText,
      this.isShadowRequired = false,
      this.titleTextColor = AppColors.blackColor,
      this.suffixWidth = 15,
      this.suffixHeight = 15,
      this.onChanged,
      this.contentPadding,
      this.onTap,
      this.readOnly,
      this.focusNode,
      this.hintTextColor,
      this.borderRadius,
      this.height,
      this.filledColor,
      this.hintStyle,
      this.isState});

  final double? borderRadius;

  @override
  State<CustomTextFieldWithOnTap> createState() =>
      _CustomTextFieldWithOnTapState();
}

bool isHide = true;

class _CustomTextFieldWithOnTapState extends State<CustomTextFieldWithOnTap> {
  @override
  Widget build(BuildContext context) {
    // print(Data().textScale);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.titleText!.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: AppText(
                        widget.titleText!,
                        style: Styles.circularStdMedium(
                          context,
                          fontSize: 16,
                          color: widget.titleTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8  ,
                    )
                  ],
                )
              : Container(),
          Container(
            height: null,
            width: MediaQuery.sizeOf(context).width * 0.9 - 8,
            decoration: const BoxDecoration(
            //  boxShadow: widget.isShadowRequired! ? [AppShadow.normal()] : [],
              //border:Border.all(color: AppColors.lightGreyColor)
              // borderRadius: BorderRadius.circular(),
            ),
            child: TextFormField(
              onTap: widget.onTap,
              readOnly: widget.readOnly ?? false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              //scribbleEnabled: true,
              focusNode: widget.focusNode,

              //autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator ??
                  (v) {
                    if (v!.isEmpty) {
                      return widget.validateText;
                    }
                    return null;
                  },
              onChanged: widget.onChanged,
              keyboardType: widget.textInputType,
              obscureText: widget.isState != null ? isHide : widget.obscureText,
              controller: widget.controller,
              maxLines: widget.maxline,
              style: Styles.circularStdRegular(context,
                  fontSize: Data().textScale > 1.0 ? 12 : 16,
                  fontWeight: FontWeight.w400),
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                fillColor: widget.filledColor ?? AppColors.whiteColor,
                filled: true,
                hintText: widget.hintText,
                helperStyle: widget.hintStyle ??
                    Styles.circularStdRegular(context, fontSize: 16),

                prefixIcon: widget.prefixIcon != null
                    ? SizedBox(
                        width: 15,
                        height: 15,
                        child: Center(
                          child: widget.prefixIcon,
                        ),
                      )
                    : null,
                suffixIcon: widget.isState != null
                    ? GestureDetector(
                        onTap: () {
                          //isHide=true;
                          if (isHide == true) {
                            isHide = false;
                          } else {
                            isHide = true;
                          }
                          setState(() {});
                        },
                        child: SizedBox(
                            width: widget.suffixWidth ?? 20,
                            height: widget.suffixHeight ?? 20,
                            ))
                    : widget.suffixIcon != null
                        ? SizedBox(
                            width: widget.suffixWidth ?? 20,
                            height: widget.suffixHeight ?? 20,
                            child: Center(
                              child: widget.suffixIcon,
                            ),
                          )
                        : null,
                hintStyle: Styles.circularStdRegular(context,
                    color: FocusScope.of(context).hasFocus
                        ? widget.hintTextColor
                        : AppColors.greyColor,
                    fontSize: Data().textScale > 1.0 ? 12 : 15,
                    fontWeight: FontWeight.normal),

                ///changess
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(
                      vertical: 13,
                      horizontal: 12,
                    ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 12,
                  ),
                  borderSide: BorderSide(
                    color: widget.isBorderRequired
                        ? Colors.red
                        : Colors.transparent,
                  ),
                ),
                errorBorder: widget.isBorderRequired
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0.4,
                        ),
                      )
                    : outlineInputBorder(),
                border: widget.isBorderRequired
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12,
                        ),
                        borderSide: const BorderSide(
                            width: 0.4, color: AppColors.lightGreyColor))
                    : outlineInputBorder(),
                focusedBorder: widget.isBorderRequired
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12 ,
                        ),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                          width: 0.4  ,
                        ),
                      )
                    : outlineInputBorder(),
                enabledBorder: widget.isBorderRequired
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12 ,
                        ),
                        borderSide: const BorderSide(
                          width: 0.4  ,
                          color: AppColors.lightGreyColor,
                        ),
                      )
                    : outlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12 ),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}

class CustomTextFieldWithOnTap2 extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool isValid;
  final bool isBorderRequired;
  final String? titleText;
  final int? maxline;
  final String? validateText;
  final bool? isShadowRequired;
  final Color? titleTextColor;
  final double? suffixWidth;
  final double? suffixHeight;
  final ValueChanged? onChanged;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Color? hintTextColor;
  final double? height;

  final EdgeInsets? contentPadding;

  const CustomTextFieldWithOnTap2(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      required this.textInputType,
      this.suffixIcon,
      this.validator,
      this.prefixIcon,
      this.isValid = false,
      this.isBorderRequired = true,
      this.titleText = "",
      this.maxline = 1,
      this.validateText,
      this.isShadowRequired = false,
      this.titleTextColor = AppColors.blackColor,
      this.suffixWidth = 15,
      this.suffixHeight = 15,
      this.onChanged,
      this.contentPadding,
      this.onTap,
      this.readOnly,
      this.focusNode,
      this.hintTextColor,
      this.borderRadius,
      this.height});

  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    // print(Data().textScale);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText!.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3) ,
                      child: AppText(
                        titleText!,
                        style: Styles.circularStdMedium(
                          context,
                          fontSize: 16  ,
                          color: titleTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8  ,
                    )
                  ],
                )
              : Container(),
          Expanded(
            child: Container(
              // decoration: BoxDecoration(
              //   boxShadow: isShadowRequired! ? [AppShadow.normal()] : [],
              //   // borderRadius: BorderRadius.circular(),
              // ),
              child: TextFormField(
                onTap: onTap,
                readOnly: readOnly ?? false,
                focusNode: focusNode,

                //autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: isValid
                    ? (v) {
                        if (v!.trim().isEmpty) {
                          return validateText;
                        }
                        return null;
                      }
                    : validator,
                onChanged: onChanged,
                keyboardType: textInputType,
                obscureText: obscureText,
                controller: controller,
                maxLines: maxline,
                style: Styles.circularStdRegular(
                  context,
                ),
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  fillColor: AppColors.whiteColor,
                  filled: true,
                  hintText: hintText,

                  prefixIcon: prefixIcon != null
                      ? SizedBox(
                          width: 15,
                          height: 15,
                          child: Center(
                            child: prefixIcon,
                          ),
                        )
                      : null,
                  suffixIcon: suffixIcon != null
                      ? SizedBox(
                          width: suffixWidth ?? 20  ,
                          height: suffixHeight ?? 20  ,
                          child: Center(
                            child: suffixIcon,
                          ),
                        )
                      : null,
                  hintStyle: Styles.circularStdRegular(context,
                      color: FocusScope.of(context).hasFocus
                          ? hintTextColor
                          : AppColors.greyColor,
                      fontSize: Data().textScale > 1.0 ? 12   : 16  ,
                      fontWeight: FontWeight.w400),

                  ///changess
                  contentPadding: contentPadding ??
                      const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 5,
                      ) ,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      borderRadius ?? 12 ,
                    ),
                    borderSide: BorderSide(
                      color: isBorderRequired ? Colors.red : Colors.transparent,
                    ),
                  ),
                  errorBorder: isBorderRequired
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            borderRadius ?? 12 ,
                          ),
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                        )
                      : outlineInputBorder(),
                  border: isBorderRequired
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            borderRadius ?? 12 ,
                          ),
                        )
                      : outlineInputBorder(),
                  focusedBorder: isBorderRequired
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            borderRadius ?? 12 ,
                          ),
                          borderSide: const BorderSide(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : outlineInputBorder(),
                  enabledBorder: isBorderRequired
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            borderRadius ?? 12 ,
                          ),
                          borderSide: const BorderSide(
                            color: AppColors.lightGreyColor,
                          ),
                        )
                      : outlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 12 ),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
