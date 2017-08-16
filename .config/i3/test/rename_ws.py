# TODO: renaming doesn't work the first time around if no recognized apps
# TODO: renaming doesn't work if no ":"

import i3ipc
import subprocess as proc
import sys


def read_name():
    return proc.check_output(['zenity',
                              '--entry',
                              '--title=i3-rename',
                              '--text=new name?'])[:-1].strip().decode('utf-8')


def get_new_name(workspace):
    input_name = read_name()
    count = workspace.name.count(':')
    # unnamed workspace
    if count in {0, 1}:
        apps = workspace.name.split(':')[1]
    # named workspace
    elif count == 2:
        apps = workspace.name.split(':')[2]
    else:
        raise ValueError

    new_name = "{}: {}:{}".format(workspace.num, input_name, apps)
    return new_name


def rename(workspace):
    try:
        new_name = get_new_name(workspace)
    except ValueError:
        proc.call(['i3-nagbar', '-m',
                   '"too many `:` in workspace {}"'.format(workspace.num)])
        return

    if new_name != workspace.name:
        workspace.command(
            'rename workspace "{}" to "{}"'.format(workspace.name,
                                                   new_name))


def remove(workspace):
    assert workspace.name.count(':') == 2, "invalid workspace name structure"
    split_name = workspace.name.split(':')
    new_name = ':'.join((split_name[0], split_name[2]))
    workspace.command('rename workspace "{}" to "{}"'.format(workspace.name,
                                                             new_name))


if __name__ == '__main__':
    if len(sys.argv) != 2 or sys.argv[1] not in {'rename', 'remove'}:
        print('invalid call')
        print('call with → {0} or {0} remove'.format(sys.argv[0]))
        exit()

    i3 = i3ipc.Connection()
    curr_workspace = i3.get_tree().find_focused().workspace()
    if sys.argv[1] == 'rename':
        rename(curr_workspace)
    elif sys.argv[1] == 'remove':
        remove(curr_workspace)
