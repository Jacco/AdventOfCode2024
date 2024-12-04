x = read("input.txt", String)

y = split(x, "\n")

mx = length(y)

function ch(i, j)
    return i <= mx && j <= mx ? y[i][j] : '*'
end

function part1()
    cnt = 0
    for i = 1:mx
        for j = 1:mx
            if ch(i,j)*ch(i,j+1)*ch(i,j+2)*ch(i, j+3) in ["XMAS","SAMX"]
                cnt = cnt + 1
            end
            if ch(i,j)*ch(i+1,j+1)*ch(i+2,j+2)*ch(i+3, j+3) in ["XMAS","SAMX"]
                cnt = cnt + 1
            end
            if ch(i,j)*ch(i+1,j)*ch(i+2,j)*ch(i+3, j) in ["XMAS","SAMX"]
                cnt = cnt + 1
            end
            if ch(i,j+3)*ch(i+1,j+2)*ch(i+2,j+1)*ch(i+3, j) in ["XMAS","SAMX"]
                cnt = cnt + 1
            end
        end
    end
    return cnt
end

function part2()
    cnt = 0
    for i = 1:mx
        for j = 1:mx
            if j <= length(y)-2 && i <= length(y)-2 && y[i+1][j+1] == 'A'
                if (y[i][j] == 'M' && y[i+2][j+2] == 'S') || (y[i][j] == 'S' && y[i+2][j+2] == 'M')
                    if (y[i+2][j] == 'M' && y[i][j+2] == 'S') || (y[i+2][j] == 'S' && y[i][j+2] == 'M')
                        cnt += 1
                    end
                end
            end
        end
    end
    return cnt
end

println("Answer")
println(part2())
