lines = open('input.txt').read().split('\n')

rules = []
updates = []

rrules = True
for line in lines:
    if line == "":
        rrules = False
        continue
    if rrules:
        vals = line.split('|')
        rules.append((int(vals[0]), int(vals[1])))
    else:
        updates.append([int(val) for val in line.split(',')])

ans = 0

for update in updates:
    for rule in rules:
        ok = True
        try:
            l = update.index(rule[0])
            r = update.index(rule[1])
            if l > r:
                ok = False
        except:
            pass
        if not ok:
            break
    if not ok:
        pass
    else:
        ans += update[len(update)//2]

print(ans)

ans2 = 0
for update in updates:
    ok = True
    for rule in rules:
        try:
            l = update.index(rule[0])
            r = update.index(rule[1])
            if l > r:
                ok = False
        except:
            pass
        if not ok:
            break
    if not ok:
        nwupdater = []
        nwupdatel = []
        while len(update) > 1:
            for val in update.copy():
                lr = set()
                for rule in rules:
                    if val == rule[0] and rule[1] in update:
                        lr.add("L")
                    if val == rule[1] and rule[0] in update:
                        lr.add("R")
                if len(lr) == 1:
                    if "R" in lr:
                        nwupdater.insert(0, val)
                    if "L" in lr:
                        nwupdatel.append(val)
                    update.remove(val)
                    break
                else:
                    pass
        nwupdate = [*nwupdatel, *update, *nwupdater]
        for rule in rules:
            ok = True
            try:
                l = nwupdate.index(rule[0])
                r = nwupdate.index(rule[1])
                if l > r:
                    ok = False
            except:
                pass
            if not ok:
                break
        ans2 += nwupdate[len(nwupdate)//2]

print(ans2)

