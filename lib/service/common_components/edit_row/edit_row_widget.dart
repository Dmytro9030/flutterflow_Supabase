import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service/equipment_pages/edit_equipmen/edit_equipmen_widget.dart';
import 'package:flutter/material.dart';
import 'edit_row_model.dart';
export 'edit_row_model.dart';

class EditRowWidget extends StatefulWidget {
  const EditRowWidget({
    super.key,
    this.equipmentId,
  });

  final int? equipmentId;

  @override
  State<EditRowWidget> createState() => _EditRowWidgetState();
}

class _EditRowWidgetState extends State<EditRowWidget> {
  late EditRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditRowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        FlutterFlowIconButton(
          borderColor: FlutterFlowTheme.of(context).primary,
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 40.0,
          fillColor: FlutterFlowTheme.of(context).accent1,
          icon: Icon(
            Icons.edit,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: EditEquipmenWidget(
                    equipmentId: widget.equipmentId,
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
        ),
        FlutterFlowIconButton(
          borderColor: FlutterFlowTheme.of(context).primary,
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 40.0,
          fillColor: FlutterFlowTheme.of(context).accent1,
          icon: Icon(
            Icons.delete,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: const Text('WARNING'),
                      content: const Text('Are you sure you want to delete this?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                ) ??
                false;
            if (confirmDialogResponse) {
              await EquipmentTable().delete(
                matchingRows: (rows) => rows.eq(
                  'id',
                  widget.equipmentId,
                ),
              );
            }
            _model.updatePage(() {});
          },
        ),
      ],
    );
  }
}
