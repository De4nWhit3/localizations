import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App Title Goes Here',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Returns 'he'
            Text(AppLocalizations.of(context)!.pronoun('male')),
            // Returns 'she'
            Text(AppLocalizations.of(context)!.pronoun('female')),
            // Returns 'they'
            Text(AppLocalizations.of(context)!.pronoun('other')),
            // Add the following code
            Text(AppLocalizations.of(context)!.hello('John')),
            Text(AppLocalizations.of(context)!.nWombats(0)),
            // Returns '1 wombat'
            Text(AppLocalizations.of(context)!.nWombats(1)),
            // Returns '5 wombats'
            Text(AppLocalizations.of(context)!.nWombats(5)),
            Text(
              AppLocalizations.of(context)!.helloEscapedWorld,
              style: const TextStyle(color: Colors.red),
            ),
            Localizations.override(
              context: context,
              locale: const Locale.fromSubtags(languageCode: 'es'),
              // Using a Builder to get the correct BuildContext.
              // Alternatively, you can create a new widget and Localizations.override
              // will pass the updated BuildContext to the new widget.
              child: Builder(
                builder: (context) {
                  // A toy example for an internationalized Material widget.
                  return CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    onDateChanged: (value) {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
