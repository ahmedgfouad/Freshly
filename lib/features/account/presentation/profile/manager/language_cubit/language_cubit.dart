import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:store/core/utils/constants.dart'; 

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')) {
    _loadLanguage();
  }

  void toggleLanguage() async {
    final newLocale = state.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    await _saveLanguage(newLocale);
    emit(newLocale);
  }

  Future<void> _loadLanguage() async {
    final box = Hive.box(hiveName);
    final langCode = box.get('lang_code', defaultValue: 'en');
    emit(Locale(langCode));
  }

  Future<void> _saveLanguage(Locale locale) async {
    final box = Hive.box(hiveName);
    await box.put('lang_code', locale.languageCode);
  }
}
