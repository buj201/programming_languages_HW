def f(x):
    if x == 0:
        return 0
    else:
        return 1 + g(x - 1)

def g(x):
    if x == 0:
        return 0
    else:
        return 2 + f(x - 1)

def f_tc(x, accum = 0):
    if x == 0:
        return accum
    else:
        return g_tc(x - 1, accum + 1)

def g_tc(x, accum = 0):
    if x == 0:
        return accum
    else:
        return f_tc(x - 1, accum + 2)

def fg_iter(x, func):
    accum = 0
    while x != 0:
        if func == 'f':
            accum = accum + 1
            func = 'g'
        elif func == 'g':
            accum = accum + 2
            func = 'f'
        else:
            raise ValueError
        x = x - 1
    return accum


f_vals = [f(x) for x in range(11)]
g_vals = [g(x) for x in range(11)]
f_tc_vals = [f_tc(x) for x in range(11)]
g_tc_vals = [g_tc(x) for x in range(11)]
fg_iter_g = [fg_iter(x, 'g') for x in range(11)]
fg_iter_f = [fg_iter(x, 'f') for x in range(11)]

print f_vals
print fg_iter_f
print '\n'
print g_vals
print fg_iter_g


print 'f_vals == f_tc_vals:', f_tc_vals == f_vals
print "f_vals == fg_iter_f", fg_iter_f == f_vals

print 'g_vals == g_tc_vals:', g_tc_vals == g_vals
print "f_vals == fg_iter_g", fg_iter_g == g_vals
