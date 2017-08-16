# TODO: implement locking mechanism
# TODO: fix last app remaining on closing all of them

from glyphs import glyph_mapping
import subprocess as proc
import i3ipc
from time import sleep
from collections import defaultdict


def classify_windows(i3):
    windows = i3.get_tree().leaves()
    workspace_content = defaultdict(list)
    for window in windows:
        workspace_content[window.workspace()].append(window)
    return workspace_content


def find_apps(windows):
    if not len(windows):
        return ['-']
    apps = []
    for window in windows:
        found = False
        for entry in glyph_mapping:
            for app in entry:
                if app in window.name.lower():
                    apps.append(glyph_mapping[entry])
                    found = True
                    break
            if found:
                break
    if not len(apps):
        apps = ['?']
    return apps


def get_new_name(workspace, apps):
    # unnamed workspace
    count = workspace.name.count(':')
    if count in {0, 1}:
        new_name = '{}: {}'.format(workspace.num, ' '.join(apps))
    # named workspace
    elif count == 2:
        custom_name = workspace.name.split(':')[1]
        new_name = '{}:{}: {}'.format(workspace.num, custom_name,
                                      ' '.join(apps))
    else:
        raise ValueError
    return new_name


def rename_workspace(i3, workspace, windows):
    apps = find_apps(windows)
    try:
        new_name = get_new_name(workspace, apps)
    except ValueError:
        proc.call(['i3-nagbar', '-m',
                   '"too many `:` in workspace {}"'.format(workspace.num)])
        return

    if new_name != workspace.name:
        i3.command('rename workspace "{}" to "{}"'.format(workspace.name,
                                                          new_name))


if __name__ == '__main__':
    i3 = i3ipc.Connection()
    while True:
        workspace_content = classify_windows(i3)
        for workspace in workspace_content.keys():
            windows = workspace_content[workspace]
            rename_workspace(i3, workspace, windows)
        sleep(0.5)
