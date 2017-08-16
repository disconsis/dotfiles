# vim:fileencoding=utf-8

from os import listdir
from collections import OrderedDict

glyph_mapping = OrderedDict([
    (('- youtube',),                                        ''),
    (('firefox', '- vimperator', 'chrome', 'palemoon'),     ''),
    (('okular',),                                         ''),
    (('vmware', 'vmplayer', 'virtualbox'),                ''),
    (('vlc',),                                            ''),
    (tuple(listdir('/usr/games')),                        ''),
    (('terminal',),                                       ''),
    (('uget',),                                           ''),
])
