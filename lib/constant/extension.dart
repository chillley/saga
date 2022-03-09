import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

extension NullableStringExt on String? {
  toast() async {
    SmartDialog.showToast(this!);
  }

  loading() async {
    SmartDialog.showLoading(msg: this!);
  }
}
