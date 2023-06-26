import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'searchfilter_model.dart';
export 'searchfilter_model.dart';

class SearchfilterWidget extends StatefulWidget {
  const SearchfilterWidget({Key? key}) : super(key: key);

  @override
  _SearchfilterWidgetState createState() => _SearchfilterWidgetState();
}

class _SearchfilterWidgetState extends State<SearchfilterWidget> {
  late SearchfilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchfilterModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        StreamBuilder<List<DepramentRecord>>(
          stream: queryDepramentRecord(),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme
                        .of(context)
                        .primary,
                  ),
                ),
              );
            }
            List<DepramentRecord> wrapDepramentRecordList = snapshot.data!;
            return SingleChildScrollView(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: List.generate(
                    wrapDepramentRecordList.length, (wrapIndex) {
                  final wrapDepramentRecord = wrapDepramentRecordList[wrapIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final textWidth = getTextWidth(
                          wrapDepramentRecord.departmentName!,
                          TextStyle(fontSize: 18),
                          context, // Pass the BuildContext parameter
                        );
                        final containerWidth = textWidth ; // Adjust padding as needed

                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().searchActive = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: containerWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [Color(0xFF00FE0D), Color(0xFF00D1FD)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                wrapDepramentRecord.departmentName!,
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }

  double getTextWidth(String text, TextStyle style, BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      maxLines: 1,
      textDirection: Directionality.of(context),
    );
    textPainter.layout();
    return textPainter.width;
  }
}
