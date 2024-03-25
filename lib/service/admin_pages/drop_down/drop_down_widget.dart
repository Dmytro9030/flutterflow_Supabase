import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'drop_down_model.dart';
export 'drop_down_model.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    this.status,
    required this.commentId,
  });

  final String? status;
  final int? commentId;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late DropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropDownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??= widget.status,
        ),
        options: const ['Open', 'Closed'],
        onChanged: (val) async {
          setState(() => _model.dropDownValue = val);
          await CommentsTable().update(
            data: {
              'status': _model.dropDownValue,
            },
            matchingRows: (rows) => rows.eq(
              'id',
              widget.commentId,
            ),
          );
        },
        width: 300.0,
        height: 50.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium,
        hintText: 'Status',
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 2.0,
        borderColor: FlutterFlowTheme.of(context).alternate,
        borderWidth: 2.0,
        borderRadius: 8.0,
        margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
        hidesUnderline: true,
        isOverButton: true,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }
}
