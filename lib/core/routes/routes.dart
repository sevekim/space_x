import 'package:flutter/material.dart';

class RouteOptions {
  ////////////////////////////////////////////////////////////////////////////
  ///Go to the root
  ///Example
  ///  RouteOptions.goToRoot(
  //   context: context,
  // );
  ////////////////////////////////////////////////////////////////////////////

  static void goToRoot({
    required BuildContext context,
    dynamic extraData,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/',
      (_) => false,
      arguments: extraData,
    );
  }

  ////////////////////////////////////////////////////////////////////////////
  ///Go to the named route
  ///Example
  /// RouteOptions.popUntilNamedModal(
  //   context: context,
  //   namedModal: '/' + paymentCardManageScreen,
  // );
  ////////////////////////////////////////////////////////////////////////////

  static void popUntilNamedModal({
    required BuildContext context,
    String namedModal = '/',
  }) {
    Navigator.popUntil(context, ModalRoute.withName(namedModal));
  }

  ////////////////////////////////////////////////////////////////////////////
  ///Go to the named route
  ///Example
  ///  RouteOptions.pushNamedRoute(
  //   context: context,
  //   namedRoute: paymentCardManageScreen,
  // );
  ////////////////////////////////////////////////////////////////////////////

  static void pushNamedRoute({
    required BuildContext context,
    required String namedRoute,
    dynamic arguments,
  }) {
    Navigator.pushNamed(
      context,
      '/$namedRoute',
      arguments: arguments,
    );
  }

  ////////////////////////////////////////////////////////////////////////////
  ///General Navigate
  ///Example:
  /// RouteOptions.navigateTo(
  //   context: context,
  //   goTo: passwordResetScreen,
  // );
  ////////////////////////////////////////////////////////////////////////////

  static navigateTo({
    required BuildContext context,
    required String goTo,
    dynamic extraData,
    String? screenType,
  }) {
    Widget destination = Container();

    switch (goTo) {
      // case signUpScreen:
      //   destination = const SignUpScreenSelector();
      //   break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destination,
      ),
    );
  }
}
