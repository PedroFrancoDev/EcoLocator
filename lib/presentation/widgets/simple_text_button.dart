import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SimpleTextButton extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final bool isEnabled;
  final bool isLoading;
  final String label;
  final TextStyle? labelStyle;
  final ThemeMode themeMode;
  final OutlinedBorder? shape;
  final bool isExpanded;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? icon;
  final BorderRadius? borderRadius;
  final Alignment iconAlignment;
  final double fontSize;
  final bool otpLoading;
  final double? iconSize;

  const SimpleTextButton({
    super.key,
    this.fontSize = 16,
    required this.onPressed,
    required this.label,
    this.otpLoading = false,
    this.isEnabled = true,
    this.labelStyle,
    this.isLoading = false,
    this.themeMode = ThemeMode.light,
    this.shape,
    this.isExpanded = true,
    this.padding,
    this.margin,
    this.borderRadius,
    this.icon,
    this.iconSize,
    this.iconAlignment = Alignment.centerLeft,
  });

  @override
  State<SimpleTextButton> createState() => _SimpleTextButtonState();
}

class _SimpleTextButtonState extends State<SimpleTextButton> {
  late bool _isLoading;

  bool get isDarkTheme => widget.themeMode == ThemeMode.dark;

  @override
  void initState() {
    _isLoading = widget.isLoading;
    super.initState();
  }

  bool _isEnable() => widget.isEnabled && widget.onPressed != null;

  Future<void> _onPressed() async {
    try {
      setState(() => _isLoading = true);
      await widget.onPressed!();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() => _isLoading = false);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      // height: 56,
      margin: widget.margin,
      width: widget.isExpanded ? double.maxFinite : null,
      child: IgnorePointer(
        ignoring: _isLoading,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: widget.isEnabled
                ? Color(0XFF2E7D32)
                : Color(0XFF2E7D32).withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent, width: 1),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(14),
            ),
            padding:
                widget.padding ??
                EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
          onPressed: _isEnable() ? () async => await _onPressed() : null,
          child: getChild(),
        ),
      ),
    );
  }

  Widget getChild() {
    if (_isLoading || widget.otpLoading) {
      return AppLoading(color: Colors.white, size: 20);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null &&
            widget.iconAlignment == Alignment.centerLeft) ...[
          SvgPicture.asset(
            widget.icon ?? "",
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: widget.iconSize,
            height: widget.iconSize,
          ),
          SizedBox(height: 10),
        ],
        Text(
          widget.label,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        if (widget.icon != null &&
            widget.iconAlignment == Alignment.centerRight) ...[
          SizedBox(height: 10),
          SvgPicture.asset(
            widget.icon ?? "",
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: widget.iconSize,
            height: widget.iconSize,
          ),
        ],
      ],
    );
  }
}

class AppLoading extends StatelessWidget {
  final double size;
  final Color? color;
  const AppLoading({this.color, super.key, this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.white),
        ),
      ),
    );
  }
}
