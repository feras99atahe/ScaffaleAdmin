import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_bottomsheet_model.dart';
export 'login_bottomsheet_model.dart';

class LoginBottomsheetWidget extends StatefulWidget {
  const LoginBottomsheetWidget({Key? key}) : super(key: key);

  @override
  _LoginBottomsheetWidgetState createState() => _LoginBottomsheetWidgetState();
}

class _LoginBottomsheetWidgetState extends State<LoginBottomsheetWidget>
    with TickerProviderStateMixin {
  late LoginBottomsheetModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginBottomsheetModel());

    _model.emailTextController ??= TextEditingController();
    _model.passwordTextController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        width: double.infinity,
        height: 430.0,
        decoration: BoxDecoration(
          color: Color(0xFF232323),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 80.0,
              child: Divider(
                height: 2.0,
                thickness: 3.0,
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Container(
                    width: 350.0,
                    child: TextFormField(
                      controller: _model.emailTextController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'rlvczm24' /* Email */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily: 'Cairo',
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                        prefixIcon: Icon(
                          FFIcons.kuserpath,
                          size: 24.0,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      textAlign: TextAlign.start,
                      validator: _model.emailTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Container(
                    width: 350.0,
                    child: TextFormField(
                      controller: _model.passwordTextController,
                      autofocus: true,
                      obscureText: !_model.passwordVisibility,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          't8uc8xn0' /* Password */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily: 'Cairo',
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                        prefixIcon: FaIcon(
                          FontAwesomeIcons.eyeSlash,
                          size: 24.0,
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => _model.passwordVisibility =
                                !_model.passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Cairo',
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                      textAlign: TextAlign.start,
                      validator: _model.passwordTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();

                    final user = await authManager.signInWithEmail(
                      context,
                      _model.emailTextController.text,
                      _model.passwordTextController.text,
                    );
                    if (user == null) {
                      return;
                    }

                    if (valueOrDefault<bool>(
                        currentUserDocument?.isAdmin, false)) {
                      context.pushNamedAuth('HomePage_Admin', mounted);
                    } else {
                      context.pushNamedAuth('Final_Login', mounted);
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'kua48te5' /* Login */,
                  ),
                  options: FFButtonOptions(
                    width: 350.0,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
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
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ],
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('final_Recoerpassword');
              },
              child: Text(
                FFLocalizations.of(context).getText(
                  'zeeu7xvr' /* Forget password? */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Cairo',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            SizedBox(
              width: 350.0,
              child: Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('final_Singup');
              },
              child: Text(
                FFLocalizations.of(context).getText(
                  'wh0k6ac5' /* Create an account */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Cairo',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    FFLocalizations.of(context).getText(
                      '7m2famxt' /* Use a social platform to conti... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      final user = await authManager.signInWithGoogle(context);
                      if (user == null) {
                        return;
                      }

                      context.goNamedAuth('HomePage_Admin', mounted);
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryText,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x3314181B),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x3314181B),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FaIcon(
                      FontAwesomeIcons.apple,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 30.0,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      final user =
                          await authManager.signInWithFacebook(context);
                      if (user == null) {
                        return;
                      }

                      context.goNamedAuth('HomePage_Admin', mounted);
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryText,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x3314181B),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animateOnActionTrigger(
        animationsMap['containerOnActionTriggerAnimation']!,
      ),
    );
  }
}
