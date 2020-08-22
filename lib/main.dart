import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/advanced_http_view.dart';
import 'package:flutter_tutorial/views/advanced_stateful_view.dart';
import 'package:flutter_tutorial/views/color_filtered_and_selectable_text_view.dart';
import 'package:flutter_tutorial/views/cupertino_picker_view.dart';
import 'package:flutter_tutorial/views/dropdown_view.dart';
import 'package:flutter_tutorial/views/expansion_tile_and_list_view_view.dart';
import 'package:flutter_tutorial/views/file_management_view.dart';
import 'package:flutter_tutorial/views/form_view.dart';
import 'package:flutter_tutorial/views/hero_view.dart';
import 'package:flutter_tutorial/views/home_view.dart';
import 'package:flutter_tutorial/views/popup_and_wrap_and_chip_view.dart';
import 'package:flutter_tutorial/views/routing/card_informations_view.dart';
import 'package:flutter_tutorial/views/routing/detail_view.dart';
import 'package:flutter_tutorial/views/shared_preferences.dart';
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
        initialRoute: "/popupAndChipView",
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
          "/cardInformationsView": (context) => CardInformationsView(),
          "/detailView": (context) => DetailView(),
          "/heroView": (context) => HeroView(),
          "/dropdownView": (context) => DropDownView(),
          "/cupertinoPickerView": (context) => CupertinoPickerView(),
          "/sharedPereferencesView": (context) => SharedPreferencesView(),
          "/colorFilteredAndSelectableTextView": (context) => ColorFilteredAndSelectableTextView(),
          "/advancedStatefulView": (context) => AdvancedStatefulView(),
          "/popupAndChipView": (context) => PopupAndWrapAndChipView(),
        });
  }
}