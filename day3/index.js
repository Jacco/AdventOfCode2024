const fs = require("fs")

contents = fs.readFileSync("input.txt").toString('ascii').split('\n')

rgx = /mul\((?<X>\d{1,3}),(?<Y>\d{1,3})\)/g

function part1() {
    sum = 0
    for(i=0; i<contents.length; i++) {
        s = contents[i]
        do {
            m = rgx.exec(s);
            if (m) {
                sum += (Number(m[1]) * Number(m[2]))
            }
        } while (m);
    }
}

rgx2 = /(do\(\)|don't\(\)|mul\((?<X>\d{1,3}),(?<Y>\d{1,3})\))/g

function part2() {
    sum = 0
    enabled = true
    for(i=0; i<contents.length; i++) {
        s = contents[i]
        do {
            m = rgx2.exec(s);
            if (m) {
                if (m[0] == "don't()") {
                    enabled = false
                } else if (m[0] == "do()") {
                    enabled = true
                } else {
                    if (enabled) {
                        sum += m[2] * m[3]
                    }
                }
            }
        } while (m);
    }
}

part2()

console.log(sum)
