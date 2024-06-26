{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    remind.enable = lib.mkEnableOption "remind";
  };

  config = {
    home.packages = with pkgs; [
      remind
      wyrd
    ];

    home.file.".wyrdrc".text = ''
      # Wyrd run-configuration file

      # command for the Remind executable
      set remind_command="remind"
      # the default reminder file or directory to display
      set reminders_file="$HOME/cali/cal.rem"
      # command for editing an old appointment, given a line number %line% and filename %file%
      set edit_old_command="$EDITOR +%line% \"%file%\""
      # command for editing a new appointment, given a filename %file%
      set edit_new_command="$EDITOR +999999 \"%file%\""
      # command for free editing of the reminders file, given a filename %file%
      set edit_any_command="$EDITOR \"%file%\""

      # templates for creating new appointments
      # %monname% -> month name, %mon% -> month number, %mday% -> day of the month,
      # %year% -> year, %hour% -> hour, %min% -> minute, %wdayname% -> weekday name
      # %wday% -> weekday number
      set timed_template="REM %monname% %mday% %year% AT %hour%:%min% DURATION 1:00 MSG "
      set untimed_template="REM %monname% %mday% %year% MSG "

      # weekly recurrence
      set template0="REM %wdayname% AT %hour%:%min% DURATION 1:00 MSG "
      set template1="REM %wdayname% MSG "

      # monthly recurrence
      set template2="REM %mday% AT %hour%:%min% DURATION 1:00 MSG "
      set template3="REM %mday% MSG "


      # algorithm to use for determining busy level
      # "1" -> count the number of reminders in each day
      # "2" -> count the number of hours of reminders in each day
      set busy_algorithm="1"
      # for busy_algorithm="2", assume that untimed reminders occupy this many minutes
      set untimed_duration="60"

      # if busy_algorithm="1", number of reminders per day allowed for each calendar
      # colorization level; if busy_algorithm="2", use number of hours of reminders
      # per day
      set busy_level1="1"   # level1 color
      set busy_level2="3"   # level2 color
      set busy_level3="5"   # level2 color, bold
      set busy_level4="7"   # level3 color
                            # (everything else is level3 color, bold)


      # first day of the week is Sunday
      set week_starts_monday="false"

      # 12/24 hour time settings
      set schedule_12_hour="true"
      set selection_12_hour="true"
      set status_12_hour="true"
      set description_12_hour="true"

      # whether or not to keep the cursor centered when scrolling through timed
      # reminders
      set center_cursor="false"

      # date syntax for the 'go to date' command can be big or little endian
      set goto_big_endian="true"
      # date syntax for the "quick reminder" command can be US style
      # (6/1 -> June 1) or non-US style (6/1 -> January 6)
      set quick_date_US="true"

      # whether or not to number weeks within the month calendar
      set number_weeks="false"

      # whether or not the cursor should follow the current time
      # after pressing the "home" key
      set home_sticky="true"

      # whether or not to display advance warnings
      set advance_warning="false"

      # width of the untimed reminders window
      set untimed_window_width="40"

      # whether or not to render untimed reminders in boldface
      set untimed_bold="true"


      # key bindings
      bind "j"                 scroll_down
      bind "<down>"            scroll_down
      bind "k"                 scroll_up
      bind "<up>"              scroll_up
      bind "h"                 switch_window
      bind "l"                 switch_window
      bind "<left>"            switch_window
      bind "<right>"           switch_window
      bind "<pageup>"          previous_day
      bind "4"                 previous_day
      bind "<"                 previous_day
      bind "H"                 previous_day
      bind "\\Cu"              previous_day
      bind "\\Cd"              next_day
      bind "<pagedown>"        next_day
      bind "6"                 next_day
      bind ">"                 next_day
      bind "L"                 next_day
      bind "8"                 previous_week
      bind "["                 previous_week
      bind "K"                 previous_week
      bind "2"                 next_week
      bind "]"                 next_week
      bind "J"                 next_week
      bind "{"                 previous_month
      bind "}"                 next_month
      bind "<home>"            home
      bind "\\Ct"            home
      bind "g"                 goto
      bind "z"                 zoom
      bind "<return>"          edit
      bind "<enter>"           edit
      bind "e"                 edit_any
      bind "y"                 copy
      bind "X"                 cut
      bind "p"                 paste
      bind "P"                 paste_dialog
      bind "d"                 scroll_description_up
      bind "D"                 scroll_description_down
      bind "a"                 quick_add
      bind "t"                 new_timed
      bind "T"                 new_timed_dialog
      bind "u"                 new_untimed
      bind "U"                 new_untimed_dialog
      bind "w"                 new_template0
      bind "W"                 new_template1
      bind "m"                 new_template2
      bind "M"                 new_template3
      bind "n"                 search_next
      bind "/"                 begin_search
      bind "<tab>"             next_reminder
      bind "r"                 view_remind
      bind "R"                 view_remind_all
      bind "c"                 view_week
      bind "C"                 view_month
      bind "?"                 help
      bind "\\Cl"              refresh
      bind "q"                 quit

      bind "<return>"          entry_complete
      bind "<enter>"           entry_complete
      bind "<backspace>"       entry_backspace
      bind "<esc>"             entry_cancel


      # set up the colors
      color help               blue default
      color timed_default      white default
      color timed_current      yellow default
      color timed_reminder1    black blue
      color timed_reminder2    black yellow
      color timed_reminder3    black green
      color timed_reminder4    black red
      color untimed_reminder   white default
      color timed_date         blue default
      color selection_info     blue default
      color description        blue default
      color status             blue default
      color calendar_labels    blue default
      color calendar_level1    blue default
      color calendar_level2    yellow default
      color calendar_level3    green default
      color calendar_today     yellow default
      color left_divider       blue default
      color right_divider      blue default
    '';
  };
}
