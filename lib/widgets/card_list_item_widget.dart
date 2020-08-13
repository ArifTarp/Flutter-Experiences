import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardListItemWidget extends StatelessWidget {
  const CardListItemWidget({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.subtitle,
    @required this.onPress,
  }) : super(key: key);

  final String title;
  final IconButton icon;
  final Text subtitle;
  final VoidCallback onPress;
  final double _textSize = 40;

  @override
  Widget build(BuildContext context) {
    // Initialize
    ScreenUtil.init(context, width: 350, height: 750);
    return Container(
      // we can use for dynamic layout
      // height: MediaQuery.of(context).size.height * 1 / 6,
      width: ScreenUtil().setWidth(350),
      height: ScreenUtil().setHeight(140),
      child: Card(
        child: ListTile(
          leading: FlutterLogo(
            size: 72.0,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: ScreenUtil().setSp(_textSize)),
          ),
          trailing: icon,
          subtitle: subtitle,
          onTap: onPress,
        ),
      ),
    );
  }
}
