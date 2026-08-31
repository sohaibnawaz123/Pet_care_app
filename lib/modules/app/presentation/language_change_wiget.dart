import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/modules/app/presentation/bloc/app_bloc.dart';

class AppLanguage extends StatefulWidget {
  final AppBloc? bloc;

  const AppLanguage({super.key, this.bloc});

  static Future<void> show(
    BuildContext context, {
    AppBloc? bloc,
  }) async {
    final appBloc =
        bloc ?? (GetIt.instance.isRegistered<AppBloc>() ? GetIt.instance<AppBloc>() : AppBloc());

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _LanguageSheet(bloc: appBloc),
    );
  }

  @override
  State<AppLanguage> createState() => _AppLanguageState();
}

class _AppLanguageState extends State<AppLanguage> {
  bool _isOpened = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isOpened) return;
    _isOpened = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      AppLanguage.show(context, bloc: widget.bloc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _LanguageSheet extends StatelessWidget {
  final AppBloc bloc;

  const _LanguageSheet({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
      child: SafeArea(
        top: false,
        child: StreamBuilder<AppState>(
          stream: bloc.stream,
          initialData: bloc.state,
          builder: (context, snapshot) {
            final currentLocale = snapshot.data?.local.languageCode ?? 'en';

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 76,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Select your preferred language type',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColor.black.withValues(alpha: 0.45),
                  ),
                ),
                const SizedBox(height: 22),
                _LanguageButton(
                  label: 'Arabic (العربية)',
                  flag: '🇦🇪',
                  isSelected: currentLocale == 'ar',
                  onTap: () {
                    bloc.add(ChangeToArabic());
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 20),
                _LanguageButton(
                  label: 'English (ENG)',
                  flag: '🇺🇸',
                  isSelected: currentLocale == 'en',
                  onTap: () {
                    bloc.add(ChangeToEnglish());
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final String flag;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.flag,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : AppColor.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppColor.secondary : AppColor.black.withValues(alpha: 0.7),
            width: 1.4,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              flag,
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
