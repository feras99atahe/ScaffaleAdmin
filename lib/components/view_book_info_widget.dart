import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_book_info_model.dart';
export 'view_book_info_model.dart';

class ViewBookInfoWidget extends StatefulWidget {
  const ViewBookInfoWidget({
    Key? key,
    this.bookinfo,
  }) : super(key: key);

  final DocumentReference? bookinfo;

  @override
  _ViewBookInfoWidgetState createState() => _ViewBookInfoWidgetState();
}

class _ViewBookInfoWidgetState extends State<ViewBookInfoWidget> {
  late ViewBookInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewBookInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<DataRecord>(
      stream: DataRecord.getDocument(widget.bookinfo!),
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
        final containerDataRecord = snapshot.data!;
        return Container(
          width: 500.0,
          height: 500.0,
          decoration: BoxDecoration(
            color: Color(0xFF232323),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.86, -0.92),
                      child: ToggleIcon(
                        onPressed: () async {
                          setState(() => FFAppState().addtoscaffale =
                              !FFAppState().addtoscaffale);

                          final favoriteCreateData = createFavoriteRecordData(
                            createdBy: currentUserReference,
                            item: containerDataRecord.reference,
                          );
                          await FavoriteRecord.collection
                              .doc()
                              .set(favoriteCreateData);
                        },
                        value: FFAppState().addtoscaffale,
                        onIcon: Icon(
                          FFIcons.kbooksfill,
                          color: Color(0xFF00FF0A),
                          size: 25.0,
                        ),
                        offIcon: Icon(
                          FFIcons.kbooksfill,
                          color: FlutterFlowTheme.of(context).accent2,
                          size: 25.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.94, -0.38),
                      child: Image.network(
                        'https://picsum.photos/seed/894/600',
                        width: 188.0,
                        height: 294.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.12, -0.53),
                      child: Text(
                        containerDataRecord.booktitle!,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.11, -0.15),
                      child: Text(
                        containerDataRecord.author!,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        '780klqpe' /* Download */,
                      ),
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        'ba61f7ph' /* More */,
                      ),
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
