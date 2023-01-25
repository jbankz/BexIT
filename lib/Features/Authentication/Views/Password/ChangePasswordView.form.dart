// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String CurrentPasswordValueKey = 'currentPassword';
const String NewPasswordValueKey = 'newPassword';

final Map<String, TextEditingController>
    _ChangePasswordViewTextEditingControllers = {};

final Map<String, FocusNode> _ChangePasswordViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ChangePasswordViewTextValidations = {
  CurrentPasswordValueKey: null,
  NewPasswordValueKey: null,
};

mixin $ChangePasswordView on StatelessWidget {
  TextEditingController get currentPasswordController =>
      _getFormTextEditingController(CurrentPasswordValueKey);
  TextEditingController get newPasswordController =>
      _getFormTextEditingController(NewPasswordValueKey);
  FocusNode get currentPasswordFocusNode =>
      _getFormFocusNode(CurrentPasswordValueKey);
  FocusNode get newPasswordFocusNode => _getFormFocusNode(NewPasswordValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_ChangePasswordViewTextEditingControllers.containsKey(key)) {
      return _ChangePasswordViewTextEditingControllers[key]!;
    }
    _ChangePasswordViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ChangePasswordViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ChangePasswordViewFocusNodes.containsKey(key)) {
      return _ChangePasswordViewFocusNodes[key]!;
    }
    _ChangePasswordViewFocusNodes[key] = FocusNode();
    return _ChangePasswordViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    currentPasswordController.addListener(() => _updateFormData(model));
    newPasswordController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    currentPasswordController.addListener(() => _updateFormData(model));
    newPasswordController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CurrentPasswordValueKey: currentPasswordController.text,
          NewPasswordValueKey: newPasswordController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        CurrentPasswordValueKey: _getValidationMessage(CurrentPasswordValueKey),
        NewPasswordValueKey: _getValidationMessage(NewPasswordValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _ChangePasswordViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_ChangePasswordViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ChangePasswordViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ChangePasswordViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ChangePasswordViewTextEditingControllers.clear();
    _ChangePasswordViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get currentPasswordValue =>
      this.formValueMap[CurrentPasswordValueKey] as String?;
  String? get newPasswordValue =>
      this.formValueMap[NewPasswordValueKey] as String?;

  bool get hasCurrentPassword =>
      this.formValueMap.containsKey(CurrentPasswordValueKey) &&
      (currentPasswordValue?.isNotEmpty ?? false);
  bool get hasNewPassword =>
      this.formValueMap.containsKey(NewPasswordValueKey) &&
      (newPasswordValue?.isNotEmpty ?? false);

  bool get hasCurrentPasswordValidationMessage =>
      this.fieldsValidationMessages[CurrentPasswordValueKey]?.isNotEmpty ??
      false;
  bool get hasNewPasswordValidationMessage =>
      this.fieldsValidationMessages[NewPasswordValueKey]?.isNotEmpty ?? false;

  String? get currentPasswordValidationMessage =>
      this.fieldsValidationMessages[CurrentPasswordValueKey];
  String? get newPasswordValidationMessage =>
      this.fieldsValidationMessages[NewPasswordValueKey];
}

extension Methods on FormViewModel {
  setCurrentPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CurrentPasswordValueKey] =
          validationMessage;
  setNewPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NewPasswordValueKey] = validationMessage;
}
