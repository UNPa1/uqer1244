local n = io.read("*n")
local a={}
local stdyhlf = {}
for i = 1, n, 1 do
    a[i]=io.read("*n")
end

local remaintime = 0

local istimereset = true
for i=1 , n , 1 do
    if istimereset==true then
        remaintime = 30
    end
     --시간 초기화
--[[
    a[1] == 20 i번챕터를 공부하는 시간이 남은시간보다 더 길때,
    남은시간을 보고 판단하기 (절반이상)
]]--
    if a[i] > remaintime then --a[2]==40 remaintime==10
        if a[i]/2 > remaintime then --절반이상
            stdyhlf[i]=false
            istimereset=true
        else
            stdyhlf[i]=true
            istimereset=true
        end
    elseif a[i] < remaintime then --남은시간이 더 길때, 전부 공부하고 다음챕터로 넘어감
        remaintime=remaintime-a[i] --남은시간 == 10
        stdyhlf[i]=true --기록
        istimereset=false
    elseif a[i]==remaintime then --딱 30일때
        stdyhlf[i]=true
        istimereset=true
    end
end

local cnt = 0
for i = 1, n, 1 do
    if stdyhlf[i]==true then
        cnt=cnt+1
    end
end

print(cnt)