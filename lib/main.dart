import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/advanced_http_view.dart';
import 'package:flutter_tutorial/views/expansion_tile_and_list_view_view.dart';
import 'package:flutter_tutorial/views/file_management_view.dart';
import 'package:flutter_tutorial/views/form_view.dart';
import 'package:flutter_tutorial/views/home_view.dart';
import 'package:flutter_tutorial/views/sliver_view.dart';
import 'package:flutter_tutorial/views/ui_base_view.dart';
import 'package:flutter_tutorial/views/html_parse_view.dart';
import 'package:flutter_tutorial/views/http_post_and_show_dialog_view.dart';
import 'package:flutter_tutorial/views/http_view.dart';
import 'package:flutter_tutorial/views/page_view.dart';
import 'package:flutter_tutorial/views/list_item_view.dart';
import 'package:flutter_tutorial/views/tabbar_view.dart';
import 'package:flutter_tutorial/widgets/stateless_widget.dart';
import 'package:flutter_tutorial/widgets/text_button_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        initialRoute: "/sliverView",
        routes: {
          "/": (context) => FormView(),
          "/home": (context) => AdvancedHttpView(),
          "/httpPostAndAlertDialog": (context) => HttpPostAndShowDialogView(),
          "/pageview": (context) => PageViewView(),
          "/expansionTileAndListViewView": (context) =>
              ExpansionTileAndListViewView(),
          "/htmlParseView": (context) => HtmlParseView(),
          "/fileManagementView": (context) => FileManagementView(),
          "/sliverView": (context) => SliverView(),
        });
  }
}
