# vim: fileencoding=utf-8

from os import listdir
from collections import OrderedDict

glyph_mapping = OrderedDict([
    (('YouTube',),                                        ''),
    (('Mozilla Firefox', 'Vimperator', 'chrome', 'palemoon'),     ''),
    (('okular',),                                         ''),
    (('vmware', 'vmplayer', 'virtualbox'),                ''),
    (('vlc',),                                            ''),
    (tuple(listdir('/usr/games')),                        ''),
    (('terminal',),                                       ''),
    (('uget',),                                           ''),
])
