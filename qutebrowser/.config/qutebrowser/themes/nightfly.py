import subprocess

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')

c.colors.statusbar.normal.bg = xresources['*background']

c.colors.completion.even.bg = xresources['*background']
c.colors.completion.odd.bg = xresources['*background']

c.colors.completion.category.bg = '#090c1b'

c.colors.completion.fg = ['#fff',xresources['*foreground'], xresources['*color11']]

c.colors.completion.item.selected.bg = '#61C766'

c.colors.completion.match.fg = xresources['*color9']

c.colors.completion.scrollbar.bg = '#090c1b'

c.colors.keyhint.bg = '#f0090c1b'

c.colors.messages.error.bg = xresources['*color1']

c.colors.tabs.bar.bg = '#090c1b'

c.colors.tabs.even.bg = xresources['*color0']

c.colors.tabs.even.fg = xresources['*foreground']

c.colors.tabs.odd.bg = xresources['*color0']

c.colors.tabs.odd.fg = xresources['*foreground']

c.colors.tabs.selected.even.bg = '#090c1b'

c.colors.tabs.selected.odd.bg = '#090c1b'

c.colors.webpage.darkmode.enabled = True

c.colors.webpage.bg = '#090c1b'

c.completion.shrink = True

