import 'package:mind_planner/models/diary_entry_model.dart';

extension MoodExtension on DiaryEntry {
  Mood toMood() {
    switch(mood) {
      case 'good':
        return Mood.good;
      case 'bad':
        return Mood.bad;
      case 'happy':
        return Mood.happy;
      case 'sick':
        return Mood.sick;
      case 'sad':
        return Mood.sad;
      case 'excited':
        return Mood.excited;
      case 'irritated':
        return Mood.irritated;
      default:
        return Mood.good;
    }
  }
}

enum Mood {good, bad, happy, sick, sad, excited, irritated}

extension MoodEmoji on Mood {

  String toUEmoji() {
    switch(this) {
      case Mood.good:
        return '\u{1F642}';
      case Mood.bad:
        return '\u{1F620}';
      case Mood.happy:
      return '\u{1F604}';
      case Mood.sick:
        return '\u{1F912}';
      case Mood.sad:
        return '\u{1F622}';
      case Mood.excited:
        return '\u{1F631}';
      case Mood.irritated:
        return '\u{1F624}';
    }
    }

}