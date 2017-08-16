# vim:fileencoding=utf-8

import json
import subprocess as proc


def get_curr_workspace_num():
    workspace_js = proc.check_output(['i3-msg', '-t', 'get_workspaces'])
    workspace_js = json.loads(workspace_js.decode('utf-8'))
    for elem in workspace_js:
        if elem['focused'] is True:
            return elem['num']
    raise


name_glyph = {
    ('term', 'terminal'):                       '',
    ('firefox', 'browser'):                     '',
    ('entt', 'entertainment'):                  '',
    ('yt', 'youtube'):                          '',
    ('game', 'games', 'play', 'steam'):         '',
    ('irc', 'weechat', 'irssi'):                '',
    ('pdf', 'book', 'books'):                   '',
    ('vm', 'vmware', 'vmplayer', 'virtualbox'): ''
}

if __name__ == '__main__':
    curr_num = get_curr_workspace_num()
    input_name = proc.check_output(['zenity',
                                    '--entry',
                                    '--title=i3-rename',
                                    '--text=new name?'])[:-1].strip()
    for names in name_glyph:
        if input_name.lower() in names:
            new_name = name_glyph[names]
            break
    else:
        new_name = input_name

    proc.call(['i3-msg',
               'rename workspace to "{}: {}"'.format(curr_num, new_name)])
