local org = require('orgmode')

org.setup_ts_grammar()
org.setup({
    org_agenda_files = "~/Notes/**/*",
    org_default_notes_file = "~/Notes/refile.org",
    win_split_mode = "horizontal",
    org_todo_keywords = { "TODO(t)", "PROG", "|", "DONE", "WAITING", "CANCELLED" },
    org_deadline_warning_days = 14,
    org_capture_templates = {
        t = {
            description = 'Task',
            template = '** TODO %?\n ',
            target = '~/Notes/refile.org',
            headline = 'Tasks'
        },

        T = {
            description = "Task - Today",
            template = '** TODO %?\nDEADLINE: %t',
            target = '~/Notes/refile.org',
            headline = 'Tasks'
        },

        n = {
            description = 'Note',
            template = '** %?\n',
            target = '~/Notes/refile.org',
            headline = 'Notes'
        },

        w =  'Watchlist',
        wm = {
            description = 'Movie',
            template = '** TODO %?\n ',
            target = '~/Notes/watchlist.org',
            headline = 'Movies'
        },
        wb = {
            description = 'Book',
            template = '** TODO %?\n ',
            target = '~/Notes/watchlist.org',
            headline = 'Books'
        },
        ws = {
            description = 'Show / Anime',
            template = '** TODO %?\n ',
            target = '~/Notes/watchlist.org',
            headline = 'Shows / Anime'
        },
    },

    org_startup_folded = 'content',
    org_agenda_skip_scheduled_if_done = true,
    org_agenda_skip_deadline_if_done = true,
    org_tags_column = 0,
    org_use_tag_inheritance = true,
    org_tags_exclude_from_inheritance = {},
    org_hide_leading_stars = false,
    org_hide_emphasis_markers = false,
    org_ellipsis = ' ▾',
    org_log_done = 'time',
    org_blank_before_new_entry = {
        heading = false,
        plain_list_item = false,
    }})
