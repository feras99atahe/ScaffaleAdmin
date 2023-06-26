import '../custom_code/actions/download_file.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
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
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        final containerDataRecord = snapshot.data!;
        return Container(
          width: 500,
          height: 700,
          decoration: BoxDecoration(
            color: Color(0xFF232323),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
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
                          size: 25,
                        ),
                        offIcon: Icon(
                          FFIcons.kbooksfill,
                          color: FlutterFlowTheme.of(context).accent2,
                          size: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: AlignmentDirectional(-0.94, -0.38),
                        child: Image.network(
                          'https://picsum.photos/seed/894/600',
                          width: 188,
                          height: 294,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: AlignmentDirectional(0.30, -0.53),
                        child: Text(
                          containerDataRecord.booktitle!,
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            color: Colors.white,
                          )

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: AlignmentDirectional(0.30, -0.15),
                        child: Text(
                          containerDataRecord.author!,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              color: Colors.white,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              // Generated code for this Row Widget...
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await downloadFile(containerDataRecord.bookpath!,containerDataRecord.booktitle!);

                      },
                      child: Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF00FE0D),Color(0xFF00D1FD) ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child:
                          Text('Download',
                              style:TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontFamily:'Tajawal'
                              )
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
                        context.pushNamed(
                          'review',
                          queryParams: {
                            'bookdetail': serializeParam(
                              containerDataRecord.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF00FE0D),Color(0xFF00D1FD) ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'review',
                                queryParams: {
                                  'bookdetail': serializeParam(
                                    containerDataRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child:
                            Text('More',
                                style:TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontFamily:'Tajawal'
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              ,
            ],
          ),
        );
      },
    );
  }
}
