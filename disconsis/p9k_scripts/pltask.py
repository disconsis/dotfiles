#!/usr/bin/python3

import subprocess as proc
import sys
import re


def get_task_output():
    task_out = proc.check_output('task list'.split()).decode('utf-8')
    task_out = task_out.split('\n')[1:-3]
    return task_out


def is_cont(line):
    return not re.match(r'\s+\d', line)


def get_urgencies(output):
    urg_pos = output[0].find('Urg')
    urgencies = []
    for line in output:
        if not is_cont(line):
            urgencies.append(float(line[urg_pos:].strip()))
    return urgencies


def fg_color(text, color):
    return "%{{%F{{{color}}}%}}{text}%{{%f%}}".format(color=color, text=text)


def main(glyph, glyph_color, text_color):
    task_out = get_task_output()
    urgencies = get_urgencies(task_out)
    max_urg = max(urgencies)
    cnt_urg = urgencies.count(max_urg)
    max_urg = str(max_urg)
    if cnt_urg == 1:
        output = (fg_color(glyph, glyph_color)
                  + '  '
                  + fg_color(max_urg, text_color))
    else:
        cnt_urg = str(cnt_urg)
        output = (fg_color(glyph, glyph_color)
                  + '  '
                  + fg_color('{max}(x{count})'.format(max=max_urg,
                                                      count=cnt_urg),
                             text_color))
    print(output)


if __name__ == '__main__':
    glyph = sys.argv[1]
    glyph_color = sys.argv[2]
    text_color = sys.argv[3]
    main(glyph, glyph_color, text_color)
