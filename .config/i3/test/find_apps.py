#!/usr/bin/python3

# TODO: implement locking mechanism
# TODO: fix last app remaining on closing all of them

import subprocess as proc
import i3ipc
from time import sleep
from collections import defaultdict
import re


def classify_windows(i3):
    windows = i3.get_tree().leaves()
    workspace_content = defaultdict(list)
    for window in windows:
        workspace_content[window.workspace()].append(window)
    return workspace_content


def find_apps(windows):
    apps = []
    for window in windows:
        if window.name is None:
            continue
        app = get_app(window.name)
        if app is not None:
            apps.append(app)
    return apps


def get_app(title):
    download_regex = re.compile('^uGet( - (\d+) tasks)?$')
    match = download_regex.fullmatch(title)
    if match is None:
        pass
    elif match.groups() == (None, None):
        return ''
    else:
        num_tasks = match.group(2)
        print(match.groups())
        return ' +{}'.format(num_tasks)

    browser_regex = [
        re.compile('^((.+) - )?Mozilla Firefox$'),
        re.compile('^((.+) - )?Vimperator$'),
    ]
    for reg in browser_regex:
        match = reg.fullmatch(title)
        if match is None:
            continue
        elif len(match.groups()) == 1:  # implies no subtitle
            return ''
        else:
            yt_regex = re.compile('^(.+ - )?YouTube$')
            if yt_regex.fullmatch(str(match.group(2))):
                return ''
            return ''

    okular_regex = re.compile('^(.+ – )?Okular$')  # IMP: the dash is abnormal
    if okular_regex.fullmatch(title):
        return ''

    vm_regex = [
        re.compile('^(.+ - )?VMware Workstation 12 Player (Non-commercial use only)$'),
        re.compile('^(.+ (\[.+\]) - )?Oracle VM VirtualBox Manager$')
    ]
    for reg in vm_regex:
        if reg.fullmatch(title):
            return ''

    media_regex = re.compile('^(.* - )?VLC media player$')
    if media_regex.fullmatch(title):
        return ''

    # TODO: steam
    if title == 'Terminal':
        return ''

    return None


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
    if not len(windows):
        return
    apps = find_apps(windows)
    try:
        new_name = get_new_name(workspace, apps)
    except ValueError:
        proc.call(['i3-nagbar', '-m',
                   '"too many `:` in workspace {}"'.format(workspace.num)])
        return
    else:
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
