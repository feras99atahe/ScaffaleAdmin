import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scaffale_admin/custom_code/actions/GetToken.dart';
import 'package:scaffale_admin/custom_code/actions/SendNotification.dart';


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
      alignment: AlignmentDirectional(0, 1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryText,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: StreamBuilder<DataRecord>(
          stream: DataRecord.getDocument(widget.bookdital!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
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
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final dataUpdateData = createDataRecordData(
                      bookstatus: 'approved',
                    );
                    await widget.bookdital!.update(dataUpdateData);
                    //sendPushMessage('New Book Arrive', rowDataRecord.booktitle!,list<String> tokens, imageUrl:rowDataRecord.bookcover!)

                    context.pushNamed('HomePage_Admin');
                  },
                  child: Container(
                    width: 130,
                    height: 40,
                    decoration:   BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [Color(0xFF00FE0D),Color(0xFF00D1FD) ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      //transform: GradientRotation(60),
                    ),
                  ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '045o7j94' /* Approved */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.bookdital!.delete();

                    context.pushNamed('HomePage_Admin');
                  },
                  child: Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'fn2bx930' /* Reject */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
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
