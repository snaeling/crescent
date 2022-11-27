import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectPageDialog extends HookWidget {
  const SelectPageDialog({
    super.key,
    this.currentPage = 0,
    required this.onSelect,
  });
  final Function(int page) onSelect;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    final page = useState(currentPage);
    final FixedExtentScrollController controller =
        useFixedExtentScrollController(initialItem: page.value);
    final textController = useTextEditingController();

    List<Widget> numbers = [];
    numbers = List<Widget>.generate(
      100,
      (index) => Card(
        child: SizedBox(
          width: 100,
          child: Center(
            child: Text(
              index.toString(),
            ),
          ),
        ),
      ),
    );
    return Dialog(
      child: SizedBox(
        height: 400,
        width: 300,
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: ListWheelScrollView(
                controller: controller,
                onSelectedItemChanged: (value) {
                  page.value = value;
                },
                useMagnifier: true,
                physics: const FixedExtentScrollPhysics(),
                itemExtent: 75,
                perspective: 0.009,
                magnification: 1.5,
                children: numbers,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: textController,
                      onChanged: (value) {
                        if (value == "") return;
                        var p = int.parse(value);
                        page.value = p;
                        if (p > numbers.length) return;
                        controller.jumpToItem(p);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                      onPressed: () {
                        onSelect(page.value);
                        Navigator.of(context).pop();
                      },
                      child: Text('Go to page ${page.value}')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

FixedExtentScrollController useFixedExtentScrollController({
  String? debugLabel,
  int initialItem = 0,
  List<Object?>? keys,
}) {
  return use(
    _FixedExtentScrollControllerHook(
      debugLabel: debugLabel,
      initialItem: initialItem,
      keys: keys,
    ),
  );
}

class _FixedExtentScrollControllerHook
    extends Hook<FixedExtentScrollController> {
  const _FixedExtentScrollControllerHook({
    this.debugLabel,
    this.initialItem,
    List<Object?>? keys,
  }) : super(keys: keys);

  final String? debugLabel;
  final int? initialItem;

  @override
  HookState<FixedExtentScrollController, Hook<FixedExtentScrollController>>
      createState() => _FixedExtentScrollControllerHookState(
            initialItem: initialItem,
          );
}

class _FixedExtentScrollControllerHookState extends HookState<
    FixedExtentScrollController, _FixedExtentScrollControllerHook> {
  late final int? initialItem;

  _FixedExtentScrollControllerHookState({
    required this.initialItem,
  });

  late final controller = FixedExtentScrollController(
    initialItem: initialItem ?? 0,
  );

  @override
  FixedExtentScrollController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'useFixedExtentScrollController';
}
