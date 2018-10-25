import vim

cw = vim.current.window.buffer.name
for i in vim.windows:
    if i.buffer.name.startswith('term://'):
        vim.command('exe {}."wincmd w"'.format(i.number))
        vim.command('q!')
        for b in vim.windows:
            if b.buffer.name == cw:
                vim.command('exe {}."wincmd w"'.format(b.number))


