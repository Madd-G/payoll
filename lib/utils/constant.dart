import 'package:intl/intl.dart';

class Constant {
  // regular = normal, small < regular < big
  static const double fontExtraSmall = 10.0;
  static const double fontSmall = 12.0;
  static const double fontSemiSmall = 14.0;
  static const double fontRegular = 15.0;
  static const double fontSemiRegular = 16.0;
  static const double fontSemiBig = 18.0;
  static const double fontBig = 20.0;
  static const double fontExtraBig = 28.0;
  static const double fontTitle = 24.0;

  static const int mainColor = 0xFF396EB0;
  static const int whiteBackground = 0xFFFAFAFA;
  static const int greyTextFieldLoginRegister = 0xFFF7F7F7;
  static const int greyTextField = 0xFFF6F6F6;
  static const int greyOutlineBorderTextField = 0xFFE9EBEF;
  static const int lineOr = 0xFFA9A9A9;
  static const int lineBottomSheet = 0xFFC5C5C5;
  static const int buttonResetBottomSheet = 0xFFF7F5FF;
  static const int textFilterPilihTanggal = 0xFF828282;

  static final oCcy = NumberFormat.currency(
      locale: 'id',
      customPattern: '\u00a4 #,### ',
      decimalDigits: 0,
      symbol: 'Rp');
}
