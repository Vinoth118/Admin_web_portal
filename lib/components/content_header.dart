import 'package:admin_web_portal/components/search_bar.dart';
import 'package:flutter/material.dart';

import 'filter_and_sort.dart';
class XContentHeader extends StatelessWidget {
  const XContentHeader({Key key, this.filterAndSort = false, this.searchHintText}) : super(key: key);

  final bool filterAndSort;
  final String searchHintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20,),
        XSearchBar(hintText: searchHintText != null ? searchHintText : null,),
        SizedBox(width: 20,),
        filterAndSort? XFilterAndSort() : SizedBox(),
      ],
    );
  }
}
