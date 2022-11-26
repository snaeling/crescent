import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/features/authentication/application/auth_provider.dart';
import 'package:crescent/src/features/authentication/data/user_repository.dart';
import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:crescent/src/utils/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = useState(0);
    final pc = usePageController(initialPage: 0);
    const List<Widget> pages = [
      OnboardIntro(),
      OnboardPrimer(),
      OnboardLogin(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: pages.length,
                  controller: pc,
                  onPageChanged: (value) => currentPage.value = value,
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                child: currentPage.value != pages.length - 1
                    ? SizedBox(
                        key: UniqueKey(),
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => pc.nextPage(
                              duration: const Duration(milliseconds: 333),
                              curve: Curves.easeOutQuad),
                          child: const Icon(Icons.arrow_forward),
                        ),
                      )
                    : SizedBox(
                        key: UniqueKey(),
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => pc.previousPage(
                              duration: const Duration(milliseconds: 333),
                              curve: Curves.easeOutQuad),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        ScaleTransition(scale: animation, child: child),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardIntro extends StatelessWidget {
  const OnboardIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          Text(
            "Welcome to eggbird.",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            "A rudimentary implementation of the unofficial cohost API in "
            "an app built with Flutter.",
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class OnboardPrimer extends StatelessWidget {
  const OnboardPrimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          Text(
            "A few things to note...",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'This is an unofficial client, meaning it could break at any time! '
            'If it does, check the project\'s GitHub page to see if there are '
            'any new releases. \n\n Not everything can be '
            'supported within the app, but we\'ll try our best. If you have '
            'feedback, feel free to leave an issue or contribution on the '
            'GitHub page 💖',
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class OnboardLogin extends HookConsumerWidget {
  const OnboardLogin({
    super.key,
  });
  static const emailKey = Key('email');
  static const passwordKey = Key('password');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    final emailRegExp = RegExp(pattern);
    final emailController = useTextEditingController();
    final passController = useTextEditingController();
    final AsyncValue<void> state = ref.watch(logInControllerProvider);
    ref.listen<AsyncValue>(
      logInControllerProvider,
      (_, state) {
        if (!state.isRefreshing && state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error.toString())),
          );
        } else if (state.hasValue) {
          context.router.replaceNamed('/dashboard/home');
        }
      },
    );
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Spacer(),
            Text(
              "To get started, login with your cohost.org account",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your email',
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !emailRegExp.hasMatch(value)) {
                  return 'Invalid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: passController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password should not be empty.';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  state.isLoading
                      ? ElevatedButton(
                          onPressed: () {},
                          child: const CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ref.watch(logInControllerProvider.notifier).logIn(
                                  emailController.text, passController.text);
                            }
                          },
                          child: const Text("Log in"),
                        ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      context.router.replaceNamed('/dashboard/home');
                    },
                    child: const Text("I'd rather be a guest"),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
