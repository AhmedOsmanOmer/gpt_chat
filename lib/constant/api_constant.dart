// SECURITY NOTE: Never commit real API keys to version control.
// For production, use: flutter run --dart-define=OPENAI_API_KEY=sk-...
// and replace the defaultValue below with an empty string.
const String openAiApiKey = String.fromEnvironment(
  'OPENAI_API_KEY',
  defaultValue: 'your-api-key-here',
);
