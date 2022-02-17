import 'package:flutter_oauth_example/constants/route_name.dart';
import 'package:flutter_oauth_example/locator.dart';
import 'package:flutter_oauth_example/services/oauth_service.dart';

import 'package:flutter_oauth_example/ui/shared/shared_style.dart';
import 'package:flutter_oauth_example/ui/shared/ui_helper.dart';
import 'package:flutter_oauth_example/ui/widgets/button_widget.dart';
import 'package:flutter_oauth_example/ui/widgets/text_field_widget.dart';
import 'package:flutter_oauth_example/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
//import 'package:provider_architecture/provider_architecture.dart';
import 'package:stacked/stacked.dart';

// import flutter services
import 'package:flutter/services.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: LoadingOverlay(
          isLoading: model.busy,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      verticalSpaceMassive,
                      Text(
                        'Survey PPTIK',
                        style: titleTextStyle,
                      ),
                      verticalSpaceMassiveSignup,
                      ButtonWidget(
                        title: 'Login',
                        onPressedFunction: () {
                          print("AAA");
                          model.loginAccount(context);
                        },
                      ),
                      verticalSpaceSmall,

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}