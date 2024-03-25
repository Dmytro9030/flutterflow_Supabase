import '/flutter_flow/flutter_flow_util.dart';
import 'field_item_widget.dart' show FieldItemWidget;
import 'package:flutter/material.dart';

class FieldItemModel extends FlutterFlowModel<FieldItemWidget> {
  ///  Local state fields for this component.

  List<String> itemList = [];
  void addToItemList(String item) => itemList.add(item);
  void removeFromItemList(String item) => itemList.remove(item);
  void removeAtIndexFromItemList(int index) => itemList.removeAt(index);
  void insertAtIndexInItemList(int index, String item) =>
      itemList.insert(index, item);
  void updateItemListAtIndex(int index, Function(String) updateFn) =>
      itemList[index] = updateFn(itemList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
