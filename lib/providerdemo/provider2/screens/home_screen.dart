import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providerdemo/provider2/screens/info_card.dart';

import '../themeproviders/theme_provider.dart';
import 'color_picker_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session 2 Consumer Widget'),

        // Rebuilds when theme changes
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,

        actions: [
          // Toggle Dark Mode
          IconButton(
            icon: Consumer<ThemeProvider>(
              builder: (_, theme, __) =>
                  Icon(theme.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            ),

            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),

          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Consumer Widget",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Consumer<ThemeProvider>(
              child: const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "This label never rebuilds (passed as child)",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              builder: (context, theme, staticChild) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  InfoCard(
                  label: "Current Mode",
                  value: theme.isDarkMode ? "Dark Mode" : "Light Mode",
                ),
                InfoCard(
                label: "Accent Mode",
                value: theme.accentColor,
                ),
                staticChild!
                ],
                );
              },
            ),
            SizedBox(height: 28,),
            // ── Section 2: Selector Demo ──────────────────────────
            const Text(
              'Selector Widget (rebuild only on accent change)',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Selector rebuilds ONLY when accentColor changes,
            // not when dark/light mode changes.
            Selector<ThemeProvider, String>(
              selector: (_, p) => p.accentColor,
              builder: (_, accent, __) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Selected accent: $accent\n'
                        '(This rebuilds only when accent color changes)',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),

            const SizedBox(height: 28),

            // ── Section 3: Color Picker ───────────────────────────
            const Text(
              'Pick Accent Color',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ColorPickerRow(),

            const SizedBox(height: 28),

            // ── Section 4: Toggle Button ──────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                // context.read() — no rebuild, just fire an action
                onPressed: () => context.read<ThemeProvider>().toggleTheme(),
                icon: const Icon(Icons.brightness_6),
                label: const Text('Toggle Light / Dark Mode'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
