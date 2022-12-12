import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/home_page_cubit.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => HomePageCubit(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  final String buttonTitle = 'Generated';
  final String centerTitle = 'Paste  HEX Code';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            centerTitle,
            style: context.textTheme.headlineSmall,
          ),
          context.emptySizedHeightBoxLow3x,
          Padding(
            padding: context.horizontalPaddingHigh,
            child: TextField(
              controller: context.read<HomePageCubit>().textEditingController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffix: InkWell(
                      borderRadius: BorderRadius.circular(context.lowValue),
                      onTap: () => context
                          .read<HomePageCubit>()
                          .textEditingController
                          .clear(),
                      child: Padding(
                        padding: context.paddingLow,
                        child: Icon(Icons.clear),
                      ))),
            ),
          ),
          context.emptySizedHeightBoxHigh,
          ElevatedButton(
            onPressed: () => context.read<HomePageCubit>().getColorName(),
            child: Text(buttonTitle),
          ),
          context.emptySizedHeightBoxHigh,
          buildResult(),
          BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state.colorModel != null) {
                final color = Color(
                    int.parse('0xff${state.colorModel?.hex?.clean ?? '000'}'));
                return Card(
                  color: color,
                  child: const SizedBox(height: 100, width: 100),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }

  BlocBuilder<HomePageCubit, HomePageState> buildResult() {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        final data =
            'final Color ${state.colorModel?.name?.value?.toLowerCase() ?? ''} = const Color(0xff${state.colorModel?.hex?.clean ?? ''});';
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: (state.colorModel == null) ? 0 : 1,
          child: Padding(
            padding: context.paddingMedium,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  data,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                context.emptySizedWidthBoxLow3x,
                ElevatedButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: data));
                  },
                  child: const Text('Copy'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
