import json
import subprocess as proc
from collections import OrderedDict
from rename_workspace import name_glyph
from os import listdir
from time import sleep


preset_titles = OrderedDict()
preset_titles[('terminal',)] = 'terminal'
preset_titles[('okular',)] = 'pdf'
preset_titles[tuple(listdir('/usr/games'))] = 'game'
preset_titles[('vmware', 'virtualbox')] = 'vm'
preset_titles[('vimperator', 'firefox')] = 'firefox'
preset_titles[('youtube',)] = 'youtube'


def get_tree():
    "get the layout tree from i3"
    tree_js = proc.check_output(['i3-msg', '-t', 'get_tree']).decode('utf-8')
    root = json.loads(tree_js)
    return root


def get_outputs(root):
    "get the list of layouts tree for output monitors"
    return list(filter(lambda node: node.get('name') != '__i3', root['nodes']))


def get_workspace_nodes(outputs):
    "get the list of layout trees for workspaces"
    workspaces = []
    for output in outputs:
        contents = next(node for node in output.get('nodes')
                        if node.get('name') == 'content')
        workspaces.extend(filter(lambda node: 'num' in node.keys(),
                                 contents.get('nodes')))
    return workspaces


def get_apps_from_workspace(workspace):
    "get the list of application nodes for the workspace"
    apps = []

    def rec_util(node, apps):
        if node.get('name', 'None') not in {'None', None}:
            apps.append(node)
        for child in node.get('nodes'):
            rec_util(child, apps)

    for node in workspace.get('nodes'):
        rec_util(node, apps)
    return apps


def get_presets_from_apps(apps):
    "get the list of apps for which presets are set"
    presets_found = []
    for app in apps:
        app_name = app.get('name').lower().strip()
        app_preset = None
        for presets_entry in preset_titles:
            for preset in presets_entry:
                if preset in app_name:
                    app_preset = preset_titles[presets_entry]
                    break
        if app_preset is not None:
            presets_found.append(app_preset)
    return presets_found


def get_glyphs_from_presets(presets):
    "turns the list of presets into glyphs"
    glyphs = []
    for preset in presets_found:
        glyph = None
        for names_entry in name_glyph:
            for name in names_entry:
                if preset == name:
                    glyph = name_glyph[names_entry]
                    break
            if glyph is not None:
                glyphs.append(glyph)
                break
    return glyphs


def rename_workspace(workspace, glyphs):
    "rename workspace with the list of glyphs"
    new_name = "{}: {}".format(workspace.get('num'), ' '.join(glyphs))
    if workspace.get('name') != new_name:
        proc.call(['i3-msg', 'rename workspace "{}" to "{}"'.format(
            workspace.get('name'), new_name)])


if __name__ == '__main__':
    while True:
        tree = get_tree()
        outputs = get_outputs(tree)
        workspaces = get_workspace_nodes(outputs)
        sleep(0.5)
        for workspace in workspaces:
            apps = get_apps_from_workspace(workspace)
            presets_found = get_presets_from_apps(apps)
            glyphs_found = get_glyphs_from_presets(presets_found)
            rename_workspace(workspace, glyphs_found)
