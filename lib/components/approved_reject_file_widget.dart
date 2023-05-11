import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'approved_reject_file_model.dart';
export 'approved_reject_file_model.dart';

class ApprovedRejectFileWidget extends StatefulWidget {
  const ApprovedRejectFileWidget({
    Key? key,
    this.bookdital,
  }) : super(key: key);

  final DocumentReference? bookdital;

  @override
  _ApprovedRejectFileWidgetState createState() =>
      _ApprovedRejectFileWidgetState();
}

class _ApprovedRejectFileWidgetState extends State<ApprovedRejectFileWidget> {
  late ApprovedRejectFileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApprovedRejectFileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryText,
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: StreamBuilder<DataRecord>(
          stream: DataRecord.getDocument(widget.bookdital!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              );
            }
            final rowDataRecord = snapshot.data!;
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    final dataUpdateData = createDataRecordData(
                      bookstatus: 'approved',
                    );
                    await widget.bookdital!.update(dataUpdateData);
                    await actions.notifications(
                      rowDataRecord.booktitle!,
                      rowDataRecord.bookcover,
                    );

                    context.pushNamed('HomePage_Admin');
                  },
                  text: FFLocalizations.of(context).getText(
                    '988rdd1j' /* Approved */,
                  ),
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF39EF6A),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await widget.bookdital!.delete();

                    context.pushNamed('HomePage_Admin');
                  },
                  text: FFLocalizations.of(context).getText(
                    'ojk1y3tb' /* Reject */,
                  ),
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF232323),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
